package com.itwill.enbuyronment.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwill.enbuyronment.domain.ProductVO;
import com.itwill.enbuyronment.domain.ReviewVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.persistence.ProdDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProdServiceImpl implements ProdService {

	@Inject
	private ProdDAO prodDao;
	
	//브랜드&용도명 가져오기
	@Override
	public Map<String, List<String>> brandCate() throws Exception {
		log.info("BrandCate() 호출");
		
		return prodDao.getBraCat();
	}

	//상품 등록
	@Override
	public void prodUpload(MultipartHttpServletRequest request) throws Exception {
		log.info("prodUpload(request) 호출");
		
		String path = request.getRealPath("/upload");
		log.info("path : " + path);
		
		List<MultipartFile> prodImg = request.getFiles("prodImg");
		ProductVO vo = new ProductVO();
		List<String> files = new ArrayList();
		
		for(int i = 0; i < 5; i++) {
			if(!prodImg.get(i).isEmpty() ) {
				
				UUID uuid = UUID.randomUUID();
				String fileName = uuid.toString() + "_" + prodImg.get(i).getOriginalFilename();
				
				File uploadFile = new File(path + "\\" + fileName);
				files.add(fileName);
				log.info("업로드 파일 : " + files);
				
				prodImg.get(i).transferTo(uploadFile);
			} else {
				files.add("");
			}
		}
		log.info("파일 업로드 완료");
		
		vo.setProdName(request.getParameter("prodName"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setStock(Integer.parseInt(request.getParameter("stock")));
		vo.setFilePath(path);
		vo.setThumb(files.get(0));
		vo.setProdImg2(files.get(1));
		vo.setProdImg3(files.get(2));
		vo.setProdImg4(files.get(3));
		vo.setScript(files.get(4));
		vo.setCateName(request.getParameter("cateName"));
		vo.setBrandName(request.getParameter("brandName"));
		
		prodDao.regProduct(vo);
	}

	//상품정보 가져오기
	@Override
	public ProductVO prodDetail(Integer prodNo) throws Exception {
		log.info("prodDetail(prodNo) 호출");
		
		return prodDao.getProd(prodNo);
	}

	//리뷰 개수 가져오기
	@Override
	public Integer reviewCnt(Integer prodNo) throws Exception {
		log.info("reviewCnt(prodNo) 호출");
		
		return prodDao.getReviewCnt(prodNo);
	}
	
	//리뷰목록 가져오기
	@Override
	public List<ReviewVO> reviewList(Integer prodNo, Criteria cri) throws Exception {
		log.info("reviewList(prodNo) 호출");
		
		return prodDao.getReviewList(prodNo, cri);
	}

	//상품 수정
	@Override
	public void prodModify(Integer prodNo, MultipartHttpServletRequest request) throws Exception {
		log.info("prodModify(request) 호출");
		
		String path = request.getRealPath("/upload");
		log.info("path : " + path);
		
		List<MultipartFile> prodImg = request.getFiles("prodImg");
		ProductVO vo = new ProductVO();
		List<String> files = new ArrayList();
		
		for(int i = 0; i < 5; i++) {
			if(!prodImg.get(i).isEmpty() ) {
				
				UUID uuid = UUID.randomUUID();
				String fileName = uuid.toString() + "_" + prodImg.get(i).getOriginalFilename();
				
				File uploadFile = new File(path + "\\" + fileName);
				files.add(fileName);
				log.info("업로드 파일 : " + files);
				
				prodImg.get(i).transferTo(uploadFile);
			} else {
				files.add("");
			}
		}
		log.info("파일 업로드 완료");
		vo.setProdNo(prodNo);
		vo.setProdName(request.getParameter("prodName"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setStock(Integer.parseInt(request.getParameter("stock")));
		vo.setFilePath(path);
		vo.setThumb(files.get(0));
		vo.setProdImg2(files.get(1));
		vo.setProdImg3(files.get(2));
		vo.setProdImg4(files.get(3));
		vo.setScript(files.get(4));
		vo.setCateName(request.getParameter("cateName"));
		vo.setBrandName(request.getParameter("brandName"));
		
		prodDao.modProduct(vo);
	}

	//상품 삭제
	@Override
	public void prodDelete(Integer prodNo) throws Exception {
		log.info("prodDelete(prodNo) 호출");
		
		prodDao.delProduct(prodNo);
	}

	//상품 개수 가져오기
	@Override
	public Integer prodCnt(String brand, String cate, String keyword) throws Exception {
		log.info("prodCnt() 호출");
		
		return prodDao.getProductCnt(brand, cate, keyword);
	}

	//상품목록 가져오기
	@Override
	public List<ProductVO> prodList(Criteria cri, String brand, String cate, Integer sort, String keyword) throws Exception {
		log.info("prodList(cri) 호출");
		
		return prodDao.getProductList(cri, brand, cate, sort, keyword);
	}

	//메인페이지 상품목록 가져오기 동작
	@Override
	public List<ProductVO> getMainProd(String brand) {
		log.info("getMainProd(brand) 호출");
		
		return prodDao.getMainProd(brand);
	}
	
}
