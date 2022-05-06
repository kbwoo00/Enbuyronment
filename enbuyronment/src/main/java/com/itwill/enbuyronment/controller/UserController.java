package com.itwill.enbuyronment.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService userService;

	// 회원가입
	@GetMapping("/join")
	public String joinForm() {
		return "/user/signup";
	}

	@PostMapping("/join")
	public String join(@ModelAttribute UserVO vo) {
		userService.join(vo);
		return "redirect:/user/login";
	}
	
	@ResponseBody
	@PostMapping(value = "/checkId", produces = "application/text; charset=UTF-8")
	public String checkDuplId(UserVO user) {
		log.info(user.getUid());
		log.info("유저 = {}", userService.checkId(user.getUid()));
		if(userService.checkId(user.getUid()) != null) {
			return "중복된 아이디입니다.";
		}
		
		return "사용가능한 아이디입니다. 사용하시겠습니까?";
	}
	
	@ResponseBody
	@PostMapping(value = "/checkEmail", produces = "application/text; charset=UTF-8")
	public String checkEmail(@RequestBody String email) {
		log.info(email);
		return userService.checkEmail(email);
	}

	// 로그인
	@GetMapping("/login")
	public String loginForm() {
		return "/user/login";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute UserVO vo, HttpSession session, RedirectAttributes rttr) {
		UserVO user = userService.login(vo);
		
		if (user == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/user/login";
		}
		
		session.setAttribute("userId", user.getUid());
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/";
	}

	// 아이디 찾기
	@GetMapping("/findId")
	public String findIdGET() {
		log.info("findIdGET() 호출");

		return "/user/findId";
	}

	@ResponseBody
	@PostMapping(value = "/findId", produces = "application/text; charset=UTF-8")
	public String findIdPOST(UserVO vo) throws Exception {
		log.info("findIdPOST() 호출");
		log.info(vo + "");

		return userService.findId(vo);
	}

	// 비밀번호 찾기
	@GetMapping("/findPw")
	public String findPwGET() {
		log.info("findPwGET() 호출");

		return "/user/findPw";
	}

	@ResponseBody
	@PostMapping(value = "/findPw", produces = "application/text; charset=UTF-8")
	public String findPwPOST(UserVO vo) throws Exception {
		log.info("findPwPOST() 호출");
		log.info(vo + "");

		String result = userService.findPw(vo) + "";

		return result;
	}

}
