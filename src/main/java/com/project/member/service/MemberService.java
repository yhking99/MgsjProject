package com.project.member.service;

import com.project.member.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입 로직
	public void signUpMember(MemberDTO memberDTO) throws Exception;
}
