package com.itwill.enbuyronment.persistence;

import java.util.List;

import com.itwill.enbuyronment.domain.CartVO;

public interface CartDAO {
	public void insertCart(CartVO cart);

	public void addAmount(CartVO cart);

	public CartVO getCartProd(CartVO cart);

	public List<CartVO> getCartList(String uid);

	public void updateAmount(CartVO cart);

	public void delProd(CartVO cart);

}
