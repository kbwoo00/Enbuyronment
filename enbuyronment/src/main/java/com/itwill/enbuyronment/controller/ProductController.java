package com.itwill.enbuyronment.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwill.enbuyronment.service.ProdService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Inject
	private ProdService prodService;
	
	//상품 등록
	@GetMapping("/regist")
	public String registGET() {
		log.info("registGET() 호출");
		
		return "/product/regist";
	}
	
	@PostMapping("/regist")
	public String registPOST(MultipartHttpServletRequest request) {
		log.info("registPOST() 호출");
		
		try {
			prodService.prodUpload(request);
			log.info("상품등록 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/product/list";
	}
}