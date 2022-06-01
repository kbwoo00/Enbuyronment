package com.itwill.enbuyronment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.enbuyronment.domain.BoardVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.persistence.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDao;

	//글 작성
	@Override
	public void writeBoard(BoardVO vo) {
		log.info("writeBoard(vo) 호출");
		
		boardDao.insertBoard(vo);
	}

	//상단고정 공지 호출
	@Override
	public List<BoardVO> getFixedNotice() {
		log.info("getFixedNotice() 호출");
		
		return boardDao.getFixedNotice();
	}

	//글 개수 카운트
	@Override
	public Integer boardCnt(String boardName) {
		log.info("boardCnt(boardName) 호출");
		
		return boardDao.boardCnt(boardName);
	}

	//글 목록 호출
	@Override
	public List<BoardVO> getBoardList(Criteria cri, String boardName) {
		log.info("getBoardList(cri,boardName) 호출");
		
		return boardDao.getBoardList(cri, boardName);
	}

	//글 상세정보 가져오기
	@Override
	public BoardVO getBoardDetail(BoardVO vo) {
		log.info("getBoardDetail(vo) 호출");
		
		return boardDao.getBoardDetail(vo);
	}

	//글 수정
	@Override
	public void updateBoard(BoardVO vo) {
		log.info("updateBoard(vo) 호출");
		
		boardDao.updateBoard(vo);
	}

	//글 삭제
	@Override
	public void deleteBoard(BoardVO vo) {
		log.info("deleteBoard(vo) 호출");
		
		boardDao.deleteBoard(vo);
	}

	//답변여부 확인
	@Override
	public Integer checkAns(BoardVO vo) {
		log.info("checkAns(vo) 호출");
		
		return boardDao.checkAns(vo);
	}

}
