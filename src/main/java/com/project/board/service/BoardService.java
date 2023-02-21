package com.project.board.service;

import com.project.board.domain.BoardDTO;

public interface BoardService {
	
	// 운영진 게시글 등록하기
	public void boardWriteOp(BoardDTO boardDTO) throws Exception;
	
	// 이용자 게시글 등록하기
	public void boardWrite(BoardDTO boardDTO) throws Exception;
	
}
