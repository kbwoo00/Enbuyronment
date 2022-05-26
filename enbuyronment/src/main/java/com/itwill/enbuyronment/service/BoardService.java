package com.itwill.enbuyronment.service;

import java.util.List;

import com.itwill.enbuyronment.domain.BoardVO;
import com.itwill.enbuyronment.domain.paging.Criteria;

public interface BoardService {

	//글 작성
	public void writeBoard(BoardVO vo);
	
	//상단고정 공지 호출
	public List<BoardVO> getFixedNotice();
	
	//글 개수 카운트
	public Integer boardCnt(String boardName);
	
	//글 목록 호출
	public List<BoardVO> getBoardList(Criteria cri, String boardName);
	
	//글 상세정보 가져오기
	public BoardVO getBoardDetail(BoardVO vo);
	
	//글 수정
	public void updateBoard(BoardVO vo);
	
	//글 삭제
	public void deleteBoard(BoardVO vo);
}
