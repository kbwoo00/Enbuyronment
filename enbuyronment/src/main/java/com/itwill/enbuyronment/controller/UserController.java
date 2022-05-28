package com.itwill.enbuyronment.controller;

import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		if (userService.checkId(user.getUid()) != null) {
			return "중복된 아이디입니다.";
		}

		return "사용가능한 아이디입니다. 사용하시겠습니까?";
	}

	@ResponseBody
	@PostMapping(value = "/checkEmail", produces = "application/text; charset=UTF-8")
	public String checkEmail(@RequestBody String email) {
		log.info(email);
		String certiNum = String.valueOf(UUID.randomUUID()).substring(1,8);
		userService.checkEmail(email, certiNum);
		return certiNum;
	}

	// 로그인
	@GetMapping("/login")
	public String loginForm() {
		return "/user/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam(defaultValue = "/", value = "redirectUrl") String redirectUrl,
			@ModelAttribute UserVO vo, HttpSession session, RedirectAttributes rttr
			) {
		UserVO user = userService.login(vo);

		if (user == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/user/login";
		}

		session.setAttribute("userId", user.getUid());

		if (user.getUid().equals("admin")) {
			session.setAttribute("mode", "userMode");
		}

		rttr.addFlashAttribute("msg", "success");
		log.info("로그인 한 사람 ID = {}", session.getAttribute("userId"));
		log.info("mode = {}", session.getAttribute("mode"));

		log.info("redirectUrl = {}", redirectUrl);
		return "redirect:" + redirectUrl;
	}

	@ResponseBody
	@PostMapping(value = "/logout", produces = "application/text; charset=UTF-8")
	public String logout(HttpSession session) {
		session.invalidate();
		return "로그아웃 되었습니다.";
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

	// 관리자 모드로 변경
	@ResponseBody
	@PostMapping(value = "/changeMode", produces = "application/text; charset=UTF-8")
	public String changeMode(HttpSession session) {
		String msg;

		String mode = (String) session.getAttribute("mode");

		if (mode.equals("userMode")) {
			session.setAttribute("mode", "adminMode");
			msg = "관리자 모드로 변경되었습니다.";
		} else {
			session.setAttribute("mode", "userMode");
			msg = "유저모드로 변경되었습니다.";
		}

		return msg;
	}

}
