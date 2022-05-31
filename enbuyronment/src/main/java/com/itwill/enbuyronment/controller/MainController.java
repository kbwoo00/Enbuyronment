package com.itwill.enbuyronment.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.enbuyronment.domain.ProductVO;
import com.itwill.enbuyronment.service.ProdService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	
	@Inject
	private ProdService prodService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) throws Exception {
		log.info("main() 호출");
		
		model.addAttribute("brand", prodService.brandCate().get("brand"));
		
		return "/main";
	}
	
	@ResponseBody
	@PostMapping(value = "/mainProd", produces = "application/json; charset=UTF-8")
	public List<ProductVO> mainProd(String brand) {
		log.info("mainProd() 호출");
		
		return prodService.getMainProd(brand);
	}
}
