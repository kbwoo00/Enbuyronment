package com.itwill.enbuyronment.persistence;

import java.util.List;

import com.itwill.enbuyronment.domain.AddressVO;
import com.itwill.enbuyronment.domain.ProdAndReviewVO;
import com.itwill.enbuyronment.domain.ReviewVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;

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
	
	//회원 주소목록 조회 동작
	public List<AddressVO> getUserAddr(String uid);
	
	//회원 배송지(1개) 조회 동작
	public AddressVO getOneAddr(String uid, String addrName);

	// 회원 삭제 동작
	public void delUser(UserVO user);

	// 회원 수정 동작
	public void modUser(UserVO user);

	// 회원 리뷰 목록 가져오기 동작
	public List<ProdAndReviewVO> getReviewList(String uid, Criteria cri);

	public void addAddr(AddressVO addr);

	public void delAddr(AddressVO addr);

	public void toDefaultAddr(UserVO user);

	public void toNormalAddr(UserVO user);

	public int getReviewTotalCnt(String uid);

	public void delReview(Integer reviewNo);

	public ProdAndReviewVO getReview(Integer reviewNo);

	public void modReview(ReviewVO review);

	public boolean isPresentReview(ReviewVO review);

	public void writeReview(ReviewVO review);
}
