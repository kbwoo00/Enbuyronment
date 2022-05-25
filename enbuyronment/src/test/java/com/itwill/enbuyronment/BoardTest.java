package com.itwill.enbuyronment;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwill.enbuyronment.domain.BoardVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.persistence.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardTest {

	@Inject
	private BoardDAO boardDao;
	
	//@Test
	public void 작성테스트() {
		BoardVO vo = new BoardVO();
		vo.setBoardName("FAQ");
		vo.setTitle("테스트");
		vo.setContent("테스트입니다");
		vo.setStatus(1);
		
		boardDao.insertBoard(vo);
	}
	
	//@Test
	public void 목록테스트() {
		String boardName = "notice";
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		
		if(boardName.equals("notice")) {
			List<BoardVO> fixedNotice = boardDao.getFixedNotice();
			log.info(fixedNotice+"");
			
			cri.setPerDataCnt(15 - fixedNotice.size());
			
		} else {
			cri.setPerDataCnt(15);
		}
		
		log.info(boardDao.getBoardList(cri, boardName)+"");
	}
	
	//@Test
	public void 상세테스트() {
		BoardVO vo = new BoardVO();
		vo.setBoardName("notice");
		vo.setBoardNo(1);
		
		log.info("{}",boardDao.getBoardDetail(vo));
	}
}
