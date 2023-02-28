<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>

<style type="text/css">
input {
	border: none;
}

input:hover {
	pointer-events: none;
}

input:focus {
	border: none;
}

input:visited {
	border: none;
}

textarea {
	resize: none;
}
tr {
	padding: 20px;
	border-bottom: 1px solid black;
}
td{
	padding: 10px;
	border-bottom: 1px solid black;
}
</style>

</head>
<body>
	<!-- 
		private int bno;
		private String userId;
		private String writer;
		private String title;
		private String content;
		private Date regDate;
		private int readCount;
	 -->
	<div align="left">
		<c:choose>
			<c:when test="${(memberInfo.userVerify == 128) && (memberInfo != null) }">
				<h1>${boardDTO.bno }번공지게시글</h1>
			</c:when>
			<c:otherwise>
				<h1>${boardDTO.bno }번게시글</h1>
			</c:otherwise>
		</c:choose>
		<div>
			<label>게시글 제목 : </label>
			<input type="text" name="title" value="${boardDTO.title }" readonly="readonly">
		</div>

		<hr>
		<br>

		<div>
			<label>작성자 : </label>
			<input type="text" name="writer" value="${boardDTO.writer }" readonly="readonly">
		</div>

		<hr>
		<br>

		<div>
			<label>내용</label>
		</div>

		<br>

		<textarea rows="5" cols="50" class="boardTextarea" name="content" maxlength="2000" readonly="readonly">${boardDTO.content }</textarea>

		<br>

		<c:choose>
			<c:when test="${(memberInfo.userVerify == 128) && (memberInfo != null) }">
				<a href="/board/boardModifyPage?bno=${boardDTO.bno}">
					<button type="submit">공지글 수정하기</button>
				</a>
			</c:when>
			<c:otherwise>
				<a href="/board/boardModifyPage?bno=${boardDTO.bno}">
					<button type="submit">게시글 수정하기</button>
				</a>
			</c:otherwise>
		</c:choose>
	</div>

	<hr>
	<!-- 
	// 댓글 가져오기
		List<BoardReplyDTO> boardReplyDTO = replyService.replyList(bno);
		logger.info("댓글 가져오기 boardView 에서 동시조회 후 계층형으로 - BoardController");

		model.addAttribute("boardDTO", boardDTO);

		model.addAttribute("replyDTO", boardReplyDTO);
		
		rno, bno, writer, content, regDate
	 -->
	<div align="left">
		<h1>댓글</h1>
		<table>
			<thead>
				<tr>
					<th style="display: none;">댓글번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>댓글 등록일자</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reply" items="${replyDTO }">
					<tr>
						<td style="display: none;">${reply.rno }</td>
						<td>${reply.writer }</td>
						<td>${reply.content }</td>
						<td>
							<fmt:formatDate value="${reply.regDate }" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<a href="#">[수정]</a> <br>
							<a href="#">[삭제]</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>