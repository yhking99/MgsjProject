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

button {
	height: 30px;
	border-radius: 6px;
	margin-top : 5px;
	border: none;
	width: 150px;
	color: white;
	background-color: #297eff;
	font-size: 16px;
}

button:hover {
	background-color: #2980b9;
}

.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.delete-modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.modal-content {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	max-width: 500px;
	height: 250px;
	row-gap: 15px;
	padding: 50px 100px;
	border: 1px solid lightgray;
	border-radius: 7px;
	background-color: #cfdcf0;
	box-shadow: 3px 5px 20px rgb(0 0 0/ 30%);
	row-gap: 15px;
}

.modal-reply-content {
	width: 300px;
	height: 100px;
}
</style>
</head>
<body>

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
					<tr id="replyDTO">
						<td id="rno" style="display: none;">${reply.rno }</td>
						<td id="replyWriter">${reply.writer }</td>
						<td id="replyContent">${reply.content }</td>
						<td>
							<fmt:formatDate value="${reply.regDate }" pattern="yyyy-MM-dd" />
						</td>
						<td>
							<font size="2">
								<button class="reply-modify" type="button" onclick="modalOpen()">[수정]</button>
							</font>
							<br>
							<font size="2">
								<button class="reply-modify" type="button" onclick="replyDelete('${boardDTO.bno }','${reply.rno }')">[삭제]</button>
							</font>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- 수정 모달창 -->
	<div class="modal">
		<h3>댓글 수정</h3>
		<div class="modal-content">
			<input class="modal-reply-rno" type="hidden">
			<div>
				<label>작성자 : </label>
				<input class="modal-reply-writer" type="text" readonly="readonly" />
			</div>
			<div>
				<div>내용</div>
				<textarea class="modal-reply-content" name="modal-reply-content"></textarea>
			</div>
			<div>
				<label>비밀번호 : </label>
				<input type="password" class="modal-reply-Pwd" />
			</div>
			<button type="submit" onclick="replyModify('${boardDTO.bno }')">댓글수정</button>
			<button class="reply-modal-close" type="submit" onclick="modalClose()">창닫기</button>
		</div>
	</div>
	<!-- 수정 모달창 끝 -->

	<!-- 댓글 삭제 모달창 -->
	<div class="delete-modal">
		<h3>댓글 삭제</h3>
		<div class="modal-content">
			<label>비밀번호 : </label>
			<input type="password" name="replyModalDeletePwd">
		</div>
	</div>
	<!-- 댓글 삭제 모달창 끝 -->

	<hr>

	<button onclick="replyAreaOn()">댓글작성하기</button>
	&emsp;
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
						<input type="text" class="reply-writer" name="writer" value="${memberInfo.userId }" readonly="readonly" />
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
				<input type="password" class="reply-Pwd" name="replyPwd" placeholder="비밀번호를 입력해주세요">
			</div>
		</div>
		<br>
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
		
		if (replyPwd.length != 6) {
			alert("비밀번호는 6자리의 숫자로 입력해주세요.");
			document.querySelector(".reply-Pwd").focus();
			
			return false;
		}
		
		console.log(writer);
		console.log(content);
		
		$.ajax({
			url : "/reply/replyWrite",
			type : "post",
			data : {
				bno : bno,
				writer : writer,
				content : content,
				replyPwd : replyPwd
			},
			
			success : function(data) {
				alert("댓글 등록이 완료되었습니다.");
				
				location.reload(true);
				
			},
			error : function(error) {
				alert("알 수 없는 오류로 인해 실패하였습니다.\n잠시 후 다시 시도해주세요.");
				console.log(error);
			}
		})
	}
	
	/* 댓글 수정 모달창 여닫기*/
	const modal = document.querySelector('.modal');
	function modalOpen() {

		let openButton = document.querySelector('.reply-modify');
		
		openButton.addEventListener('click', () => {
		  modal.style.display = 'flex';
		});
	
	}
	
	/* 댓글 수정 모달창 닫기 */
	function modalClose() {
		
		let closeButton = document.querySelector('.reply-modal-close');
		let modalReplyPwd = document.querySelector('.modal-reply-Pwd');
		
		closeButton.addEventListener('click', () => {
		  modalReplyPwd.value = "";
		  modal.style.display = 'none';
		});
	}
	
	/* 수정버튼 클릭하면 modal창에 내용 주입 */
	$("#replyDTO").on("click", ".reply-modify", function() {

		// 모달창에 보내주기 전, 데이터를 따내야한다.
		let replyDTO = $(this).closest("#replyDTO");

		let rno = replyDTO.find("#rno").text();

		let writer = replyDTO.find("#replyWriter").text();

		let content = replyDTO.find("#replyContent").text();

		// 모달창에 댓글번호, 내용, 작성자를 보내주어야 한다.
		$(".modal-reply-rno").val(rno);
		$(".modal-reply-writer").val(writer);
		$(".modal-reply-content").val(content);

		modalOpen();
	})
	
	/* 댓글 수정 */
	function replyModify(bno) {

		let replyModifyYN = confirm("댓글을 수정하시겠습니까?");
		
		if (replyModifyYN == true) {
			
			let rno = document.querySelector(".modal-reply-rno").value;
			let replyModifyContent = document.querySelector(".modal-reply-content").value;
			let replyModifyPwd = document.querySelector(".modal-reply-Pwd").value;
			
			if (replyModifyPwd.length != 6) {
				
				alert("비밀번호는 6자리의 숫자만 입력 가능합니다");
				
				return false;
			}
			
			$.ajax({
				
				url : "/reply/replyModify",
				type : "post",
				data : {
					"bno" : bno,
					"rno" : rno,
					"replyPwd" : replyModifyPwd,
					"content" : replyModifyContent
				},
				dataType : "json",
				
				/* 위는 서버에 갔다오는 값, 아래는 서버에서 가져온 값 */
				
				success : function(replyObject) {
					
					if (replyObject == true) {
						alert("비밀번호가 일치합니다.\n댓글 수정이 완료되었습니다.");
						location.reload(true);
						
					} else {
						alert("비밀번호가 일치하지 않습니다.")
					}
					
					console.log(replyObject);
				},
				error : function(error) {
					alert("알 수 없는 이유로 수정하지 못했습니다.\n잠시 후에 다시 시도해주세요.");
					console.log(error);
					
				}
				
			})
		} else {
			alert("삭제가 취소되었습니다");
		}
	}

	/* 댓글 삭제 */
	function replyDelete(bno, rno) {

		let replyDeleteYN = confirm("정말 댓글을 삭제하시겠습니까?\n삭제된 데이터는 복구되지 않습니다.");
		
		if (replyDeleteYN == true) {
			
			let replyPwdPrompt = prompt("비밀번호를 입력해주세요");
			
			if (replyPwdPrompt.length == 0 || replyPwdPrompt.length > 6) {
				
				alert("비밀번호는 6자리의 숫자만 입력 가능합니다");
				return false;
				
			}
			
			$.ajax({
				
				url : "/reply/replyDelete",
				type : "post",
				data : {
					"bno" : bno,
					"rno" : rno,
					"replyPwd" : replyPwdPrompt
				},
				dataType : "json",
				
				/* 위는 서버에 갔다오는 값, 아래는 서버에서 가져온 값 */
				
				success : function(replyObject) {
					
					if (replyObject == true) {
						alert("비밀번호가 일치합니다.\n댓글 삭제가 완료되었습니다");
						location.reload(true);
						
					} else {
						alert("비밀번호가 일치하지 않습니다.")
					}
					
					console.log(replyObject);
				},
				error : function(error) {
					alert("알 수 없는 이유로 삭제하지 못했습니다.\n잠시 후에 다시 시도해주세요.");
					console.log(error);
					
				}
				
			})
		} else {
			alert("삭제가 취소되었습니다");
		}
	}
</script>
</html>