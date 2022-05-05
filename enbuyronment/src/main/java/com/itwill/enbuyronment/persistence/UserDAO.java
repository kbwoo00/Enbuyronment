package com.itwill.enbuyronment.persistence;

import com.itwill.enbuyronment.domain.UserVO;

public interface UserDAO {
	
	// 회원가입 동작
	public void join(UserVO vo);

	//회원정보 조회 동작 (아이디 중복 체크)
	public String checkId(String uid);
	
	//아이디 찾기 동작
	public String findId(UserVO vo);
	
	//비밀번호 수정 동작
	public Integer modPw(UserVO vo);
	
	//회원정보 조회 동작 (비밀번호 찾기시)
	public UserVO getUser(String uid);
	
}
