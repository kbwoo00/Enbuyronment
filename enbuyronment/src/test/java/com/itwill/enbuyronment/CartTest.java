package com.itwill.enbuyronment;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.domain.OrderVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.persistence.CartDAO;
import com.itwill.enbuyronment.persistence.OrderDAO;
import com.itwill.enbuyronment.persistence.UserDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class CartTest {
	
	@Inject
	private CartDAO cartDao;
	
	@Inject
	private OrderDAO orderDao;
	
	@Inject
	private UserDAO userDao;
	
	//@Test
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
	
	@Test
	public void 카트에서주문옮기기() {
		
		//아이디 일치하는 cart정보 가져오기
		String uid = "user12";
		
		UserVO uvo = userDao.getUser(uid);
		log.info(uvo+"");
		
		List<AddressVO> avoList = userDao.getUserAddr(uid);
		AddressVO avo = null;
		
		for(int i=0; i<avoList.size(); i++) {
			if(avoList.get(i).getAddrName().equals("기본 배송지")) {
				avo = avoList.get(i);
			}
		}
		
		OrderVO ovo = new OrderVO();
		ovo.setOrderNo(new Date().getDate() + 12345);
		ovo.setOrderProd(cartDao.getCartList(uid));
		ovo.setAddr(avo.getAddr());
		ovo.setDtAddr(avo.getDtAddr());
		ovo.setExAddr(avo.getExAddr());
		ovo.setPostcode(avo.getPostcode());
		ovo.setRequest("문 앞에 놔주세요");
		ovo.setUid(uid);
		ovo.setPointDown(0);
		log.info("한글ㄴ한글한글"+ovo);
		
		//order에 정보넣기
		orderDao.createOrder(ovo);
	}
}
