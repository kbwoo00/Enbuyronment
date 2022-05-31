package com.itwill.enbuyronment.persistence;

import java.util.List;

import com.itwill.enbuyronment.domain.OrderVO;
import com.itwill.enbuyronment.domain.SearchOrderVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;

public interface AdminDAO {

	//총 유저수 카운트
	public int getUserTotalCnt();
	
	//유저 목록 가져오기
	public List<UserVO> userList(Criteria cri);
	
	//유저 삭제하기
	public void deleteUsers(String userId);
	
	//유저 주문목록 수 카운트
	public Integer getUserOrderCnt();
	
	//유저 주문목록 가져오기
	public List<OrderVO> getUserOrderList(Criteria cri);

	//유저 주문품목수 카운트
	public List<Integer> getOrderProdCnt();
	
	//주문번호 검색하기
	public OrderVO searchOrderNo(String orderNo);
	
	//주문번호 검색 주문품목수 카운트
	public Integer searchOrderNoProdCnt(String orderNo);
	
	//상세검색 주문목록 수 카운트
	public Integer getSearchOrderCnt(SearchOrderVO vo);
	
	//상세검색 주문목록 가져오기
	public List<OrderVO> getSearchOrderList(Criteria cri, SearchOrderVO vo);
	
	//상세검색 주문품목수 카운트
	public List<Integer> getSearchOrderProdCnt(SearchOrderVO vo);

	//주문상태 변경하기
	public void updateStatus(List<String> statAndOrderNo);

	//운송장번호 입력하기
	public void updateTrackNo(OrderVO vo);
}
