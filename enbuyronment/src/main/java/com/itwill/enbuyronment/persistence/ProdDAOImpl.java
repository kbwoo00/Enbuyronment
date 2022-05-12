package com.itwill.enbuyronment.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.Criteria;
import com.itwill.enbuyronment.domain.ProductVO;
import com.itwill.enbuyronment.domain.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProdDAOImpl implements ProdDAO {

	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.ProdMapper";
	
	//브랜드&용도명 가져오기 동작
	@Override
	public Map<String, List<String>> getBraCat() {
		log.info("DAO : getBraCat() 호출");
		
		Map<String, List<String>> braCat = new HashMap();
		braCat.put("brand", sqlSession.selectList(NAMESPACE+".getBrand"));
		braCat.put("cate", sqlSession.selectList(NAMESPACE+".getCate"));
		
		log.info(braCat.get("brand")+"");
		log.info(braCat.get("cate")+"");
		
		return braCat;
	}
	
	//상품등록 동작
	@Override
	public void regProduct(ProductVO vo) {
		log.info("DAO : regProduct(vo) 호출");
		
		sqlSession.insert(NAMESPACE+".insertProd", vo);
	}

	//상품정보 가져오기 동작
	@Override
	public ProductVO getProd(Integer prodNo) {
		log.info("DAO : getProd(prodNo) 호출");
		
		return sqlSession.selectOne(NAMESPACE+".getProd", prodNo);
	}
	
	//리뷰 개수 가져오기 동작
	@Override
	public Integer getReviewCnt(Integer prodNo) {
		log.info("DAO : getReviewCnt(prodNo) 호출");
		
		return sqlSession.selectOne(NAMESPACE+".getReviewCnt", prodNo);
	}

	//리뷰목록 가져오기 동작
	@Override
	public List<ReviewVO> getReviewList(Integer prodNo, Criteria cri) {
		log.info("DAO : getReview(prodNo) 호출");
		
		Map<String, Integer> data = new HashMap();
		data.put("prodNo", prodNo);
		data.put("pageStart", cri.getPageStart());
		data.put("perDataCnt", cri.getPerDataCnt());
		
		return sqlSession.selectList(NAMESPACE+".getReview", data);
	}

	//상품수정 동작
	@Override
	public void modProduct(ProductVO vo) {
		log.info("DAO : modProduct(vo) 호출");
		
		if(vo.getThumb().equals("") && vo.getScript().equals("")) {
			//noImg
			sqlSession.update(NAMESPACE+".updateProdNoImg", vo);
			
		} else if(vo.getScript().equals("")) {
			//thumb & prodImg2,3,4
			sqlSession.update(NAMESPACE+".updateProdThumb", vo);
			
		} else if(vo.getThumb().equals("")) {
			//script
			sqlSession.update(NAMESPACE+".updateProdScript", vo);
			
		} else {
			//full
			sqlSession.update(NAMESPACE+".updateProdFull", vo);
		}
	}
	
}
