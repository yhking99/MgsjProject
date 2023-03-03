package com.project.board.service;

import java.util.List;

import com.project.board.domain.BoardReplyDTO;

public interface ReplyService {
	
	// 댓글 가져오기
	public List<BoardReplyDTO> replyList(int bno) throws Exception;
	
	// 댓글 작성하기
	public void replyWrite(BoardReplyDTO boardReplyDTO) throws Exception;
	
	// 댓글 수정하기
	public void replyModify(BoardReplyDTO boardReplyDTO) throws Exception;
	
	// 댓글 삭제하기
	public void replyDelete(BoardReplyDTO boardReplyDTO) throws Exception;
	
	// 댓글 수정 삭제시 비밀번호 체크
	public int getReplyPwd(BoardReplyDTO boardReplyDTO) throws Exception;
}
