package com.project.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.member.domain.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "mappers.memberMapper";
	
	@Override
	public void signUpMember(MemberDTO memberDTO) throws Exception {
		log.info("회원가입 실행 signUpMember - (DAO)");
		
		sqlSession.insert(NAME_SPACE + ".signUpMember", memberDTO);
	}
	
}
