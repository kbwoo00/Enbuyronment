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
	
	//상품추가
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

	//목록 불러오기
	@Override
	public List<CartVO> getCartList(String uid) {
		return cartDao.getCartList(uid);
	}

	//상품삭제
	@Override
	public void delProd(List<Integer> prodNoList, String uid) {
		for(Integer prodNo : prodNoList) {
			CartVO cart = new CartVO();
			cart.setUid(uid);
			cart.setProdNo(prodNo);
			cartDao.delProd(cart);
		}
	}

	//수량변경
	@Override
	public Integer updateAmount(CartVO vo) {
		log.info("updateAmount(vo) 호출");
		
		return cartDao.updateAmount(vo);
	}

	//선택상품 상태 변경
	@Override
	public void upStat(List<Integer> prodNoList, String uid) {
		log.info("upStat(prodNoList,uid) 호출");
		
		cartDao.upStat(prodNoList, uid);
	}
	
	//주문목록 불러오기
	@Override
	public List<CartVO> getOrderList(String uid) {
		return cartDao.getOrderList(uid);
	}

}
