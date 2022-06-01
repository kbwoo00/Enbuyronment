package com.itwill.enbuyronment.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.enbuyronment.domain.OrderVO;
import com.itwill.enbuyronment.domain.SearchOrderVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.domain.paging.PageMaker;
import com.itwill.enbuyronment.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	
	@Inject
	private AdminService adminService;
	
	//회원관리
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
	
	@ResponseBody
	@PostMapping("/userManagement/delete")
	public void deleteUsers(@RequestBody List<String> userIdList) {
		log.info("삭제할 유저 id 목록 = {}", userIdList);
		adminService.deleteUsers(userIdList);
		log.info("유저 삭제 성공");
	}

	//주문관리
	@GetMapping("/orderManagement")
	public String orderManagementGET(Criteria cri, String orderNo, Model model) {
		log.info("orderManagementGET() 호출");
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		
		if(orderNo == null) {    //첫 로딩
			pm.setTotalCount(adminService.getUserOrderCnt());
			model.addAttribute("userOrderList", adminService.getUserOrderList(cri));
			model.addAttribute("userOrderProdCnt", adminService.getOrderProdCnt());
		
		} else {
			List<OrderVO> order = new ArrayList();
			List<Integer> prod = null;
			
			if(adminService.searchOrderNo(orderNo) != null) {
				order = Arrays.asList(adminService.searchOrderNo(orderNo));
				prod = Arrays.asList(adminService.searchOrderNoProdCnt(orderNo));
				
			} else {
				order.add(0, new OrderVO());
			}
			
			pm.setTotalCount(0);
			model.addAttribute("userOrderList", order);
			model.addAttribute("userOrderProdCnt", prod);
		}
		
		model.addAttribute("presentPage", cri.getPage());
		model.addAttribute("pageInfo", pm);
		return "/admin/orderList";
	}
	
	//주문상세검색
	@PostMapping("/orderManagement")
	public String orderManagementPOST(Criteria cri, SearchOrderVO vo, Model model) {
		log.info("orderManagementPOST() 호출");
		log.info(vo+"");
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(adminService.getSearchOrderCnt(vo));
		
		List<OrderVO> order = new ArrayList();
		List<Integer> prod = null;
		
		if(pm.getTotalCount() != 0) {
			order = adminService.getSearchOrderList(cri, vo);
			prod = adminService.getSearchOrderProdCnt(vo);
			
		} else {
			order.add(0, new OrderVO());
		}
		
		model.addAttribute("userOrderList", order);
		model.addAttribute("userOrderProdCnt", prod);
		model.addAttribute("pageInfo", pm);
		model.addAttribute("presentPage", cri.getPage());
		
		return "/admin/orderList";
	}
	
	//주문상태변경
	@ResponseBody
	@PostMapping("/changeStatus")
	public void changeStatus(@RequestBody List<String> statAndOrderNo) {
		log.info("changeStatus() 호출");
		
		if(statAndOrderNo.size() > 1) {
			adminService.updateStatus(statAndOrderNo);
		} else {
			return;
		}
	}
	
	//운송장번호 입력
	@ResponseBody
	@PostMapping("/inputTrackNo")
	public void changeTrackNo(@RequestBody OrderVO vo) {
		log.info("changeTrackNo() 호출");
		
		adminService.updateTrackNo(vo);
	}
}
