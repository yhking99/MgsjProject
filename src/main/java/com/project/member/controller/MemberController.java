package com.project.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.member.domain.MemberDTO;
import com.project.member.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 회원가입 접속 페이지
	@RequestMapping(value = "/member/membersignuppage", method=RequestMethod.GET)
	public String signUpMemberPage() throws Exception{
		
		logger.info("회원가입 페이지 접속 joinMember - (controller)");
		
		return "/member/membersignuppage";
	}
	
	// 회원가입 로직
	@RequestMapping(value ="/member/memberSignUp", method=RequestMethod.POST)
	public String signUpMember(MemberDTO memberDTO) throws Exception{
		
		logger.info("회원가입 실행 signUpMember - (controller)");
		
		memberService.signUpMember(memberDTO);
		
		return "redirect:/member/memberLoginPage";
	}
	
	// 로그인 페이지 접속
	@RequestMapping(value = "/member/memberLoginPage", method = RequestMethod.GET)
	public String memberLoginPage() throws Exception {
		
		return "/member/memberLoginPage";
	}
	
}
