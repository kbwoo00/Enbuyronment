package com.itwill.enbuyronment.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/cart")
public class CartController {
	
	@Inject
	private CartService cartService;
	
	//장바구니 상품추가
	@ResponseBody
	@PostMapping("/addProduct")
	public void addProductToCart(@RequestBody CartVO cart) {
		log.info("카트 = {}", cart);
		
		cartService.addProdToCart(cart);
	}
	
	//장바구니 불러오기
	@GetMapping("/view")
	public String cartView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		if(session == null) {
			return "redirect:/";
		}
		
		String uid = (String) session.getAttribute("userId");
		
		List<CartVO> cartList = cartService.getCartList(uid);
		model.addAttribute("cartList", cartList);
		
		
		return "/product/cart";
	}

	//장바구니 상품삭제
	@ResponseBody
	@PostMapping("/delProduct")
	public void delProdFromCart(@RequestBody List<Integer> prodNoList,
			@SessionAttribute(value = "userId", required = false) String uid) {
		log.info("uid = {}", uid);
		log.info("cartList = {}", prodNoList);
		
		cartService.delProd(prodNoList, uid);
	}
	
	//장바구니 상품 수량변경
	@ResponseBody
	@PostMapping("/modAmount")
	public void modCartProdAmt(@RequestBody CartVO vo, @SessionAttribute(value = "userId", required = false) String uid) {
		log.info("modCartProdAmt() 호출");
		
		vo.setUid(uid);
		cartService.updateAmount(vo);
	}

}
