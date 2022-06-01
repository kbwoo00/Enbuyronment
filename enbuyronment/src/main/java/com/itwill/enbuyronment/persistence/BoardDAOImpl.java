package com.itwill.enbuyronment.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.enbuyronment.domain.BoardVO;
import com.itwill.enbuyronment.domain.paging.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwill.enbuyronment.mapper.BoardMapper";

	//글 작성 동작
	@Override
	public void insertBoard(BoardVO vo) {
		log.info("DAO : insertBoard(vo) 호출");
		
		Integer maxNo = sqlSession.selectOne(NAMESPACE+".selMaxBno");
		
		if(maxNo != null) {
			if(vo.getBoardNo() != null) {
				vo.setReRef(vo.getBoardNo());
			} else {
				vo.setReRef(maxNo+1);
			}
			vo.setBoardNo(maxNo+1);
			
		} else {
			vo.setBoardNo(1);
			vo.setReRef(1);
		}
		
		sqlSession.insert(NAMESPACE+".insertBoard", vo);
	}
	
	//상단고정 공지 불러오기 동작
	@Override
	public List<BoardVO> getFixedNotice() {
		log.info("DAO : getFixedNorice() 호출");
		
		return sqlSession.selectList(NAMESPACE+".getFixedNotice");
	}
	
	//글 개수 카운트 동작
	@Override
	public Integer boardCnt(String boardName) {
		log.info("DAO : boardCnt(boardName) 호출");
		
		return sqlSession.selectOne(NAMESPACE+".boardCnt", boardName);
	}

	//글 목록 불러오기 동작
	@Override
	public List<BoardVO> getBoardList(Criteria cri, String boardName) {
		log.info("DAO : getBoardList(cri,boardName) 호출");
		
		Map<String, Object> data = new HashMap();
		data.put("boardName", boardName);
		data.put("cri", cri);
		
		return sqlSession.selectList(NAMESPACE+".getBoardList", data);
	}

	//글 상세정보 가져오기 동작
	@Override
	public BoardVO getBoardDetail(BoardVO vo) {
		log.info("DAO : getBoardDetail(vo) 호출");
		
		return sqlSession.selectOne(NAMESPACE+".getBoard", vo);
	}

	//글 수정 동작
	@Override
	public void updateBoard(BoardVO vo) {
		log.info("DAO : updateBoard(vo) 호출");
		
		sqlSession.update(NAMESPACE+".updateBoard", vo);
	}

	//글 삭제 동작
	@Override
	public void deleteBoard(BoardVO vo) {
		log.info("DAO : deleteBoard(vo) 호출");
		
		sqlSession.delete(NAMESPACE+".deleteBoard", vo);
	}
	
	//답변여부 확인 동작
	@Override
	public Integer checkAns(BoardVO vo) {
		log.info("DAO : checkAns(vo) 호출");
		
		if(sqlSession.selectOne(NAMESPACE+".checkAnswer", vo) != null) {
			return 1;
		} else {
			return 0;
		}
	}

}
