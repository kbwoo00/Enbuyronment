package com.itwill.enbuyronment.persistence;

import java.util.List;

import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.domain.OrderVO;

public interface OrderDAO {

	//주문완료 동작
	public void createOrder(OrderVO ovo, List<CartVO> cvo);
	
	//주문정보 가져오기 동작
	public OrderVO orderInfo(String orderNo);
	
	//주문상품정보 가져오기 동작
	public List<CartVO> orderProdList(String orderNo);
	
	public void cancelOrder(OrderVO order);
}
