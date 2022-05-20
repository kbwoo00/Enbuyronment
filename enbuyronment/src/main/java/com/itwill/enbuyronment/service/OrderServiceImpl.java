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

	@Override
	public void createOrder(OrderVO ovo, List<CartVO> cvo) {
		log.info("createOrder(ovo, cvo) 호출");
		
		orderDao.createOrder(ovo, cvo);
	}
}
