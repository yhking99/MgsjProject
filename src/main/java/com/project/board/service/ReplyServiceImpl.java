package com.project.board.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.board.dao.ReplyDAO;
import com.project.board.domain.BoardReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyServiceImpl.class);
	
	@Autowired
	private ReplyDAO replyDAO;
	
	// 댓글 가져오기
	@Override
	public List<BoardReplyDTO> replyList(int bno) throws Exception {
		
		logger.info("댓글 가져오기 시작 replyList - Service");
		
		return replyDAO.replyList(bno);
	}
}
