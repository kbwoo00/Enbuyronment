package com.itwill.enbuyronment;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwill.enbuyronment.domain.UserVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.persistence.AdminDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class AdminTest {
	
	@Inject
	private AdminDAO adminDao;
	
	@Test
	public void 페이징처리() {
		log.info("유저 총 인원 = {}", adminDao.getUserTotalCnt());
		Criteria cri = new Criteria();
		
		List<UserVO> userList = adminDao.userList(cri);
		log.info("유저 목록 = {}", userList);
		
		
		
	}
	

}
