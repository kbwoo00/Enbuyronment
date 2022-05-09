package com.itwill.enbuyronment.persistence;

import java.util.List;

import com.itwill.enbuyronment.domain.Criteria;
import com.itwill.enbuyronment.domain.UserVO;

public interface AdminDAO {

	public int getUserTotalCnt();
	
	public List<UserVO> userList(Criteria cri);
}
