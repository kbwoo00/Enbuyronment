package com.itwill.enbuyronment.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.OrderVO;
import com.itwill.enbuyronment.service.CartService;
import com.itwill.enbuyronment.service.OrderService;
import com.itwill.enbuyronment.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/order")
public class OrderController {

	@Inject
	private OrderService orderService;
	
	@Inject
	private CartService cartService;
	
	@Inject
	private UserService userService;
	
	// 주문하기 페이지
	@GetMapping("/view")
	public String orderGET(HttpServletRequest request, Model model) {
		log.info("orderGET() 호출");
		
		HttpSession session = request.getSession(false);
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		String uid = (String) session.getAttribute("userId");
		model.addAttribute("orderList", cartService.getOrderList(uid));
		model.addAttribute("userInfo", userService.getUserInfo(uid));
		model.addAttribute("userAddr", userService.getUserAddr(uid));
		
		return "/product/order";
	}
	
	//배송지정보(1개) 가져오기
	@ResponseBody
	@PostMapping("/getAddr")
	public AddressVO getAddrPOST(@RequestBody AddressVO vo, @SessionAttribute(value = "userId", required = false) String uid) {
		log.info("getAddrPOST() 호출");
		
		return userService.getOneAddr(uid, vo.getAddrName());
	}
	
	//주문완료
	@ResponseBody
	@PostMapping("/postOrder")
	public void postOrderPOST(@RequestBody OrderVO ovo, @SessionAttribute(value = "userId", required = false) String uid) {
		log.info("postOrderPOST() 호출");
		
		ovo.setUid(uid);
		orderService.createOrder(ovo, cartService.getOrderList(uid));
	}
	
	//주문확인 페이지
	@GetMapping("/{orderNo}")
	public String orderConfirmGET(@PathVariable String orderNo, HttpServletRequest request, Model model) {
		log.info("orderConfirmGET() 호출");
		
		String uid = (String) request.getSession(false).getAttribute("userId");
		
		model.addAttribute("orderInfo", orderService.getOrder(orderNo));
		model.addAttribute("orderProdList", orderService.getOrderProd(orderNo));
		
		return "/product/order_confirm";
	}
}
