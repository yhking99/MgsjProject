<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>게시글 조회</title>
<style type="text/css">
textarea {
	resize: none;
}
th {
	padding: 15px;
	border-bottom: 1px solid black;
}

td {
	padding: 15px;
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
	<div align="left" class="board-container">
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
	<div align="left" class="reply-container">
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
							<fmt:formatDate value="${reply.regDate }" pattern="yyyy-MM-dd" />
						</td>
						<td>
							<a href="javascript:replyModify('${boardDTO.bno }')">[수정]</a>
							<br>
							<a href="javascript:replyDelete('${boardDTO.bno }')">[삭제]</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<hr>

	<button onclick="replyAreaOn()">댓글작성버튼</button> &emsp;
	<button onclick="replyAreaOff()">댓글작성안하기</button>
	
	<div class="reply-write-space" style="display: none;">
		<div>
			<h2>댓글작성하기</h2>
			<div>
				<c:choose>
					<c:when test="${memberInfo == null }">
						<label>댓글작성자 : </label>
						<input type="text" class="reply-writer" name="writer" placeholder="비회원은 작성자를 반드시 입력해주세요" />
					</c:when>
					<c:otherwise>
						<label>댓글작성자 : </label>
						<input type="text" class="reply-writer" name="writer" value="${memberInfo.userId }" readonly="readonly"/>
					</c:otherwise>
				</c:choose>
			</div>
			<br>
			<div>
				<label>댓글내용</label>
			</div>
			<textarea rows="5" cols="50" class="reply-content" name="content" placeholder="내용을 입력해주세요"></textarea>
			<div>
				<label>비밀번호 : </label>
				<input type="text" class="reply-Pwd" name="replyPwd" placeholder="비밀번호를 입력해주세요">
			</div>
		</div>
		<button type="button" onclick="replyWrite('${boardDTO.bno}')">댓글작성하기</button>
	</div>
</body>
<script type="text/javascript">
	/* 댓글창 띄우기 내리기 */
	function replyAreaOn() {

		console.log("댓글작성버튼클릭함");
		
		let replyArea = document.querySelector(".reply-write-space");
		
		replyArea.style.display = "block";
	}
	
	function replyAreaOff() {

		console.log("댓글작성안하기클릭함");
		
		let replyArea = document.querySelector(".reply-write-space");
		
		replyArea.style.display = "none";
	}
	
	/* 댓글 작성 */
	function replyWrite(bno) {
		
		/* 쿼리셀렉터는 var el = document.querySelector("div.user-panel.main input[name=login]"); 이런식으로도 사용 가능 */
		let writer = document.querySelector(".reply-writer").value;
		let content = document.querySelector(".reply-content").value;
		let replyPwd = document.querySelector(".reply-Pwd").value;
		
		if(writer.length < 2 || writer.length > 12){
			alert("닉네임은 2글자 이상 12글자 이하로 입력해주세요");
			document.querySelector(".reply-writer").focus();
			
			return false;
			
		}
		
		if(content.length == 0 || content.length < 0){
			alert("내용을 반드시 입력해주세요.");
			document.querySelector(".reply-content").focus();
			
			return false;
		}
		
		if (replyPwd.length == 0 || replyPwd.length < 0) {
			alert("비밀번호의 기본값은 0000입니다.\n원치 않으신다면 비밀번호를 입력 후 등록해주세요");
			document.querySelector(".reply-Pwd").focus();
			
		}
		
		console.log(writer);
		console.log(content);
		
		$.ajax({
			url : "/reply/replyWrite",
			type : "post",
			data : {
				bno : bno,
				writer : writer,
				content : content
			},
			
			success : function(data) {
				alert("댓글 등록이 완료되었습니다.");
				location.reload(true);
				
			},
			error : function(error) {
				alert("알 수 없는 오류가 발생하였습니다.\n잠시 후에 다시 시도해주세요.");
				
			}
		})
		
	}
	
	/* 댓글 수정 */
	function replyModify(bno) {

		let replyModifyYN = confirm("댓글 수정을 하시겠습니까?");
		
	}

	/* 댓글 삭제 */
	function replyDelete(bno) {

		let replyDeleteYN = confirm("정말 댓글을 삭제하시겠습니까?\n삭제된 데이터는 복구되지 않습니다.");
		
		if (replyDeleteYN == true) {
			
			$.ajax({
				
				url : "/reply/replyDelete",
				type : "post",
				data : {
					bno : bno
				},
				
				success : function(data) {
					alert("삭제가 완료되었습니다.");
					location.reload(true);
					
				},
				error : function(error) {
					alert("알 수 없는 이유로 삭제하지 못했습니다.\n잠시 후에 다시 시도해주세요.");
					
				}
				
			})
		}
	}
</script>
</html>