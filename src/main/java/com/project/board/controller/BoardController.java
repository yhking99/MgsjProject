package com.project.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.board.domain.BoardDTO;
import com.project.board.service.BoardServiceImpl;

// 클래스에 리퀘스트 매핑을 달면 검색이 어려워진다. -> 메서드에 자체적으로 달자 /패키지/요청
@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardServiceImpl boardService;
	
	
	// 운영진 게시글 작성폼
	@RequestMapping(value = "/board/boardWriteFormOp", method = RequestMethod.GET)
	public String boardWriteFormOp() throws Exception {
		
		logger.info("BoardController에서 운영진 게시글 쓰기 시작");
		
		
		return "/board/boardWriteFormOp";
	}
	// 이용자 게시글 작성폼
	@RequestMapping(value = "/board/boardWriteForm", method = RequestMethod.GET)
	public String boardWriteForm() throws Exception {
		
		logger.info("BoardController에서 이용자 게시글 쓰기 시작");
		
		
		return "/board/boardWriteForm";
	} 
	
	// 게시글 등록하기 ( 운영진 게시판 )
	@RequestMapping(value = "/board/boardWriteOp", method = RequestMethod.POST)
	public String boardWriteOp(BoardDTO boardDTO) throws Exception {
		
		logger.info("BoardController에서 운영진 게시글 등록하기 시작");
		
		boardService.boardWriteOp(boardDTO);
		
		
		return "redirect:/board/main";
	}
	// 게시글 등록하기 ( 이용자 게시판 )
		@RequestMapping(value = "/board/boardWrite", method = RequestMethod.POST)
		public String boardWrite(BoardDTO boardDTO) throws Exception {
			
			logger.info("BoardController에서 운영진 게시글 등록하기 시작");
			
			boardService.boardWrite(boardDTO);
			
			
			return "redirect:/board/main";
	}
}



































