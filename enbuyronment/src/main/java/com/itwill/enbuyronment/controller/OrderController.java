package com.itwill.enbuyronment.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.enbuyronment.service.CartService;
import com.itwill.enbuyronment.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/order")
public class OrderController {

	@Inject
	private OrderService orderService;
	
	@Inject
	private CartService cartService;
	
	@GetMapping("/view")
	public String orderGET(HttpServletRequest request, Model model) {
		log.info("orderGET() 호출");
		
		HttpSession session = request.getSession(false);
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		String uid = (String) session.getAttribute("userId");
		model.addAttribute("orderList", cartService.getCartList(uid));
		
		return "/product/order";
	}
	
	@GetMapping("/{orderNo}")
	public String orderConfirmGET() {
		log.info("orderConfirmGET() 호출");
		
		return "/product/order_confirm";
	}
}
