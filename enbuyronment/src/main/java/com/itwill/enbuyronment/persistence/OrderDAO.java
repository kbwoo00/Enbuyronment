package com.itwill.enbuyronment.persistence;

import java.util.List;

import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.domain.OrderVO;

public interface OrderDAO {

	//주문완료 동작
	public void createOrder(OrderVO ovo, List<CartVO> cvo);
}
