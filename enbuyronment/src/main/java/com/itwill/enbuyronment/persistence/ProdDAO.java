package com.itwill.enbuyronment.persistence;

import java.util.List;
import java.util.Map;

import com.itwill.enbuyronment.domain.Criteria;
import com.itwill.enbuyronment.domain.ProductVO;
import com.itwill.enbuyronment.domain.ReviewVO;

public interface ProdDAO {
	
	//브랜드&용도명 가져오기 동작
	public Map<String, List<String>> getBraCat();

	//상품등록 동작
	public void regProduct(ProductVO vo);
	
	//상품정보 가져오기 동작
	public ProductVO getProd(Integer prodNo);
	
	//리뷰 개수 가져오기 동작
	public Integer getReviewCnt(Integer prodNo);
	
	//리뷰목록 가져오기 동작
	public List<ReviewVO> getReviewList(Integer prodNo, Criteria cri);
}
