package com.itwill.enbuyronment.persistence;

import com.itwill.enbuyronment.domain.ProductVO;

public interface ProdDAO {

	//상품등록 동작
	public void regProduct(ProductVO vo);
}
