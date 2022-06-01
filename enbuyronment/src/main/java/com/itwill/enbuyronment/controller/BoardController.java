package com.itwill.enbuyronment.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.enbuyronment.domain.BoardVO;
import com.itwill.enbuyronment.domain.paging.Criteria;
import com.itwill.enbuyronment.domain.paging.PageMaker;
import com.itwill.enbuyronment.service.BoardService;
import com.itwill.enbuyronment.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	private BoardService boardService;
	
	@Inject
	private UserService userService;
	
	//글 작성
	@GetMapping("/write")
	public String writeGET() {
		log.info("writeGET() 호출");
		
		return "/board/write";
	}
	
	@PostMapping("/write")
	public String writePOST(BoardVO vo, RedirectAttributes rttr, @SessionAttribute(value = "userId", required = false) String uid) {
		log.info("writePOST() 호출");
		
		vo.setUid(uid);
		vo.setWriter("관리자");
		
		boardService.writeBoard(vo);
		rttr.addFlashAttribute("msg", "writeOK");
		
		return "redirect:/board/"+vo.getBoardName();
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
		model.addAttribute("presentPage", cri.getPage());
		model.addAttribute("boardName", boardName);
		
		if(boardName.equals("QnA")) {
			return "/board/qnaList";
		}
		
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
		
		if(boardName.equals("QnA")) {
			return "/board/qnaDetail";
		}
		
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
		
		if(boardName.equals("QnA")) {
			return "/board/qnaUpdate";
		}
		
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
	
	//문의/답변 작성
	@GetMapping("/writeQnA")
	public String writeQnAGET() {
		log.info("writeQnAGET() 호출");
		
		return "/board/qnaWrite";
	}
	
	@PostMapping("/writeQnA")
	public String writeQnAPOST(BoardVO vo, RedirectAttributes rttr,
			@SessionAttribute(value = "userId", required = false) String uid) {
		log.info("writeQnAPOST() 호출");
		
		vo.setUid(uid);
		vo.setWriter(userService.getUserInfo(uid).getName());
		
		boardService.writeBoard(vo);
		rttr.addFlashAttribute("msg", "writeOK");
		
		return "redirect:/board/QnA";
	}
	
	//답변여부 확인
	@ResponseBody
	@PostMapping("/checkAns")
	public String checkAns(@RequestBody BoardVO vo) {
		log.info("checkAns() 호출");
		
		if(boardService.checkAns(vo) == 1) {
			return "NO";
		} else {
			return "YES";
		}
	}
}
