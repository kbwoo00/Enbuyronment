package com.itwill.enbuyronment.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.OrderVO;
import com.itwill.enbuyronment.domain.SearchOrderVO;
import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.AdminMapper";
	
	//총 유저수 카운트
	@Override
	public int getUserTotalCnt() {
		return sqlSession.selectOne(NAMESPACE + ".userTotalCnt");
	}

	//유저 목록 가져오기
	@Override
	public List<UserVO> userList(Criteria cri) {
		
		return sqlSession.selectList(NAMESPACE + ".userList", cri);
	}

	//유저 삭제하기
	@Override
	public void deleteUsers(String userId) {
		sqlSession.delete(NAMESPACE + ".deleteUsers", userId); 
	}
	
	//유저 주문목록 수 카운트
	@Override
	public Integer getUserOrderCnt() {
		log.info("DAO : getUserOrderCnt() 호출");
		
		return sqlSession.selectOne(NAMESPACE+".userOrderCnt");
	}

	//유저 주문목록 가져오기
	@Override
	public List<OrderVO> getUserOrderList(Criteria cri) {
		log.info("DAO : getUserOrderList(cri) 호출");
		
		return sqlSession.selectList(NAMESPACE+".userOrderList", cri);
	}

	//유저 주문품목수 카운트
	@Override
	public List<Integer> getOrderProdCnt() {
		log.info("DAO : getOrderProdCnt() 호출");
		
		return sqlSession.selectList(NAMESPACE+".orderProdCnt");
	}
	
	//주문번호 검색하기
	@Override
	public OrderVO searchOrderNo(String orderNo) {
		log.info("DAO : searchOrderNo(orderNo) 호출");
		
		return sqlSession.selectOne(NAMESPACE+".getOrderWithNo", orderNo);
	}
	
	//주문번호 검색 주문품목수 카운트
	@Override
	public Integer searchOrderNoProdCnt(String orderNo) {
		log.info("DAO : searchOrderNoProdCnt(orderNo) 호출");
		
		return sqlSession.selectOne(NAMESPACE+".orderProdCntWithNo", orderNo);
	}
	
	//상세검색 주문목록 수 카운트
	@Override
	public Integer getSearchOrderCnt(SearchOrderVO vo) {
		log.info("DAO : getSearchOrderCnt(vo) 호출");
		
		String uid = "";
		String date1 = "'2022-04-01'";
		String date2 = "now()";
		String status = "";
		
		if(!vo.getUid().equals("")) {
			uid = "and uid = '"+vo.getUid()+"'";
		}
		if(!vo.getDate1().equals("")) {
			date1 = "'"+vo.getDate1()+"'";
			date2 = "'"+vo.getDate2()+"'";
		}
		if(!vo.getStatus().equals("0")) {
			status = "and status = '"+vo.getStatus()+"'";
		}
		
		Map<String, String> data = new HashMap();
		data.put("uid", uid);
		data.put("date1", date1);
		data.put("date2", date2);
		data.put("status", status);
		
		return sqlSession.selectOne(NAMESPACE+".searchOrderCnt", data);
	}
	
	//상세검색 주문목록 가져오기
	@Override
	public List<OrderVO> getSearchOrderList(Criteria cri, SearchOrderVO vo) {
		log.info("DAO : searchOrderNoProdCnt(orderNo) 호출");
		
		String uid = "";
		String date1 = "'2022-04-01'";
		String date2 = "now()";
		String status = "";
		
		if(!vo.getUid().equals("")) {
			uid = "and uid = '"+vo.getUid()+"'";
		}
		if(!vo.getDate1().equals("")) {
			date1 = "'"+vo.getDate1()+"'";
			date2 = "'"+vo.getDate2()+"'";
		}
		if(!vo.getStatus().equals("0")) {
			status = "and status = '"+vo.getStatus()+"'";
		}
		
		Map<String, Object> data = new HashMap();
		data.put("uid", uid);
		data.put("date1", date1);
		data.put("date2", date2);
		data.put("status", status);
		data.put("cri", cri);
		
		return sqlSession.selectList(NAMESPACE+".searchOrderList", data);
	}
	
	//상세검색 주문품목수 카운트
	@Override
	public List<Integer> getSearchOrderProdCnt(SearchOrderVO vo) {
		log.info("DAO : getSearchOrderProdCnt(vo) 호출");
		
		String uid = "";
		String date1 = "'2022-04-01'";
		String date2 = "now()";
		String status = "";
		
		if(!vo.getUid().equals("")) {
			uid = "and uid = '"+vo.getUid()+"'";
		}
		if(!vo.getDate1().equals("")) {
			date1 = "'"+vo.getDate1()+"'";
			date2 = "'"+vo.getDate2()+"'";
		}
		if(!vo.getStatus().equals("0")) {
			status = "and status = '"+vo.getStatus()+"'";
		}
		
		Map<String, Object> data = new HashMap();
		data.put("uid", uid);
		data.put("date1", date1);
		data.put("date2", date2);
		data.put("status", status);
		
		return sqlSession.selectList(NAMESPACE+".searchOrderProdCnt", data);
	}

	//주문상태 변경하기
	@Override
	public void updateStatus(List<String> statAndOrderNo) {
		log.info("DAO : updateStatus(statAndOrderNo) 호출");
		
		String orderNo = "";
		for(int i=1; i<statAndOrderNo.size(); i++) {
			orderNo += (i==1 ? statAndOrderNo.get(i) : ","+statAndOrderNo.get(i));
		}
		
		Map<String, String> data = new HashMap();
		data.put("status", statAndOrderNo.get(0));
		data.put("orderNo", orderNo);
		
		sqlSession.update(NAMESPACE+".updateStatus", data);
	}

	//운송장번호 입력하기
	@Override
	public void updateTrackNo(OrderVO vo) {
		log.info("DAO : updateTrackNo(vo) 호출");
		
		sqlSession.update(NAMESPACE+".updateTrackNo", vo);
	}
}
