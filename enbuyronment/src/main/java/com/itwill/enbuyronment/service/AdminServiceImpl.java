package com.itwill.enbuyronment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.enbuyronment.domain.OrderVO;
import com.itwill.enbuyronment.domain.SearchOrderVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.persistence.AdminDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private AdminDAO adminDao;

	//총 유저수
	@Override
	public int getUserTotalCnt() {
		return adminDao.getUserTotalCnt();
	}

	//유저 목록
	@Override
	public List<UserVO> getUserList(Criteria cri) {
		return adminDao.userList(cri);
	}

	//유저 삭제
	@Override
	public void deleteUsers(List<String> userIdList) {
		for (String userId : userIdList) {
			adminDao.deleteUsers(userId);
		}
	}
	
	//유저 주문목록 수
	@Override
	public Integer getUserOrderCnt() {
		log.info("getUserOrderCnt() 호출");
		
		return adminDao.getUserOrderCnt();
	}

	//유저 주문목록
	@Override
	public List<OrderVO> getUserOrderList(Criteria cri) {
		log.info("getUserOrderList(cri) 호출");
		
		return adminDao.getUserOrderList(cri);
	}

	//유저 주문품목수
	@Override
	public List<Integer> getOrderProdCnt() {
		log.info("getOrderProdCnt() 호출");
		
		return adminDao.getOrderProdCnt();
	}
	
	//주문번호 검색
	@Override
	public OrderVO searchOrderNo(String orderNo) {
		log.info("searchOrderNo(orderNo) 호출");
		
		return adminDao.searchOrderNo(orderNo);
	}
	
	//주문번호 검색 주문품목수 카운트
	@Override
	public Integer searchOrderNoProdCnt(String orderNo) {
		log.info("searchOrderNoProdCnt(orderNo) 호출");
		
		return adminDao.searchOrderNoProdCnt(orderNo);
	}
	
	//상세검색 주문목록 수
	@Override
	public Integer getSearchOrderCnt(SearchOrderVO vo) {
		log.info("getSearchOrderCnt(vo) 호출");
		
		return adminDao.getSearchOrderCnt(vo);
	}
	
	//상세검색 주문목록
	@Override
	public List<OrderVO> getSearchOrderList(Criteria cri, SearchOrderVO vo) {
		log.info("getSearchOrderList(cri,vo) 호출");
		
		return adminDao.getSearchOrderList(cri, vo);
	}
	
	//상세검색 주문품목수
	@Override
	public List<Integer> getSearchOrderProdCnt(SearchOrderVO vo) {
		log.info("getSearchOrderProdCnt(vo) 호출");
		
		return adminDao.getSearchOrderProdCnt(vo);
	}

	//주문상태변경
	@Override
	public void updateStatus(List<String> statAndOrderNo) {
		log.info("updateStatus(statAndOrderNo) 호출");
		
		adminDao.updateStatus(statAndOrderNo);
	}

	//운송장번호 입력
	@Override
	public void updateTrackNo(OrderVO vo) {
		log.info("updateTrackNo(vo) 호출");
		
		adminDao.updateTrackNo(vo);
	}
}
