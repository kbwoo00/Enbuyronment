package com.itwill.enbuyronment.controller;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.ProdAndReviewVO;
import com.itwill.enbuyronment.domain.ProductVO;
import com.itwill.enbuyronment.domain.ReviewVO;
import com.itwill.enbuyronment.domain.OrderProdVO;
import com.itwill.enbuyronment.domain.OrderVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.domain.paging.PageMaker;
import com.itwill.enbuyronment.service.OrderService;
import com.itwill.enbuyronment.service.ProdService;
import com.itwill.enbuyronment.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Inject
	private UserService userService;
	@Inject
	private ProdService prodService;
	@Inject
	private OrderService orderService;

	@ModelAttribute("userInfo")
	public UserVO getUserInfo(@SessionAttribute(value = "userId", required = false) String uid) {
		return userService.getUserInfo(uid);
	}
	
	@GetMapping("/userinfo")
	public String userInfo(@SessionAttribute(value = "userId", required = false) String uid,
			Model model
			) {
		
		/*
		 * TODO : 기본 배송지인 address 가져오는 서비스 추가, address 목록 가져오기 서비스 메서드 이름 변경
		 * TODO : userInfo.jsp에 기본배송지, 기본배송지 변경(배송지 추가, 선택) 작업
		 */
		 model.addAttribute("userAddrList", userService.getUserAddr(uid));
		
		return "/user/userinfo";
	}
	
	@PostMapping("/modUser")
	public String modifyUser(@ModelAttribute UserVO inputUser, RedirectAttributes rttr) {
		// 비밀번호가 일치한지 체크
		UserVO user = userService.login(inputUser);

		if (user == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/mypage/userinfo";
		}
		
		if(!inputUser.getNewPass().equals("")) {
			// 비밀번호 변경할 값이 있으면 바꾸기
			inputUser.setPass(inputUser.getNewPass());
		}
		userService.modUser(inputUser);
		userService.modAddr(inputUser);
		
		rttr.addFlashAttribute("msg", "modSuccess");
		
		return "redirect:/mypage/userinfo";
	}
	
	@GetMapping("/withdrawal")
	public String withdrawalForm(@SessionAttribute(value = "userId", required = false) String uid,
			Model model){
		
		model.addAttribute("userId", uid);

		return "/user/withdrawal";
	}
	
	@PostMapping("/withdrawal")
	public String withdrawal(@ModelAttribute UserVO inputUser, RedirectAttributes rttr,
			HttpServletRequest request
			) {
		UserVO user = userService.login(inputUser);
		
		if(user == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/mypage/withdrawal";
		}
		
		userService.withdrawal(user);
		// 메인페이지에서 rttr 회원탈퇴성공했습니다. 메시지
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/review")
	public String myReview(@SessionAttribute(value = "userId", required = false) String uid, 
			@ModelAttribute Criteria cri, Model model
			) {
		
		cri.setPerDataCnt(5);
		List<ProdAndReviewVO> reviewList = userService.getReviewList(uid, cri);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(userService.getReviewTotalCnt(uid));
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageInfo", pm);
		model.addAttribute("presentPage", cri.getPage());
		log.info("리뷰 목록 = {}", reviewList);
		
		return "/user/my_review";
	}
	
	@ResponseBody
	@PostMapping("/addNewAddr")
	public void addNewAddr(@RequestBody AddressVO addr,
			@SessionAttribute(value = "userId", required = false) String uid, HttpServletResponse response
			) {
		
		log.info("새로운 배송지 = {}", addr);
		
		// 유저의 기존의 배송지명과 같으면 에러
		AddressVO isPresentAddr = userService.getOneAddr(uid, addr.getAddrName());
		if(isPresentAddr != null) {
			try {
				response.sendError(400);
			} catch (IOException e) {
				e.printStackTrace();
			} 
			return;
		}
		
		userService.addAddr(addr, uid);
	}
	
	@ResponseBody
	@PostMapping(value = "/delAddr")
	public void delAddr(@RequestBody AddressVO addr,
			@SessionAttribute(value = "userId", required = false) String uid, HttpServletResponse response
			) {
		
		AddressVO delAddr = userService.getOneAddr(uid, addr.getAddrName());
		log.info("삭제할 주소 = {}", delAddr);
		
		if(delAddr.getStatus() == 0) {
			try {
				response.sendError(400);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			userService.delAddr(delAddr);
		}
	}
	
	@ResponseBody
	@PostMapping("/review/delete")
	public void delReview(@RequestBody String reviewNo) {
		userService.delReview(Integer.parseInt(reviewNo));
	}
	
	@GetMapping("/review/{reviewNo}/update")
	public String modReviewForm(@PathVariable("reviewNo") String reviewNo,
			@SessionAttribute(value = "userId", required = false) String uid, Model model
			) {
		
		ProdAndReviewVO review = userService.getReview(Integer.parseInt(reviewNo));
		
		model.addAttribute("review", review);
		
		return "/user/modify_review";
	}
	
	@ResponseBody
	@PostMapping("/review/{reviewNo}/update")
	public void modReview(@PathVariable("reviewNo") String reviewNo,
			@SessionAttribute(value = "userId", required = false) String uid,
			@RequestBody ReviewVO review
			) {
		log.info("review = {}", review);
		review.setReviewNo(Integer.parseInt(reviewNo));
		userService.modReview(review);
	}
	
	@GetMapping("/review/write")
	public String writeReviewForm(@RequestParam("prodNo") String prodNo, Model model,
			@SessionAttribute(value = "userId", required = false) String uid, RedirectAttributes rttr
			) throws Exception {

		ReviewVO review = userService.getReview(uid, prodNo);

		log.info("리뷰 = {}", review);

		if(review != null) {
			rttr.addFlashAttribute("msg","상품 하나당 하나의 리뷰만 가능합니다. 수정페이지로 이동합니다.");
			return "redirect:/mypage/review/" + review.getReviewNo() + "/update";
		}
		
		ProductVO product = prodService.prodDetail(Integer.parseInt(prodNo));
		log.info("상품 = {}", product);
		model.addAttribute("product", product);
		
		return "/user/write_review";
	}
	
	@ResponseBody
	@PostMapping("/review/write")
	public void writeReview(@RequestParam("prodNo") String prodNo,
			@RequestBody ReviewVO review, HttpServletResponse response,
			@SessionAttribute(value = "userId", required = false) String uid){
		
		review.setProdNo(Integer.parseInt(prodNo));
		review.setUid(uid);
		
		// 기존에 상품에 작성한 리뷰가 있으면 또 작성하게 하면 안됨.
		if(userService.isPresentReview(review)) {
			try {
				response.sendError(400);
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		userService.writeReview(review);
	}
	
	@GetMapping("/orderList")
	public String myOrderList(
			@SessionAttribute(value = "userId", required = false) String uid,
			Model model, @ModelAttribute Criteria cri,
			@RequestParam(value = "keyword", required = false) String keyword
			) {
		log.info("주문내역 기간 = {}", cri);
		cri.setPerDataCnt(5);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(userService.getUserOrderTotalCnt(uid, keyword, cri));
		log.info("주문내역 총 개수 = {}", pm.getTotalCount());
		model.addAttribute("pageInfo", pm);
		model.addAttribute("cri", cri);
		
		Map<OrderVO, List<OrderProdVO>> orderAndProdList;
		if(keyword == null) {
			orderAndProdList = userService.getOrders(uid, cri);
		} else {
			orderAndProdList = userService.getOrdersByKeyword(uid, cri, keyword);
			model.addAttribute("keyword", keyword);
		}
		model.addAttribute("orderList", orderAndProdList);
		
		return "/user/my_order";
	}
	
	@GetMapping("/order/{orderNo}")
	public String myOrderDetail(@PathVariable("orderNo") String orderNo, 
			@SessionAttribute(value = "userId", required = false) String uid
			,Model model) {
		OrderVO order = orderService.getOrder(orderNo);
		order.setUid(uid);
		List<OrderProdVO> prodList = userService.getOrderProdList(order);
		model.addAttribute("prodList", prodList);
		model.addAttribute("orderInfo", order);
		model.addAttribute("prodTotalPrice", userService.prodTotalprice(prodList));
		log.info("주문상품목록 = {}", prodList);
		log.info("주문정보 = {}", order);
		
		return "/user/my_orderDetail";
	}
	
	@ResponseBody
	@PostMapping("/order/cancel")
	public void cancelOrder(@RequestBody String orderNo,
			@SessionAttribute(value = "userId", required = false) String uid
			) {
		
		OrderVO order = new OrderVO();
		order.setOrderNo(orderNo);
		order.setUid(uid);
		
		orderService.cancelOrder(order);
	}
	
	
}
