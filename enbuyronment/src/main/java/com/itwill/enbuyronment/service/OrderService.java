package com.itwill.enbuyronment.service;

import java.util.List;

import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.domain.OrderVO;

public interface OrderService {

	//주문완료
	public void createOrder(OrderVO ovo, List<CartVO> cvo);
}
