<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 액션(코어)태그 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- EL태그로 쓸것을 미리 만들어놓는 좋은 습관 기억하자 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록(간이)</title>
</head>
<body>

	<div align = "center">
		<table border = "1">
			<thead>
				<tr class = "warning">
					<th class = "col-sm-1  text-center">번  호</th>
					<th class = "col-sm-4  text-center">제  목</th>
					<th class = "col-sm-1  text-center">작성자</th>
					<th class = "col-sm-3  text-center">작성일자</th>
					<th class = "col-sm-1  text-center">조회수</th>				
				</tr>
			</thead>
			<tbody>
			<!-- 
				bno int userId varchar(20) 
				writer varchar(20) 
				title varchar(50) 
				content text 
				regDate datetime
				readCount int
			-->
				<c:forEach var = "boardList" items = "${boardList}">
				<tr>
					<td align = "center">${boardList.bno}</td>
					<td align = "center" title = "${boardList.content}">${boardList.title}</td>
					<!-- <td class = "hidden">${notice.content}</td>-->
					<td align = "center">${boardList.writer}</td>
					<td><fmt:formatDate value = "${boardList.regDate}" pattern = "yyyy-mm-dd"/></td>
					<td align = "center">${boardList.readCount}</td>
					<!-- 나중 사용을 위해서 이미지 이름과 경로 히든 처리 -->
				</tr>
				</c:forEach>
			</tbody>
		</table>
	
	</div>

</body>
</html>