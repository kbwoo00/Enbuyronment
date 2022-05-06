package com.itwill.enbuyronment.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.ProductVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProdDAOImpl implements ProdDAO {

	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.ProdMapper";
	
	//상품등록 동작
	@Override
	public void regProduct(ProductVO vo) {
		log.info("DAO : regProduct(vo) 호출");
		
		sqlSession.insert(NAMESPACE+".insertProd", vo);
	}
	
}
