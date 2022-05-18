package com.itwill.enbuyronment.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.HeartVO;

@Repository
public class HeartDAOImpl implements HeartDAO{
	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.HeartMapper";
	
	@Override
	public boolean isHeart(HeartVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".isHeartProd", vo);
	}

	@Override
	public void addProdToHeart(HeartVO heart) {
		sqlSession.insert(NAMESPACE + ".insertHeart", heart);
	}

	@Override
	public void delProdFromHeart(HeartVO heart) {
		sqlSession.delete(NAMESPACE + ".deleteHeart", heart);
	}
}
