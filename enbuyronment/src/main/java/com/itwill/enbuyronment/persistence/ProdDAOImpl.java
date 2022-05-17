package com.itwill.enbuyronment.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.paging.Criteria;
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

	//상품삭제 동작
	@Override
	public void delProduct(Integer prodNo) {
		log.info("DAO : delProduct(prodNo) 호출");
		
		sqlSession.delete(NAMESPACE+".deleteProd", prodNo);
	}

	//상품 개수 가져오기 동작
	@Override
	public Integer getProductCnt(String brand, String cate, String keyword) {
		log.info("DAO : getProductCnt() 호출");
		
		Map<String, Object> data = new HashMap();
		data.put("keyword", keyword);
		
		if(brand.equals("전체") && cate.equals("All")) {
			return sqlSession.selectOne(NAMESPACE+".getProductCntAll", data);
			
		} else if(!brand.equals("전체") && cate.equals("All")) {
			data.put("brand", brand);
			return sqlSession.selectOne(NAMESPACE+".getProductCntBr", data);
			
		} else if(brand.equals("전체") && !cate.equals("All")) {
			data.put("cate", cate);
			return sqlSession.selectOne(NAMESPACE+".getProductCntCa", data);
			
		} else {
			data.put("brand", brand); data.put("cate", cate);
			return sqlSession.selectOne(NAMESPACE+".getProductCntBrCa", data);
		}
		
	}

	//상품목록 가져오기 동작
	@Override
	public List<ProductVO> getProductList(Criteria cri, String brand, String cate, Integer sort, String keyword) {
		log.info("DAO : getProductList(cri) 호출");
		
		String sortby = "";
		switch(sort) {
			case 2: sortby = "avg(star) desc"; break;
			case 3: sortby = "price desc"; break;
			case 4: sortby = "price"; break;
			default: sortby = "prod_no desc";
		}
		
		Map<String, Object> data = new HashMap();
		data.put("sortby", sortby); data.put("keyword", keyword);
		data.put("pageStart", cri.getPageStart()); data.put("perDataCnt", cri.getPerDataCnt());
		
		if(brand.equals("전체") && cate.equals("All")) {
			return sqlSession.selectList(NAMESPACE+".getProductAll", data);
			
		} else if(!brand.equals("전체") && cate.equals("All")) {
			data.put("brand", brand);
			return sqlSession.selectList(NAMESPACE+".getProductBr", data);
			
		} else if(brand.equals("전체") && !cate.equals("All")) {
			data.put("cate", cate);
			return sqlSession.selectList(NAMESPACE+".getProductCa", data);
			
		} else {
			data.put("brand", brand); data.put("cate", cate);
			return sqlSession.selectList(NAMESPACE+".getProductBrCa", data);
		}
	}
	
}
