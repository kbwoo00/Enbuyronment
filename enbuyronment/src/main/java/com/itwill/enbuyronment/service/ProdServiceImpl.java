package com.itwill.enbuyronment.service;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwill.enbuyronment.domain.ProductVO;
import com.itwill.enbuyronment.persistence.ProdDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProdServiceImpl implements ProdService {

	@Inject
	private ProdDAO prodDao;

	//상품 등록
	@Override
	public void prodUpload(MultipartHttpServletRequest request) throws Exception {
		log.info("prodUpload(request) 호출");
		
		String path = request.getRealPath("/upload");
		log.info("path : " + path);
		
		List<MultipartFile> prodImg = request.getFiles("prodImg");
		ProductVO vo = new ProductVO();
		
		for(int i = 0; i < prodImg.size(); i++) {
			if(!prodImg.get(i).isEmpty() ) {
				
				File uploadFile = new File(path + "\\" + prodImg.get(i).getOriginalFilename());
				log.info("업로드 파일 : " + uploadFile);
				
				prodImg.get(i).transferTo(uploadFile);
			}
		}
		log.info("파일 업로드 완료");
		
		vo.setProdName(request.getParameter("prodName"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setStock(Integer.parseInt(request.getParameter("stock")));
		vo.setFilePath(path);
		vo.setThumb(prodImg.get(0).getOriginalFilename());
		vo.setProdImg2(prodImg.get(1).getOriginalFilename());
		vo.setProdImg3(prodImg.get(2).getOriginalFilename());
		vo.setProdImg4(prodImg.get(3).getOriginalFilename());
		vo.setScript(prodImg.get(4).getOriginalFilename());
		vo.setCateNo(Integer.parseInt(request.getParameter("cateNo")));
		vo.setBrandNo(Integer.parseInt(request.getParameter("brandNo")));
		
		prodDao.regProduct(vo);
	}
	
}
