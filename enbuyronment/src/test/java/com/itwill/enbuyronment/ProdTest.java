package com.itwill.enbuyronment;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwill.enbuyronment.domain.Criteria;
import com.itwill.enbuyronment.domain.ProductVO;
import com.itwill.enbuyronment.domain.ReviewVO;
import com.itwill.enbuyronment.persistence.ProdDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class ProdTest {

	@Inject
	private ProdDAO prodDao;
	
	//@Test
	public void 상품등록테스트() {
		
		//이미지파일 업로드 제외
		
		ProductVO vo = new ProductVO();
		vo.setProdName("첫상품");
		vo.setPrice(50000);
		vo.setStock(50);
		vo.setFilePath("C:\\workspace_team\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\enbuyronment\\upload");
		vo.setThumb("asdf1");
		vo.setProdImg2("asdf2");
		vo.setProdImg3("asdf3");
		vo.setProdImg4("asdf4");
		vo.setScript("asdf5");
		vo.setCateName("동구밭");
		vo.setBrandName("LIVING");
		
		prodDao.regProduct(vo);
	}
	
	//@Test
	public void 상세페이지테스트() {
		
		int prodNo = 8;
		Criteria cri = new Criteria();
		
		List<ReviewVO> reviewList = prodDao.getReviewList(prodNo, cri);
		log.info(reviewList+"");
		
		ProductVO vo = prodDao.getProd(prodNo);
		log.info(vo+"");
	}
	
	//@Test
	public void 상품수정테스트() {
		
		//이미지파일 업로드 제외
		
		ProductVO vo = new ProductVO();
		vo.setProdNo(6);
		vo.setProdName("수정이름");
		vo.setPrice(50000);
		vo.setStock(300);
		vo.setThumb("asdf1");
		vo.setProdImg2("asdf2");
		vo.setScript("asdf5");
		vo.setCateName("LIVING");    //1
		vo.setBrandName("동구밭");    //1
		
		prodDao.modProduct(vo);
	}
}
