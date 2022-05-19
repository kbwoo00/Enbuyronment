package com.itwill.enbuyronment.persistence;

import java.util.List;
import java.util.Map;

import com.itwill.enbuyronment.domain.ProductVO;
import com.itwill.enbuyronment.domain.ReviewVO;
import com.itwill.enbuyronment.domain.paging.Criteria;

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
	
	//상품수정 동작
	public void modProduct(ProductVO vo);
	
	//상품삭제 동작
	public void delProduct(Integer prodNo);
	
	//상품 개수 가져오기 동작
	public Integer getProductCnt(String brand, String cate, String keyword);
	
	//상품목록 가져오기 동작
	public List<ProductVO> getProductList(Criteria cri, String brand, String cate, Integer sort, String keyword);
}
