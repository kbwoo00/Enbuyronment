package com.itwill.enbuyronment.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@GetMapping("/withdrawl")
	public String withdrawlForm(@SessionAttribute(value = "userId", required = false) String uid,
			Model model){
		
		model.addAttribute("userId", uid);

		return "/user/withdrawl";
	}

}
