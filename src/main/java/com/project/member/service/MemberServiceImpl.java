package com.project.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.member.dao.MemberDAO;
import com.project.member.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private MemberDAO memberDAO;
	
	// 회원가입 로직 service
	@Override
	public void signUpMember(MemberDTO memberDTO) throws Exception {
		
		logger.info("회원가입 실행 signUpMember - (Service)");
		
		memberDAO.signUpMember(memberDTO);
	}
	
	// 로그인 로직 service
	@Override
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		logger.info("로그인 실행 memberLogin - (service)");
		
		return memberDAO.memberLogin(memberDTO);
	}
}
