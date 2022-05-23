package com.itwill.enbuyronment.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.CartVO;
import com.itwill.enbuyronment.domain.OrderVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.OrderMapper";

	//주문완료 동작
	@Override
	public void createOrder(OrderVO ovo, List<CartVO> cvo) {
		log.info("DAO : createOrder(ovo, cvo) 호출");
		
		sqlSession.insert(NAMESPACE+".insertOrder", ovo);
		
		for(int i=0; i<cvo.size(); i++) {
			sqlSession.insert(NAMESPACE+".insertOrderProd", cvo.get(i));
			sqlSession.update(NAMESPACE+".minusStock", cvo.get(i));
		}
		
		sqlSession.delete(NAMESPACE+".delCartAfterOrder", ovo.getUid());
		sqlSession.update(NAMESPACE+".updatePoint", ovo);
	}
	
}
