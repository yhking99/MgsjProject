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
<title>Insert title here</title>
</head>
<body>
<body>
	<h1>${productDTO.pno}번상품 제품 상세정보 보기</h1>
	<div align="center">
		<div>대충 상품 이미지</div>
		<div>대충 상품 가격</div>
		<div>대충 상품 남은수량</div>
		<div>대충 상품 색샹</div>
		<div>대충 상품 장바구니로</div>
		<div>대충 상품 선물하기</div>
	</div>
	<div align="center">
		<div style="width: 50%" align="right">
			<button type="button">구매하기</button>
			<button type="button">장바구니에 넣기</button>
		</div>
	</div>
	<br>
	<hr>

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
				<c:forEach var="inquireList" items="${inquireList}">
					<tr>
						<td align="center">${inquireList.askNum}</td>
						<td align="center">${inquireList.pno}</td>
						<td align="center" title="${inquireList.askContent}"><a href="${contextPath}/inquire/inquireView?askNum=${inquireList.askNum}">${inquireList.askTitle}</a></td>
						<td><fmt:formatDate value="${inquireList.askRegDate}" pattern="yyyy-MM-dd" /></td>
						<td align="center"><a class="btn btn-sm btn-warning" href="javascript:deleteInquireList(${inquireList.askNum})">삭제</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="button" onclick="location.href = '/inquire/inquireWritePage'">제품문의하기</button>
		</div>
	</div>
	<div align="center">
		<h1>n번 상품 리뷰</h1>
		<table border="1">
			<thead>
				<tr class="warning">
					<th class="col-sm-1 text-center rvno">리뷰 번호</th>
					<th class="col-sm-1 text-center pno">제품 번호(관리자만 보면 됨)</th>
					<th class="col-sm-1 text-center rv-Title">리뷰 제목</th>
					<th class="col-sm-1 text-center rv-Writer">리뷰 작성자</th>
					<th class="col-sm-1 text-center rv-RegDate">리뷰 작성일</th>
					<th>관리버튼</th>
				</tr>
			</thead>
			<tbody>
				<!-- 
					reviewboarddto 테이블
					rvno	int	NO	PRI
					pno	int	NO	PRI
					rvTitle	varchar(50)	NO	
					rvContent	text	NO	
					rvWriter	varchar(50)	NO	
					rvRegDate	datetime	NO	
			-->
				<c:forEach var = "reviewList" items = "${reviewList}">
				<tr>
					<td align = "center">${reviewList.rvno}</td>
					<td align = "center">${reviewList.pno}</td>
					<td align = "center" title = "${reviewList.rvContent}"><a href = "${contextPath}/review/reviewView?rvno=${reviewList.rvno}">${reviewList.rvTitle}</a></td>
					<td align = "center">${reviewList.rvWriter}</td>
					<td><fmt:formatDate value = "${reviewList.rvRegDate}" pattern = "yyyy-MM-dd"/></td>
					<td align="center"><a class="btn btn-sm btn-warning" href="javascript:deleteReviewList(${reviewList.rvno})">삭제</a>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="button" onclick="location.href = '/review/reviewWritePage?pno=${productDTO.pno}'">리뷰 작성</button>
		</div>
	</div>
	

	

</body>
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
	
	function deleteReviewList(rvno) {
		let deleteYN = confirm("삭제할까요?");

		if (deleteYN == true) {
			alert("삭제되었습니다.");
			location.href = "/review/reviewDelete?rvno=" + rvno;
		} else {
			alert("삭제가 취소되었습니다.");
		}
	}
</script>
</html>