package com.project.board.service;
 
import com.project.board.domain.BoardDTO;

public interface BoardService {
	
	// 운영진 게시글 등록하기
	public void boardWriteOp(BoardDTO boardDTO) throws Exception;
	
	// 이용자 게시글 등록하기
	public void boardWrite(BoardDTO boardDTO) throws Exception;
	
	// 공지 게시글 삭제하기
	public void boardDeleteOp(int bno) throws Exception;
	
	// 이용자 게시글 삭제하기
	public void boardDelete(int bno) throws Exception;
	
	// 공지 게시글 상세 조회하기
	public BoardDTO boardDetailOp(int bno) throws Exception;
	
	//이용자 게시글 상세 조회하기
	public BoardDTO boardDetail(int bno) throws Exception;
}
