package com.itwill.enbuyronment.persistence;

import com.itwill.enbuyronment.domain.OrderVO;

public interface OrderDAO {

	//주문완료
	public void createOrder(OrderVO vo);
}
