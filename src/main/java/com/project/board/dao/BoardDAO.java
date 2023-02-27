package com.project.board.dao;

import java.util.List;

import com.project.board.domain.BoardDTO;

public interface BoardDAO {

	// 공지 게시글 목록보기
	public List<BoardDTO> adminBoardList() throws Exception;

	// 일반 게시글 목록보기
	public List<BoardDTO> memberBoardList() throws Exception;

	// 게시글 등록하기
	public void boardWrite(BoardDTO boardDTO) throws Exception;

	// 게시글 삭제하기
	public void boardDelete(int bno) throws Exception;

	// 게시글 조회하기
	public BoardDTO boardView(int bno) throws Exception;
	
	// 게시글 수정하기
	public void boardModify(BoardDTO boardDTO) throws Exception;

}
