package com.project.member.service;

import com.project.member.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입 로직
	public void signUpMember(MemberDTO memberDTO) throws Exception;
	
	// 로그인 로직
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception;
}
