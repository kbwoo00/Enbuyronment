package com.itwill.enbuyronment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.persistence.CartDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartService{
	
	@Inject
	private CartDAO cartDao;
	
	@Override
	public void addProdToCart(CartVO cart) {
		CartVO cartProd = cartDao.getCartProd(cart);
		// 이미 장바구니에 상품이 담겨있으면 수량만 변경한다. (장바구니에 동일한 상품 중복 방지)
		if(cartProd == null) {
			cartDao.insertCart(cart);
		} else {
			cartDao.addAmount(cart);
		}
	}

	@Override
	public List<CartVO> getCartList(String uid) {
		return cartDao.getCartList(uid);
	}

	@Override
	public void updateAmount(CartVO cart) {
		cartDao.updateAmount(cart);
	}
	
	

}
