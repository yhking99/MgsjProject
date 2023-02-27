package com.project.board.service;

import java.util.List;

import com.project.board.domain.BoardReplyDTO;

public interface ReplyService {
	
	// 댓글 가져오기
	public List<BoardReplyDTO> replyList(int bno) throws Exception;
}
