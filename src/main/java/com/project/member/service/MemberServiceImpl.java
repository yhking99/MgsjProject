package com.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.member.dao.MemberDAO;
import com.project.member.domain.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	// 회원가입 로직 service
	@Override
	public void signUpMember(MemberDTO memberDTO) throws Exception {
		
		log.info("회원가입 실행 signUpMember - (Service)");
		
		memberDAO.signUpMember(memberDTO);
	}
	
}
