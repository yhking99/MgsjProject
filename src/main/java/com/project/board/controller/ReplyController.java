package com.project.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.board.domain.BoardReplyDTO;
import com.project.board.service.ReplyService;

@Controller
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private ReplyService replyService;

	// 댓글 목록 불러오기 컨트롤러는 boardController에 넣음

	// 댓글 작성하기
	@ResponseBody
	@RequestMapping(value = "/reply/replyWrite", method = RequestMethod.POST)
	public void replyWrite(BoardReplyDTO boardReplyDTO) throws Exception {

		logger.info("댓글 작성(ajax) replyWrite - controller : {}", boardReplyDTO);

		replyService.replyWrite(boardReplyDTO);

	}

	// 댓글 수정하기
	@ResponseBody
	@RequestMapping(value = "/reply/replyModify", method = RequestMethod.POST)
	public void replyModify(BoardReplyDTO boardReplyDTO) throws Exception {

		logger.info("댓글 수정(ajax)시작 replyModify - controller");

		replyService.replyModify(boardReplyDTO);

	}

	// 댓글 삭제하기
	@ResponseBody
	@RequestMapping(value = "/reply/replyDelete", method = RequestMethod.POST)
	public void replyDelete(BoardReplyDTO boardReplyDTO) throws Exception {
		
		logger.info("댓글 수정(ajax)시작 replyModify - controller");

		replyService.replyDelete(boardReplyDTO);
		
	}

}
