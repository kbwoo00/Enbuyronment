package com.itwill.enbuyronment.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.OrderVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.OrderMapper";

	//주문완료
	@Override
	public void createOrder(OrderVO vo) {
		log.info("DAO : createOrder(vo) 호출");
		
		sqlSession.insert(NAMESPACE+".insertOrder", vo);
		log.info("insertOrder 성공");
		
		for(int i=0; i<vo.getOrderProd().size(); i++) {
			sqlSession.insert(NAMESPACE+".insertOrderProd", vo.getOrderProd().get(i));
			log.info("insertOrderProd 성공");
		}
	}
	
}
