package com.project.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.member.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "mappers.memberMapper";
	
	@Override
	public void signUpMember(MemberDTO memberDTO) throws Exception {
		logger.info("회원가입 실행 signUpMember - (DAO)");
		
		sqlSession.insert(NAME_SPACE + ".signUpMember", memberDTO);
	}
	
}
