package com.project.board.dao;

import java.util.List;

import com.project.board.domain.BoardReplyDTO;

public interface ReplyDAO {
	
	// 댓글 가져오기
	public List<BoardReplyDTO> replyList(int bno) throws Exception;

}
