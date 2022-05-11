package com.itwill.enbuyronment.persistence;

import com.itwill.enbuyronment.domain.CartVO;

public interface CartDAO {
	public void insertCart(CartVO cart);

	public void addAmount(CartVO cart);

	public CartVO getCartProd(CartVO cart);
}
