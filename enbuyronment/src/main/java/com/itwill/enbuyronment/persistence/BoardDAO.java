package com.itwill.enbuyronment.persistence;

import java.util.List;

import com.itwill.enbuyronment.domain.BoardVO;
import com.itwill.enbuyronment.domain.paging.Criteria;

public interface BoardDAO {

	//글 작성 동작
	public void insertBoard(BoardVO vo);
	
	//상단고정 공지 불러오기 동작
	public List<BoardVO> getFixedNotice();
	
	//글 개수 카운트 동작
	public Integer boardCnt(String boardName);
	
	//글 목록 불러오기 동작
	public List<BoardVO> getBoardList(Criteria cri, String boardName);
	
	//글 상세정보 가져오기 동작
	public BoardVO getBoardDetail(BoardVO vo);
	
	//글 수정 동작
	public void updateBoard(BoardVO vo);
	
	//글 삭제 동작
	public void deleteBoard(BoardVO vo);
}
