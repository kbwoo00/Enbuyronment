package com.itwill.enbuyronment.service;

import java.util.List;

import com.itwill.enbuyronment.domain.CartVO;

public interface CartService {
	public void addProdToCart(CartVO cart);

	public List<CartVO> getCartList(String uid);

	public void updateAmount(CartVO cart);

	public void delProd(CartVO cart);
}
