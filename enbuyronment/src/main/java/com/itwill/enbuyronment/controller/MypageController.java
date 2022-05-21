package com.itwill.enbuyronment.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Inject
	private UserService userService;
	
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

}
