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
	
	@ResponseBody
	@PostMapping("/addProduct")
	public void addProductToCart(@RequestBody CartVO cart) {
		log.info("카트 = {}", cart);
		
		cartService.addProdToCart(cart);
	}
	
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

	@ResponseBody
	@PostMapping("/updateAmount")
	public void updateAmount(@RequestBody CartVO cart, @SessionAttribute(value = "userId", required = false) String uid) {
		log.info("prodNo = {}", cart.getProdNo());
		log.info("amount = {}", cart.getAmount());
		
		cart.setUid(uid);
		
		cartService.updateAmount(cart);
	}
	
	@ResponseBody
	@PostMapping("/delProduct")
	public void delProdFromCart(@RequestBody List<Integer> prodNoList,
			@SessionAttribute(value = "userId", required = false) String uid) {
		log.info("uid = {}", uid);
		log.info("cartList = {}", prodNoList);
		
		cartService.delProd(prodNoList, uid);
	}

}
