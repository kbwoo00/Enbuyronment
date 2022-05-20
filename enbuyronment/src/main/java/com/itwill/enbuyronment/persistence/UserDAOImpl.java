package com.itwill.enbuyronment.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.UserMapper";

	// 회원가입 동작
	@Override
	public void join(UserVO vo) {
		sqlSession.insert(NAMESPACE + ".join", vo);
		log.info("유저 정보 insert 성공");
		insertInitAddr(vo);
		log.info("유저 주소 정보 insert 성공");
	}

	private void insertInitAddr(UserVO user) {
		AddressVO addr = new AddressVO();
		addr.setAddrName(user.getAddrName());
		addr.setPostcode(user.getPostcode());
		addr.setAddr(user.getAddr());
		addr.setDtAddr(user.getDtAddr());
		addr.setExAddr(user.getExAddr());
		addr.setUid(user.getUid());
		addr.setReciver(user.getName());
		
		sqlSession.insert(NAMESPACE + ".initAddr", addr);
	}
	
	// 로그인 동작
	@Override
	public UserVO login(UserVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}

	// 아이디 찾기 동작
	@Override
	public String findId(UserVO vo) {
		log.info("DAO : findId(vo)");

		String id = sqlSession.selectOne(NAMESPACE + ".findId", vo);

		log.info("DAO : 찾은 아이디 - " + id);

		return id;
	}

	// 비밀번호 수정 동작
	@Override
	public Integer modPw(UserVO vo) {
		log.info("DAO : modPw(vo)");

		Integer modPw = sqlSession.update(NAMESPACE + ".modPw", vo);

		log.info("DAO : 발급된 비밀번호 개수 - " + modPw);

		return modPw;
	}

	// 회원정보 조회 동작
	@Override
	public UserVO getUser(String uid) {
		log.info("DAO : getUser(uid)");

		UserVO vo = sqlSession.selectOne(NAMESPACE + ".getUser", uid);

		log.info("DAO : 회원정보 조회 완료");

		return vo;
	}

	//회원 주소 조회 동작
	@Override
	public List<AddressVO> getUserAddr(String uid) {
		log.info("DAO : getUserAddr(uid) 호출");
		
		return sqlSession.selectList(NAMESPACE+".getUserAddr", uid);
	}

}
