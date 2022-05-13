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

import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/cart")
public class CartController {
	
	@Inject
	private CartService cartServcie;
	
	@ResponseBody
	@PostMapping("/addProduct")
	public void addProductToCart(@RequestBody CartVO cart) {
		log.info("카트 = {}", cart);
		
		cartServcie.addProdToCart(cart);
	}
	
	@GetMapping("/view")
	public String cartView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		if(session == null) {
			return "redirect:/";
		}
		
		String uid = (String) session.getAttribute("userId");
		
		List<CartVO> cartList = cartServcie.getCartList(uid);
		model.addAttribute("cartList", cartList);
		
		
		return "/product/cart";
	}

}
