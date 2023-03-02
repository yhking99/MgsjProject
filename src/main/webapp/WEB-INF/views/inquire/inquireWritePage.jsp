<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 정상적으로 로그인이 되었는지 확인할수있는 파라미터값 = result -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성 페이지(간이)</title>
</head>
<body>
<div class = "container" align = "center">
		<form class = "form-horizontal" action = "/inquire/inquireWrite" method ="post">
			<!-- form-action은 타이틀 밑의 js파일에서 구현 예정 -->
			<div class = "form-group">
				<div class = "col-sm-12">
					<h2 align = "center">제품 문의하기</h2>
				</div>
			</div>
			<!-- <div class = "form-group">
				<label class = "col-sm-2 control-label">제품 문의번호</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" name = "askNum" />
				</div>
			</div> -->
			<div class = "form-group">
				<label class = "col-sm-2 control-label">제품 번호</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" name = "pno" value = "${productNumber}" readonly="readonly"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">문의 제목</label>
				<div class = "col-sm-6">
					<input type = "text" class = "form-control"name = "askTitle" maxlength = "20" placeholder = "제품 이름 입력"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">문의 내용</label>
				<div class = "col-sm-8">
					<textarea class = "form-control" id = "content" name = "askContent" rows = "10" cols = "160" placeholder = "제품 설명 입력"></textarea>
				</div>
			</div>
			<div class = "form-group">
				<div class = "col-sm-offset-4 left">
					<button type = "reset" class = "btn btn-warning">다시 입력</button>
					<button type = "submit" class = "btn btn-primary">문의 등록</button>
					<button type = "button" class = "btn btn-danger" onClick = "location.href = '/product/productView?pno=${productNumber}'">문의 목록 이동</button>
				</div>
			</div>
		</form>
	</div>


</body>
</html>