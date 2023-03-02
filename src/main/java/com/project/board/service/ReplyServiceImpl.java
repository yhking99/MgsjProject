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
	
	// 댓글 작성하기
	@Override
	public void replyWrite(BoardReplyDTO boardReplyDTO) throws Exception {
		
		logger.info("댓글 작성(ajax) 시작 replyWrite - Service : {}", boardReplyDTO);
		
		replyDAO.replyWrite(boardReplyDTO);
	}
	
	// 댓글 수정하기
	@Override
	public void replyModify(BoardReplyDTO boardReplyDTO) throws Exception {
		
		logger.info("댓글 수정(ajax) 시작 replyModify - Service: {}", boardReplyDTO);
		
		replyDAO.replyModify(boardReplyDTO);
	}
	
	// 댓글 삭제하기
	@Override
	public void replyDelete(BoardReplyDTO boardReplyDTO) throws Exception {
		
		logger.info("댓글 삭제(ajax) 시작 replyDelete - Service: {}", boardReplyDTO);
		
		replyDAO.replyDelete(boardReplyDTO);
	}
}
