package com.itwill.enbuyronment.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.CartVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CartDAOImpl implements CartDAO{

	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.CartMapper";
	
	//상품추가 동작
	@Override
	public void insertCart(CartVO cart) {
		sqlSession.insert(NAMESPACE + ".insertCart", cart);
	}

	//동일상품 추가 동작
	@Override
	public void addAmount(CartVO cart) {
		sqlSession.update(NAMESPACE + ".addAmount", cart);
	}
	
	//장바구니 상품여부 확인 동작
	@Override
	public CartVO getCartProd(CartVO cart) {
		return sqlSession.selectOne(NAMESPACE + ".getCartProd", cart);
	}

	//목록 불러오기 동작
	@Override
	public List<CartVO> getCartList(String uid) {
		return sqlSession.selectList(NAMESPACE + ".getCartList", uid);
	}

	//상품삭제 동작
	@Override
	public void delProd(CartVO cart) {
		sqlSession.delete(NAMESPACE + ".delProd", cart);
	}

	//수량변경 동작
	@Override
	public Integer updateAmount(CartVO vo) {
		log.info("DAO : updateAmount(vo) 호출");
		
		return sqlSession.update(NAMESPACE + ".updateAmount", vo);
	}

	//선택상품 상태 변경 동작
	@Override
	public void upStat(List<Integer> prodNoList, String uid) {
		log.info("DAO : upStat(prodNoList,uid) 호출");
		
		String prodNo = "";
		for(int i=0; i<prodNoList.size(); i++) {
			prodNo += (i==0 ? prodNoList.get(i) : ","+prodNoList.get(i));
		}
		
		Map<String, String> data = new HashMap();
		data.put("uid", uid);
		data.put("prodNo", prodNo);
		
		sqlSession.update(NAMESPACE+".modStat", data);
	}
	
	//주문목록 불러오기 동작
	@Override
	public List<CartVO> getOrderList(String uid) {
		return sqlSession.selectList(NAMESPACE + ".getOrderList", uid);
	}
}
