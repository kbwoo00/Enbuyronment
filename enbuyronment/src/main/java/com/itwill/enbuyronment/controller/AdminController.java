package com.itwill.enbuyronment.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.itwill.enbuyronment.domain.Criteria;
import com.itwill.enbuyronment.domain.PageMaker;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	
	@Inject
	private AdminService adminService;
	
	@GetMapping("/userManagement")
	public String userList(@ModelAttribute Criteria cri , Model model) {
		
		log.info("Criteria 정보 = {}", cri);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(adminService.getUserTotalCnt());
		
		model.addAttribute("pageInfo", pm);
		model.addAttribute("presentPage", cri.getPage());
		log.info("startPage = {}",pm.getStartPage());
		log.info("perPageNum = {}", cri.getPerDataCnt());
		log.info("endPage = {}", pm.getEndPage());
		log.info("totalCount = {}", pm.getTotalCount());
		
		List<UserVO> userList = adminService.getUserList(cri);
		model.addAttribute("userList", userList);
		
		
		return "/admin/userList";
	}

}
