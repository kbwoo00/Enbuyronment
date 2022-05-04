package com.itwill.enbuyronment.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService userService;

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
