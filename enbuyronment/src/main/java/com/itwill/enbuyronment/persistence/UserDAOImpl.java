package com.itwill.enbuyronment.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.ProdAndReviewVO;
import com.itwill.enbuyronment.domain.ReviewVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;

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
		addr.setReceiver(user.getName());
		
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

	//회원 주소목록 조회 동작
	@Override
	public List<AddressVO> getUserAddr(String uid) {
		log.info("DAO : getUserAddr(uid) 호출");
		
		return sqlSession.selectList(NAMESPACE+".getUserAddr", uid);
	}
	
	//회원 배송지(1개) 조회 동작
	@Override
	public AddressVO getOneAddr(String uid, String addrName) {
		log.info("DAO : getOneAddr(uid,addrName) 호출");
		
		Map<String, String> data = new HashMap();
		data.put("uid", uid);
		data.put("addrName", addrName);
		
		return sqlSession.selectOne(NAMESPACE+".getOneAddr", data);
	}	

	// 회원 탈퇴 동작
	@Override
	public void delUser(UserVO user) {
		sqlSession.delete(NAMESPACE + ".delUser", user);
	}

	// 회원 수정 동작
	@Override
	public void modUser(UserVO user) {
		sqlSession.update(NAMESPACE + ".modUser", user);
	}

	// 회원 리뷰 목록 가져오기 동작
	@Override
	public List<ProdAndReviewVO> getReviewList(String uid, Criteria cri) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("pageStart", cri.getPageStart());
		map.put("perDataCnt", cri.getPerDataCnt());
		
		return sqlSession.selectList(NAMESPACE + ".getUserReviews", map);
	}

	@Override
	public void addAddr(AddressVO addr) {
		sqlSession.insert(NAMESPACE + ".insertAddr", addr);
	}

	@Override
	public void delAddr(AddressVO addr) {
		sqlSession.delete(NAMESPACE + ".delAddr", addr);
	}

	@Override
	public void toDefaultAddr(UserVO user) {
		sqlSession.update(NAMESPACE + ".toDefaultAddr", user);
	}

	@Override
	public void toNormalAddr(UserVO user) {
		sqlSession.update(NAMESPACE + ".toNormalAddr", user);
	}

	@Override
	public int getReviewTotalCnt(String uid) {
		return sqlSession.selectOne(NAMESPACE + ".getReviewTotalCnt", uid);
	}

	@Override
	public void delReview(Integer reviewNo) {
		sqlSession.delete(NAMESPACE + ".delReview", reviewNo);
	}

	@Override
	public ProdAndReviewVO getReview(Integer reviewNo) {
		return sqlSession.selectOne(NAMESPACE + ".getReview", reviewNo);
	}

	@Override
	public void modReview(ReviewVO review) {
		sqlSession.update(NAMESPACE + ".modReview", review);
	}

	@Override
	public boolean isPresentReview(ReviewVO review) {
		return sqlSession.selectOne(NAMESPACE + ".isPresentReview", review);
	}

	@Override
	public void writeReview(ReviewVO review) {
		sqlSession.insert(NAMESPACE + ".writeReview", review);
	}
	
}
