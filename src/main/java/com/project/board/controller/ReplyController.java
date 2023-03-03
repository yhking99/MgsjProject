package com.project.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public boolean replyModify(BoardReplyDTO boardReplyDTO) throws Exception {

		logger.info("댓글 수정(ajax) 전 외부 정보 replyModify - controller : {}", boardReplyDTO);
		logger.info("db에 저장된 비밀번호 : {}", replyService.getReplyPwd(boardReplyDTO));
		
		int inputReplyPwd = boardReplyDTO.getReplyPwd();
		int savedPwd = replyService.getReplyPwd(boardReplyDTO);
		
		if (inputReplyPwd == savedPwd) {
			
			logger.info("비밀번호가 일치합니다. 댓글 삭제를 시작합니다.");
			
			replyService.replyModify(boardReplyDTO);
			
			return true;
			
		} else {
			
			logger.info("사용자가 입력한 비밀번호가 틀립니다.");
			
			return false;
		}

	}

	// 댓글 삭제하기
	@ResponseBody
	@RequestMapping(value = "/reply/replyDelete", method = RequestMethod.POST)
	public boolean replyDelete(BoardReplyDTO boardReplyDTO , Model model) throws Exception {
		
		logger.info("댓글 삭제(ajax) 전 외부 정보 replyDelete - controller : {}", boardReplyDTO);
		logger.info("db에 저장된 비밀번호 : {}", replyService.getReplyPwd(boardReplyDTO));
		
		int inputReplyPwd = boardReplyDTO.getReplyPwd();
		int savedPwd = replyService.getReplyPwd(boardReplyDTO);
		
		if (inputReplyPwd == savedPwd) {
			
			logger.info("비밀번호가 일치합니다. 댓글 삭제를 시작합니다.");
			
			replyService.replyDelete(boardReplyDTO);
			
			return true;
			
		} else {
			
			logger.info("사용자가 입력한 비밀번호가 틀립니다.");
			
			return false;
		}
		
	}

}
