package com.itwill.enbuyronment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.enbuyronment.domain.Criteria;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.persistence.AdminDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private AdminDAO adminDao;

	@Override
	public int getUserTotalCnt() {
		return adminDao.getUserTotalCnt();
	}

	@Override
	public List<UserVO> getUserList(Criteria cri) {
		return adminDao.userList(cri);
	}

}
