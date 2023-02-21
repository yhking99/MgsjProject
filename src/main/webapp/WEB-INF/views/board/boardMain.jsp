<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.member.domain.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리다이렉트페이지</title>
</head>
<body>
	여기까지오면 일단 당신이 하는 작업은 성공한겁니다!! (따봉)
	<%
	MemberDTO memberLogon = (MemberDTO)session.getAttribute("isMemberLogon");
	if(memberLogon != null){
	%>
	<a href="javascript:memberLogout()">로그아웃하기</a>
	<%
	} else {
	%>
	<p>로그인을 하셔야 로그아웃창이 보여용</p>
	<%
	}
	%>
</body>
<script type="text/javascript">
	function memberLogout() {
		let logoutYN = confirm("로그아웃 하시게용?");
		
		if(logoutYN == true){
			alert("로그아웃이 됫서용");
			location.href = "/board/boardMain";
		} else {
			alert("로그아웃 취소댓서용");
		}
	}
</script>
</html>