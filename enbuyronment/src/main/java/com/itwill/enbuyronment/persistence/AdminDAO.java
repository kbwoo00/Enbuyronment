package com.itwill.enbuyronment.persistence;

import java.util.List;

import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;

public interface AdminDAO {

	public int getUserTotalCnt();
	
	public List<UserVO> userList(Criteria cri);
	
	public void deleteUsers(String userId);
}
