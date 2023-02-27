package com.project.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.board.domain.BoardDTO;
import com.project.board.domain.BoardReplyDTO;
import com.project.board.service.BoardServiceImpl;
import com.project.board.service.ReplyService;
import com.project.member.domain.MemberDTO;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired

	private BoardServiceImpl boardService;

	@Autowired
	private ReplyService replyService;

	// 공지 게시글 목록보기
	@RequestMapping(value = "/board/admin/adminBoardList", method = RequestMethod.GET)
	public void adminBoardList(Model model) throws Exception {

		logger.info("BoardController에서 공지 게시글 목록보기 시작");

		List<BoardDTO> adminBoardList = boardService.adminBoardList();

		logger.info("공지 게시글 목록 ==> " + adminBoardList);

		model.addAttribute("adminBoardList", adminBoardList);

	}

	// 일반 게시글 목록보기
	@RequestMapping(value = "/board/member/memberBoardList", method = RequestMethod.GET)
	public void memberBoardList(Model model) throws Exception {

		logger.info("BoardController에서 일반 게시글 목록보기 시작");

		List<BoardDTO> memberBoardList = boardService.memberBoardList();

		logger.info("일반 게시글 목록 ==> " + memberBoardList);

		model.addAttribute("memberBoardList", memberBoardList);

	}

	// 작성 페이지 접속
	@RequestMapping(value = "/board/boardWritePage", method = RequestMethod.GET)
	public void connectMemberBoardWrite() throws Exception {

		logger.info("회원 게시글 작성 페이지 접속 memberBoardWrite - controller");

	}

	// 게시글 등록하기
	@RequestMapping(value = "/board/boardWrite", method = RequestMethod.POST)
	public String boardWrite(BoardDTO boardDTO, HttpSession session) throws Exception {

		logger.info("회원 게시글 작성 memberBoardWrite - controller");
		
		// 타입검사
		logger.info("타입검사 결과 : {}" , session.getAttribute("memberInfo") instanceof Object);
		
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		
		if(memberInfo != null) {
			
			if (memberInfo.getUserVerify() == 128) {
				boardDTO.setBoardLevel(1);
				boardService.boardWrite(boardDTO);
				
			} else {
				boardDTO.setBoardLevel(0);
				boardService.boardWrite(boardDTO);
				
			}
			
		} else {
			boardDTO.setBoardLevel(-1);
			boardService.boardWrite(boardDTO);
			
		}
	
		return "redirect:/board/member/memberBoardList";
	}

	// 게시글 삭제하기
	@RequestMapping(value = "/board/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("bno") int bno) throws Exception {

		logger.info("회원 게시글 삭제 memberBoardDelete - BoardController");

		boardService.boardDelete(bno);

		return "redirect:/board/main";
	}

	// 게시글 조회하기 + 댓글도 가져오기
	@RequestMapping(value = "/board/boardView", method = RequestMethod.GET)
	public void boardView(@RequestParam("bno") int bno, Model model, BoardDTO boardDTO) throws Exception {

		logger.info("회원 게시글 조회 boardView - BoardController");

		boardDTO = boardService.boardView(bno);

		// 댓글 가져오기
		List<BoardReplyDTO> boardReplyDTO = replyService.replyList(bno);
		logger.info("댓글 가져오기 boardView 에서 동시조회 후 계층형으로 - BoardController");

		model.addAttribute("boardDTO", boardDTO);

		model.addAttribute("replyDTO", boardReplyDTO);
	}

	// 게시글 수정하기 (의 개념으로 수정페이지 들어가기)
	@RequestMapping(value = "/board/boardModifyPage", method = RequestMethod.GET)
	public void connectBoardModify(@RequestParam("bno") int bno, Model model, BoardDTO boardDTO) throws Exception {

		logger.info("게시글 수정 페이지 접속 connectBoardModify - controller");

		boardDTO = boardService.boardView(bno);

		model.addAttribute("boardDTO", boardDTO);
	}

	// 게시글 수정하기 로직
	@RequestMapping(value = "/board/boardModify", method = RequestMethod.POST)
	public String boardModify(BoardDTO boardDTO) throws Exception {

		logger.info("게시글 수정 로직 실행 boardModify - controller");

		boardService.boardModify(boardDTO);

		return "redirect:/board/boardView?bno=" + boardDTO.getBno();
	}

}
