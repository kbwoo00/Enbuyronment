package com.itwill.enbuyronment.service;

import java.util.List;

import com.itwill.enbuyronment.domain.OrderVO;
import com.itwill.enbuyronment.domain.SearchOrderVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;

public interface AdminService {

	//총 유저수
	public int getUserTotalCnt();
	
	//유저 목록
	public List<UserVO> getUserList(Criteria cri);
	
	//유저 삭제
	public void deleteUsers(List<String> userIdList);
	
	//유저 주문목록 수
	public Integer getUserOrderCnt();
	
	//유저 주문목록
	public List<OrderVO> getUserOrderList(Criteria cri);
	
	//유저 주문품목수
	public List<Integer> getOrderProdCnt();
	
	//주문번호 검색
	public OrderVO searchOrderNo(String orderNo);
	
	//주문번호 검색 주문품목수
	public Integer searchOrderNoProdCnt(String orderNo);
	
	//상세검색 주문목록 수
	public Integer getSearchOrderCnt(SearchOrderVO vo);
	
	//상세검색 주문목록
	public List<OrderVO> getSearchOrderList(Criteria cri, SearchOrderVO vo);
	
	//상세검색 주문품목수
	public List<Integer> getSearchOrderProdCnt(SearchOrderVO vo);
	
	//주문상태변경
	public void updateStatus(List<String> statAndOrderNo);
	
	//운송장번호 입력
	public void updateTrackNo(OrderVO vo);
}
