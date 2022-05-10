package com.itwill.enbuyronment.service;

import java.util.List;

import com.itwill.enbuyronment.domain.Criteria;
import com.itwill.enbuyronment.domain.UserVO;

public interface AdminService {

	public int getUserTotalCnt();
	
	public List<UserVO> getUserList(Criteria cri);
	
	public void deleteUsers(List<String> userIdList);
}
