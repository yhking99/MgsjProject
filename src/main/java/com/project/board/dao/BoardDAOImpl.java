package com.project.board.dao;
 
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.board.domain.BoardDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
  
  private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "mappers.boardMapper";
	
	@Override
	public void boardWriteOp(BoardDTO boardDTO) throws Exception {
		
		logger.info("BoardDAOImpl에서 운영진 게시글 등록하기 시작");
		
		sqlSession.insert(Namespace + ".boardWriteOp", boardDTO);
	}
	
	@Override
	public void boardWrite(BoardDTO boardDTO) throws Exception {
		
		logger.info("BoardDAOImpl에서 이용자 게시글 등록하기 시작");
		
		sqlSession.insert(Namespace + ".boardWrite", boardDTO);
	}

}
