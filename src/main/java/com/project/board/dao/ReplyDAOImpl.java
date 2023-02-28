package com.project.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.board.domain.BoardReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOImpl.class);

	private static final String NAME_SPACE = "mappers.boardReplyMapper";
	
	@Autowired(required = false)
	private SqlSession sqlSession;
	
	// 댓글 목록 불러오기
	@Override
	public List<BoardReplyDTO> replyList(int bno) throws Exception {
		
		logger.info("댓글 목록 불러오기 replyList - DAO");
		
		return sqlSession.selectList(NAME_SPACE + ".replyList", bno);
	}
	
	// 댓글 작성하기
	@Override
	public void replyWrite(BoardReplyDTO boardReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	// 댓글 수정하기
	@Override
	public void replyModify(BoardReplyDTO boardReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	// 댓글 작성하기
	@Override
	public void replyDelete(BoardReplyDTO boardReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		
	}
}
