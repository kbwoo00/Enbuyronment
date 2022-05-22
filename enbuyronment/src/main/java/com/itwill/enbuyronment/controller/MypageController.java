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
	
	@GetMapping("/userinfo")
	public String userInfo(@SessionAttribute(value = "userId", required = false) String uid,
			Model model
			) {
		
		model.addAttribute("userInfo", userService.getUserInfo(uid));
		
		/*
		 * TODO : 기본 배송지인 address 가져오는 서비스 추가, address 목록 가져오기 서비스 메서드 이름 변경
		 * TODO : userInfo.jsp에 기본배송지, 기본배송지 변경(배송지 추가, 선택) 작업
		 */
		// model.addAttribute("userAddrList", userService.getUserAddrList(uid));
		// model.addAttribute("userDefaultAddr", userService.getUserDefaultAddr(uid));
		
		return "/user/userinfo";
	}
	
	@PostMapping("/modUser")
	public String modifyUser(@ModelAttribute UserVO inputUser, RedirectAttributes rttr) {
		// 비밀번호가 일치한지 체크
		UserVO user = userService.login(inputUser);
		log.info("user = {}", inputUser);

		if (user == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/mypage/userinfo";
		}
		
		if(!inputUser.getNewPass().equals("")) {
			// 비밀번호 변경할 값이 있으면 바꾸기
			inputUser.setPass(inputUser.getNewPass());
		}
		userService.modUser(inputUser);
		rttr.addFlashAttribute("msg", "success");
		
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
	
	

}
