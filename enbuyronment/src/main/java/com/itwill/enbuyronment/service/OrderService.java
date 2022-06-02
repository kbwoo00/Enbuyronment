package com.itwill.enbuyronment.service;

import java.util.List;

import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.domain.OrderVO;

public interface OrderService {

	//주문완료
	public void createOrder(OrderVO ovo, List<CartVO> cvo);
	
	//주문정보 가져오기
	public OrderVO getOrder(String orderNo);
	
	//주문상품정보 가져오기
	public List<CartVO> getOrderProd(String orderNo);
	
	public void cancelOrder(OrderVO order);
}
