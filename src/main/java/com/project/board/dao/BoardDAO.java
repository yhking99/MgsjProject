package com.project.board.dao;

import com.project.board.domain.BoardDTO;

public interface BoardDAO {

	
	//운영진 게시글 등록하기
	public void boardWriteOp(BoardDTO boardDTO) throws Exception;
	
	
	//이용자 게시글 등록하기
	public void boardWrite(BoardDTO boardDTO) throws Exception;
	
}
