package com.itwill.enbuyronment.service;

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
	

}
