package com.itwill.enbuyronment.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.enbuyronment.domain.BoardVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.domain.paging.PageMaker;
import com.itwill.enbuyronment.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	private BoardService boardService;
	
	//글 작성
	@GetMapping("/write")
	public String writeGET() {
		log.info("writeGET() 호출");
		
		return "/board/write";
	}
	
	@PostMapping("/write")
	public String writePOST(BoardVO vo, RedirectAttributes rttr) {
		log.info("writePOST() 호출");
		
		boardService.writeBoard(vo);
		rttr.addFlashAttribute("msg", "writeOK");
		
		return "redirect:/board/list";
	}
	
	//목록 불러오기
	@GetMapping("/{boardName}")
	public String listGET(@PathVariable String boardName, Criteria cri, Model model) {
		log.info("listGET() 호출");
		
		if(boardName.equals("notice")) {
			List<BoardVO> fixedNotice = boardService.getFixedNotice();
			
			cri.setPerDataCnt(15 - fixedNotice.size());
			model.addAttribute("fixedNotice", fixedNotice);
			
		} else {
			cri.setPerDataCnt(15);
		}
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(boardService.boardCnt(boardName));
		
		model.addAttribute("boardList", boardService.getBoardList(cri, boardName));
		model.addAttribute("pageInfo", pm);
		model.addAttribute("boardName", boardName);
		
		return "/board/list";
	}
	
	//글 상세
	@GetMapping("/{boardName}/{boardNo}")
	public String detailGET(@PathVariable String boardName, @PathVariable Integer boardNo, Model model) {
		log.info("detailGET() 호출");
		
		BoardVO vo = new BoardVO();
		vo.setBoardNo(boardNo);
		vo.setBoardName(boardName);
		
		model.addAttribute("boardDetail", boardService.getBoardDetail(vo));
		
		return "/board/detail";
	}
	
	//글 수정
	@GetMapping("/{boardName}/{boardNo}/update")
	public String updateGET(@PathVariable String boardName, @PathVariable Integer boardNo, Model model) {
		log.info("updateGET() 호출");
		
		BoardVO vo = new BoardVO();
		vo.setBoardNo(boardNo);
		vo.setBoardName(boardName);
		
		model.addAttribute("boardDetail", boardService.getBoardDetail(vo));
		
		return "/board/update";
	}
	
	@PostMapping("/{boardName}/{boardNo}/update")
	public String updatePOST(@PathVariable String boardName, @PathVariable Integer boardNo, BoardVO vo, RedirectAttributes rttr) {
		log.info("updatePOST() 호출");
		
		boardService.updateBoard(vo);
		rttr.addFlashAttribute("msg", "updateOK");
		
		return "redirect:/board/"+boardName;
	}
	
	//글 삭제
	@GetMapping("/{boardName}/{boardNo}/delete")
	public String deleteGET(@PathVariable String boardName, @PathVariable Integer boardNo, RedirectAttributes rttr) {
		log.info("deleteGET() 호출");
		
		BoardVO vo = new BoardVO();
		vo.setBoardNo(boardNo);
		vo.setBoardName(boardName);
		
		boardService.deleteBoard(vo);
		rttr.addFlashAttribute("msg", "deleteOK");
		
		return "redirect:/board/"+boardName;
	}
}
