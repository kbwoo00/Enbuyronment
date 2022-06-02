package com.itwill.enbuyronment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.domain.OrderVO;
import com.itwill.enbuyronment.persistence.OrderDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO orderDao;

	//주문완료
	@Override
	public void createOrder(OrderVO ovo, List<CartVO> cvo) {
		log.info("createOrder(ovo, cvo) 호출");
		
		orderDao.createOrder(ovo, cvo);
	}

	//주문정보 가져오기
	@Override
	public OrderVO getOrder(String orderNo) {
		log.info("getOrder(orderNo) 호출");
		
		return orderDao.orderInfo(orderNo);
	}

	//주문상품정보 가져오기
	@Override
	public List<CartVO> getOrderProd(String orderNo) {
		log.info("getOrderProd(orderNo) 호출");
		
		return orderDao.orderProdList(orderNo);
	}
	
	@Override
	public void cancelOrder(OrderVO order) {
		orderDao.cancelOrder(order);
	}
}
