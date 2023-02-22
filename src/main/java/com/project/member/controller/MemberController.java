package com.project.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.member.domain.MemberDTO;
import com.project.member.service.MemberService;

/**
 * 
 * @author 김재국
 *
 */

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	// ********************************테스트 메인페이지 (리다이렉트용 추후 삭제예정)
	@RequestMapping(value = "/board/boardMain", method = RequestMethod.GET)
	public void connectBoardMain() throws Exception {
		logger.info("축하합니다 원하는 작업이 성공적으로 동작했군요!!");
	}

	// 회원가입 접속 페이지
	@RequestMapping(value = "/member/memberSignUp", method = RequestMethod.GET)
	public void signUpMemberPage() throws Exception {

		logger.info("회원가입 페이지 접속 joinMember - (controller)");
	}

	// 회원가입 로직
	@RequestMapping(value = "/member/memberSignUp", method = RequestMethod.POST)
	public String signUpMember(MemberDTO memberDTO) throws Exception {

		logger.info("회원가입 실행 signUpMember - (controller)");
		
		memberService.signUpMember(memberDTO);
		
		logger.info("회원가입 정보 : {}", memberDTO);

		return "redirect:/member/memberLoginPage";
	}

	// 로그인 페이지 접속
	@RequestMapping(value = "/member/memberLoginPage", method = RequestMethod.GET)
	public void memberLoginPage() throws Exception {
		
		logger.info("로그인 페이지 접속 memberLoginPage - (controller)");
	}
	
	// 로그인 기능 구현
	@RequestMapping(value = "/member/memberLogin", method = RequestMethod.POST)
	public String memberLogin(MemberDTO memberDTO, HttpServletRequest req) throws Exception {
		
		logger.info("로그인 진행 memberLoginPage - (controller)");
		
		MemberDTO memberInfo = memberService.memberLogin(memberDTO);
		
		HttpSession session = req.getSession();
		
		if (memberInfo == null) {
			logger.info("로그인 실패");
			
		} else {
			session.setAttribute("memberLogon", memberInfo);
			
			if (memberInfo.getUserVerify() == 128) {
				logger.info("관리자 로그인 : {}", session.getAttribute("memberLogon"));
			} else {
				logger.info("일반유저 로그인 : {}", session.getAttribute("memberLogon"));
			}
			
		}
		
		return "redirect:/board/boardMain";
	}
	
	// 로그아웃 기능 구현
	@RequestMapping(value = "/member/memberLogout", method = RequestMethod.GET)
	public String memberLogout(HttpSession session) throws Exception {
		
		logger.info("유저 로그아웃, 로그아웃 계정 : {}",session.getAttribute("memberLogon").toString());
		
		session.invalidate();
		
		return "redirect:/board/boardMain";
	}
	
	// 회원정보수정 기능 구현
	@RequestMapping(value = "/member/memberModifyPage", method = RequestMethod.GET)
	public String connectMemberModifyPage() throws Exception {
		
		return "";
	}
}
