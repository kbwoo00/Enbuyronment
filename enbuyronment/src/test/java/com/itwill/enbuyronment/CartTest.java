package com.itwill.enbuyronment;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.persistence.CartDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class CartTest {
	
	@Inject
	private CartDAO cartDao;
	
	@Test
	public void 장바구니에상품담기() {
		CartVO cart = new CartVO();
		cart.setUid("admin");
		cart.setProdNo(1);
		cart.setAmount(2);
		
		CartVO cartProd = cartDao.getCartProd(cart);
		// 이미 장바구니에 상품이 담겨있으면 수량만 변경한다. (장바구니에 동일한 상품 중복 방지)
		if(cartProd == null) {
			cartDao.insertCart(cart);
		} else {
			cartDao.addAmount(cart);
		}
	}
}
