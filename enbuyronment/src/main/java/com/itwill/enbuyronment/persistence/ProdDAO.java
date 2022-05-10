package com.itwill.enbuyronment.persistence;

import java.util.List;
import java.util.Map;

import com.itwill.enbuyronment.domain.ProductVO;

public interface ProdDAO {
	
	//브랜드&용도명 가져오기 동작
	public Map<String, List<String>> getBraCat();

	//상품등록 동작
	public void regProduct(ProductVO vo);
	
	//상품정보 가져오기 동작
	public ProductVO getProd(Integer prodNo);
}
