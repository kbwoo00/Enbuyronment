package com.itwill.enbuyronment.service;

import java.util.List;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.ReviewVO;
import com.itwill.enbuyronment.domain.UserVO;

public interface UserService {
	
	// 회원 가입
	public void join(UserVO vo);
	
	// 로그인
	public UserVO login(UserVO vo);
	
	// 아이디 중복체크
	public UserVO checkId(String uid);
	
	// 아이디 찾기
	public String findId(UserVO vo);

	// 비밀번호 찾기
	public Integer findPw(UserVO vo);

	// 이메일 인증
	public String checkEmail(String email);

	public void withdrawal(UserVO user);
	
	// 회원정보 조회
	public UserVO getUserInfo(String uid);
	
	// 회원 배송지정보(목록) 조회
	public List<AddressVO> getUserAddr(String uid);
	
	// 회원 배송지정보(1개) 가져오기
	public AddressVO getOneAddr(String uid, String addrName);

	// 회원정보 수정
	public void modUser(UserVO user);

	// 회원 리뷰 목록 가져오기
	public List<ReviewVO> getReviewList(String uid);

	public void addAddr(AddressVO addr, String uid);

	public void delAddr(AddressVO addr);

	public void modAddr(UserVO user);
	
}
