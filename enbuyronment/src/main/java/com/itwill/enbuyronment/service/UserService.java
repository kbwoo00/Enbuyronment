package com.itwill.enbuyronment.service;

import com.itwill.enbuyronment.domain.UserVO;

public interface UserService {
	
	// 아이디 찾기
	public String findId(UserVO vo);

	// 비밀번호 찾기
	public Integer findPw(UserVO vo);

}
