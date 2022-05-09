package com.itwill.enbuyronment.persistence;

import com.itwill.enbuyronment.domain.ProductVO;

public interface ProdDAO {

	//상품등록 동작
	public void regProduct(ProductVO vo);
	
	//상품정보 가져오기 동작
	public ProductVO getProd(Integer prodNo);
}
