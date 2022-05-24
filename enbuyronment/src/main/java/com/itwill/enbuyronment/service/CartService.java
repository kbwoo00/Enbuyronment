package com.itwill.enbuyronment.service;

import java.util.List;

import com.itwill.enbuyronment.domain.CartVO;

public interface CartService {
	
	//상품추가
	public void addProdToCart(CartVO cart);

	//목록 가져오기
	public List<CartVO> getCartList(String uid);

	//상품삭제
	public void delProd(List<Integer> prodNoList, String uid);

	//수량변경
	public Integer updateAmount(CartVO vo);
	
	//선택상품 상태 변경
	public void upStat(List<Integer> prodNoList, String uid);
	
	//주문목록 가져오기
	public List<CartVO> getOrderList(String uid);
}
