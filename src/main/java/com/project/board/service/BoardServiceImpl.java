package com.project.board.service;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.board.dao.BoardDAO;
import com.project.board.domain.BoardDTO;

public class BoardServiceImpl implements BoardService {
 
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardDAO boardDAO;
	
	// 운영진 게시글 등록하기
	@Override
	public void boardWriteOp(BoardDTO boardDTO) throws Exception {
			
		logger.info("BoardService에서 운영진 게시글 등록하기 시작");
			
		boardDAO.boardWriteOp(boardDTO);
	}
	
	// 이용자 게시글 등록하기
	@Override
	public void boardWrite(BoardDTO boardDTO) throws Exception {
		
		logger.info("BoardService에서 이용자 게시글 등록하기 시작");
		
		boardDAO.boardWrite(boardDTO);
	}
	
}




