package com.itwill.enbuyronment.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE="com.itwill.enbuyronment.mapper.UserMapper";
	
	//아이디 찾기 동작
	@Override
	public String findId(UserVO vo) {
		log.info("DAO : findId(vo)");
		
		String id = sqlSession.selectOne(NAMESPACE+".findId", vo);
		
		log.info("DAO : 찾은 아이디 - " + id);
		
		return id;
	}

	//비밀번호 수정 동작
	@Override
	public Integer modPw(UserVO vo) {
		log.info("DAO : modPw(vo)");
		
		Integer modPw = sqlSession.update(NAMESPACE+".modPw", vo);
		
		log.info("DAO : 발급된 비밀번호 개수 - " + modPw);
		
		return modPw;
	}
	
	//회원정보 조회 동작
	@Override
	public UserVO getUser(String uid) {
		log.info("DAO : getUser(uid)");
		
		UserVO vo = sqlSession.selectOne(NAMESPACE+".getUser", uid);
		
		log.info("DAO : 회원정보 조회 완료");
		
		return vo;
	}

	

}
