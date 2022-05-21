package com.itwill.enbuyronment.persistence;

import java.util.List;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.UserVO;

public interface UserDAO {
	
	// 회원가입 동작
	public void join(UserVO vo);
	
	//로그인 
	public UserVO login(UserVO vo);
	
	//아이디 찾기 동작
	public String findId(UserVO vo);
	
	//비밀번호 수정 동작
	public Integer modPw(UserVO vo);
	
	//회원정보 조회 동작 (비밀번호 찾기시)
	public UserVO getUser(String uid);
	
	//회원 주소 조회 동작
	public List<AddressVO> getUserAddr(String uid);

	public void delUser(UserVO user);
}
