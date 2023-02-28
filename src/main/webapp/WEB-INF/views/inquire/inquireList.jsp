<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
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
<title>제품 목록(간이)</title>
</head>
<body>
	<div align="center">
		<h1>n번 상품 문의</h1>
		<table border="1">
			<thead>
				<tr class="warning">
					<th class="col-sm-2 text-center ask-num">제품문의번호</th>
					<th class="col-sm-2 text-center pno">제품번호</th>
					<th class="col-sm-2 text-center ask-title">문의제목</th>
					<th class="col-sm-2 text-center ask-reg-date">문의날짜</th>
					<th>관리버튼</th>
				</tr>
			</thead>
			<tbody>
				<!-- 
				!!! 여기는 데이터베이스 테이블명이 askdto !!!!
				askNum int AI PK 
				pno int 
				askTitle varchar(50) 
				askContent text 
				askRegDate datetime
			-->
				<c:forEach var = "inquireList" items = "${inquireList}">
				<tr>
					<td align = "center">${inquireList.askNum}</td>
					<td align = "center">${inquireList.pno}</td>
					<td align = "center" title = "${inquireList.askContent}"><a href = "${contextPath}/inquire/inquireView?askNum=${inquireList.askNum}">${inquireList.askTitle}</a></td>
					<td><fmt:formatDate value = "${inquireList.askRegDate}" pattern = "yyyy-MM-dd"/></td>
					<td align="center"><a class="btn btn-sm btn-warning" href="javascript:deleteInquireList(${inquireList.askNum})">삭제</a>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="button" onclick="location.href = '/inquire/inquireWritePage'">제품문의하기</button>
		</div>

	</div>
	<script type="text/javascript">
		function deleteInquireList(askNum) {
			let deleteYN = confirm("삭제할까요?");

			if (deleteYN == true) {
				alert("내역이삭제되었습니다");
				location.href = "/inquire/inquireDelete?askNum=" + askNum;
			} else {
				alert("삭제가 취소되었습니다");
			}
		}
	</script>
</body>
</html>
	