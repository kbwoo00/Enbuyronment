package com.itwill.enbuyronment.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwill.enbuyronment.domain.Criteria;
import com.itwill.enbuyronment.domain.ProductVO;
import com.itwill.enbuyronment.domain.ReviewVO;

public interface ProdService {
	
	//브랜드&용도명 가져오기
	public Map<String, List<String>> brandCate() throws Exception;

	//상품 등록
	public void prodUpload(MultipartHttpServletRequest request) throws Exception;
	
	//상품정보 가져오기
	public ProductVO prodDetail(Integer prodNo) throws Exception;
	
	//리뷰 개수 가져오기
	public Integer reviewCnt(Integer prodNo) throws Exception;
	
	//리뷰목록 가져오기
	public List<ReviewVO> reviewList(Integer prodNo, Criteria cri) throws Exception;
}
