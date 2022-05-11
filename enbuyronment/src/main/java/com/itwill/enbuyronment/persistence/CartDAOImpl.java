package com.itwill.enbuyronment.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.CartVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CartDAOImpl implements CartDAO{

	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.CartMapper";
	
	@Override
	public void insertCart(CartVO cart) {
		sqlSession.insert(NAMESPACE + ".insertCart", cart);
	}

	@Override
	public void addAmount(CartVO cart) {
		sqlSession.update(NAMESPACE + ".addAmount", cart);
	}

	@Override
	public CartVO getCartProd(CartVO cart) {
		return sqlSession.selectOne(NAMESPACE + ".getCartProd", cart);
	}
	
}
