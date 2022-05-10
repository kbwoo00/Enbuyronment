package com.itwill.enbuyronment.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.Criteria;
import com.itwill.enbuyronment.domain.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.AdminMapper";
	
	@Override
	public int getUserTotalCnt() {
		return sqlSession.selectOne(NAMESPACE + ".userTotalCnt");
	}

	@Override
	public List<UserVO> userList(Criteria cri) {
		
		return sqlSession.selectList(NAMESPACE + ".userList", cri);
	}

	@Override
	public void deleteUsers(String userId) {
		sqlSession.delete(NAMESPACE + ".deleteUsers", userId); 
	}
	
	

}
