package com.itwill.enbuyronment.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
