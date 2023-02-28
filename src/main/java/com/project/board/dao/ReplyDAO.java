package com.project.board.dao;

import java.util.List;

import com.project.board.domain.BoardReplyDTO;

public interface ReplyDAO {
	
	// 댓글 가져오기
	public List<BoardReplyDTO> replyList(int bno) throws Exception;
	
	// 댓글 작성하기
	public void replyWrite(BoardReplyDTO boardReplyDTO) throws Exception;
	
	// 댓글 수정하기
	public void replyModify(BoardReplyDTO boardReplyDTO) throws Exception;
	
	// 댓글 삭제하기
	public void replyDelete(BoardReplyDTO boardReplyDTO) throws Exception;
}
