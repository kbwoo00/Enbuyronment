package com.itwill.enbuyronment.persistence;

import java.util.List;

import com.itwill.enbuyronment.domain.CartVO;

public interface CartDAO {
	
	//상품추가 동작
	public void insertCart(CartVO cart);

	//동일상품 추가 동작
	public void addAmount(CartVO cart);
	
	//장바구니 상품여부 확인 동작
	public CartVO getCartProd(CartVO cart);

	//목록 불러오기 동작
	public List<CartVO> getCartList(String uid);

	//상품삭제 동작
	public void delProd(CartVO cart);

	//수량변경 동작
	public Integer updateAmount(CartVO vo);
}
