package com.itwill.enbuyronment.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.enbuyronment.domain.HeartVO;
import com.itwill.enbuyronment.domain.ProductVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.domain.paging.PageMaker;
import com.itwill.enbuyronment.service.HeartService;
import com.itwill.enbuyronment.service.ProdService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Inject
	private ProdService prodService;
	@Inject
	private HeartService heartService;
	
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
	public String detailGET(@PathVariable Integer prodNo, Model model,
			@SessionAttribute(value =  "userId", required = false) String uid
			) throws Exception {
		log.info("detailGET() 호출");
		
		model.addAttribute("vo", prodService.prodDetail(prodNo));
		
		boolean isHeart =  heartService.isHeart(prodNo, uid);
		model.addAttribute("isHeart", isHeart);
		log.info("상품정보 가져오기 완료");
		
		return "/product/detail";
	}
	
	//상품 리뷰
	@ResponseBody
	@PostMapping(value = "/{prodNo}/review", produces = "application/json; charset=UTF-8")
	public Map<String, Object> getReview(@PathVariable Integer prodNo , @RequestBody Criteria cri) throws Exception{
		log.info("cri = {}", cri);
		Map<String, Object> reviewAndPageInfo = new HashMap<>();
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(prodService.reviewCnt(prodNo));
		
		reviewAndPageInfo.put("reviewList", prodService.reviewList(prodNo, cri));
		reviewAndPageInfo.put("pageInfo", pm);
		
		return reviewAndPageInfo;
	}
	
	
	// 상품 스크립트
	@ResponseBody
	@PostMapping(value =  "/{prodNo}/script", produces = "application/text; charset=UTF-8")
	public String script(@PathVariable Integer prodNo) throws Exception {
		log.info("상품번호 = {}", prodNo);
		
		ProductVO prod = prodService.prodDetail(prodNo);
		return prod.getScript();
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
	
	//상품 삭제
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
	
	//상품 목록
	@GetMapping("/list")
	public String listGET(Model model) {
		log.info("listGET() 호출");
		
		try {
			model.addAttribute("brand", prodService.brandCate().get("brand"));
			model.addAttribute("cate", prodService.brandCate().get("cate"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/product/list";
	}
	
	@ResponseBody
	@PostMapping(value = "/list", produces = "application/json; charset=UTF-8")
	public Map<String, Object> listPOST(Criteria cri, String brand, String cate, Integer sort, String keyword) throws Exception {
		log.info("listPOST() 호출");
		
		Map<String, Object> prodListReturn = new HashMap<>();
		
		try {
			cri.setPerDataCnt(6);
			
			PageMaker pm = new PageMaker();
			pm.setCri(cri);
			pm.setTotalCount(prodService.prodCnt(brand, cate, keyword));
			
			prodListReturn.put("prodList", prodService.prodList(cri, brand, cate, sort, keyword));
			prodListReturn.put("endPage", pm.getEndPage());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return prodListReturn;
	}
	
	
	
}
