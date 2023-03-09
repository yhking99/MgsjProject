<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/login/styles/login.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/login/script/login.js"></script>
</head>
<body>
	<!-- 
		private String userId;
		private String userPwd;
		private String userName;
		private String userPhoneNumber;
		private String userEmail;
		private Date userJoinDate;
		private String userGender;
		private int userVerify;
	 -->
	<div class="login">
		<h1>
			<a href="/common.html">
				<span class="login-logo">Ezen</span>
			</a>
		</h1>

		<form action="/member/memberLogin" method="post" id="login-form" name="login-form">
			<fieldset>
				
				<ul>
					<li>
						<span class="id-icon">
							<!-- 장식이미지 -->
						</span>
						<span>
							<input type="text" id="userId" name="userId" placeholder="아이디">
						</span>
					</li>
					<li class="error id-error">아이디를 입력해주세요</li>
					<li>

						<span class="pwd-icon">
							<!-- 장식이미지 -->
						</span>
						<span>
							<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호">
						</span>

					</li>
					<li class="error pwd-error">비밀번호를 입력해주세요</li>
				</ul>
				<button type="submit" id="login-btn">로그인</button>
				<div class="btm">
					<!-- <p>
						<label>
							<input type="checkbox" name="login-y" id="login-y">
							<span>자동로그인</span>
						</label>
					</p> -->
					<a href="/id&pwd/find-idpwd.html" class="idpw-search">아이디 / 비밀번호 찾기</a>
				</div>

			</fieldset>
			<!-- 회원가입 버튼은 그냥 링크버튼 폼값과 연관X -->
			<a href="/member/memberSignUp" class="join_link">회원가입</a>
			<!--회원정보 링크로 연결-->
		</form>

	</div>
	<footer> &copy; Ezen project. 대충간지나는 말. </footer>
</body>
</html>