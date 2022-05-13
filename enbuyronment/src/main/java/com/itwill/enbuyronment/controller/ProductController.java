package com.itwill.enbuyronment.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.enbuyronment.domain.Criteria;
import com.itwill.enbuyronment.domain.PageMaker;
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
	public String registGET(Model model) {
		log.info("registGET() 호출");
		
		try {
			model.addAttribute("brand", prodService.brandCate().get("brand"));
			model.addAttribute("cate", prodService.brandCate().get("cate"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/product/regist";
	}
	
	@PostMapping("/regist")
	public String registPOST(MultipartHttpServletRequest request, RedirectAttributes rttr) {
		log.info("registPOST() 호출");
		
		try {
			prodService.prodUpload(request);
			rttr.addFlashAttribute("msg", "registOK");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/product/list";
	}
	
	//상품 상세
	@GetMapping("/{prodNo}")
	public String detailGET(@PathVariable Integer prodNo, @ModelAttribute Criteria cri, Model model) throws Exception {
		log.info("detailGET() 호출");
		log.info(cri+"");
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(prodService.reviewCnt(prodNo));
		
		model.addAttribute("pageInfo", pm);
		model.addAttribute("presentPage", cri.getPage());
		log.info("startPage = {}",pm.getStartPage());
		log.info("perPageNum = {}", cri.getPerDataCnt());
		log.info("endPage = {}", pm.getEndPage());
		log.info("totalCount = {}", pm.getTotalCount());
		
		model.addAttribute("reviewList", prodService.reviewList(prodNo, cri));
		model.addAttribute("vo", prodService.prodDetail(prodNo));
		log.info("상품&리뷰정보 가져오기 완료");
		
		return "/product/detail";
	}
	
	//상품 수정
	@GetMapping("/{prodNo}/update")
	public String updateGET(@PathVariable Integer prodNo, Model model) {
		log.info("updateGET() 호출");
		
		try {
			model.addAttribute("brand", prodService.brandCate().get("brand"));
			model.addAttribute("cate", prodService.brandCate().get("cate"));
			model.addAttribute("vo", prodService.prodDetail(prodNo));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/product/update";
	}
	
	@PostMapping("/{prodNo}/update")
	public String updatePOST(@PathVariable Integer prodNo, MultipartHttpServletRequest request, RedirectAttributes rttr) {
		log.info("updatePOST() 호출");
		
		try {
			prodService.prodModify(prodNo, request);
			rttr.addFlashAttribute("msg", "updateOK");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/product/list";
	}
	
	//상품삭제
	@GetMapping("/{prodNo}/delete")
	public String deleteGET(@PathVariable Integer prodNo, RedirectAttributes rttr) {
		log.info("deleteGET() 호출");
		
		try {
			prodService.prodDelete(prodNo);
			rttr.addFlashAttribute("msg", "deleteOK");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/product/list";
	}
}
