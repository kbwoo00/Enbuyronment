package com.itwill.enbuyronment.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.itwill.enbuyronment.domain.HeartVO;
import com.itwill.enbuyronment.service.HeartService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/heart")
public class HeartController {

	@Inject
	private HeartService heartService;
	
	@ResponseBody
	@PostMapping(value = "/addProd")
	public void addProdToHeart(@RequestBody HeartVO heart) {
		heartService.addProdToHeart(heart);
	}
	
	@ResponseBody
	@PostMapping(value = "/delProd")
	public void delProdFromHeart(@RequestBody HeartVO heart) {
		heartService.delProdFromHeart(heart);
	}
	
	@ResponseBody
	@PostMapping(value = "/delCkedProd")
	public void delProdListFromHeart(@RequestBody List<Integer> prodNoList,
			@SessionAttribute(value = "userId", required = false) String uid
			) {
		heartService.delProdFromHeart(prodNoList, uid);
	}
	
	@GetMapping("/view")
	public String heartView(@SessionAttribute(value = "userId", required = false) String uid,
			Model model
			) {
		
		List<HeartVO> heartList = heartService.getHeartList(uid);
		model.addAttribute("heartList", heartList);
		
		return "/product/heart";
	}
}
