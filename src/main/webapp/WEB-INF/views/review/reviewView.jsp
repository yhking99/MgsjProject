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
<title>리뷰 조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class = "container" align = "center">
		<form class = "form-horizontal" id = "frm">
			<div class = "form-group">
				<div>
					<h2 align = "center">리뷰 조회</h2>
				</div>
			</div>
			<div class = "form-group">
				<label for = "bno" class = "col-sm-2 control-label">리뷰 번호</label>
				<div class = "col-sm-1">
					<input type = "text" class = "form-control" id = "rvno" name = "rvno"
					maxlength = "200" value = "${reviewBoardDTO.rvno}" readOnly/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "subject" class = "col-sm-2 control-label">제품 번호</label>
				<div class = "col-sm-10">
					<input type = "text" class = "form-control" id = "pno" name = "pno"
					maxlength = "200" value = "${reviewBoardDTO.pno}" readOnly>
				</div>
			</div>
			<div class = "form-group">
				<label for = "reg_date" class = "col-sm-2 control-label">리뷰 작성일</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" id = "rvRegDate" name = "rvRegDate"
					maxlength = "200" value = "<fmt:formatDate value = '${reviewBoardDTO.rvRegDate}' pattern = 'yyyy-MM-dd'/>" readonly/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "writer" class = "col-sm-2 control-label">리뷰 작성자</label>
				<div class = "col-sm-2">
					<input type = "text" class = "form-control" id = "rvWriter" name = "rvWriter"
					maxlength = "200" value = "${reviewBoardDTO.rvWriter}" readOnly/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "imageName" class = "col-sm-2 control-label">리뷰 제목</label>
				<div class = "col-sm-2">
					<input type = "text" class = "form-control" id = "rvTitle" name = "rvTitle" maxlength = "200" value = "${reviewBoardDTO.rvTitle}" readOnly>
				</div>
			</div>
			<div class = "form-group">
			<label for = "content" class = "col-sm-2 control-label">내  용</label>
				<div class = "col-sm-10">
					<textarea rows = "10" cols = "160" class = "form-control" id = "rvContent" name = "rvContent" readOnly>${reviewBoardDTO.rvContent}</textarea>
				</div>
			</div>
			
			<div class = "form-group">
				<p align = "center">
					<button type = "button" class = "btn btn-primary" onclick = "location.href = '${contextPath}/product/productView?pno=${reviewBoardDTO.pno}'">
					<span class = "glyphicon glyphicon-list-alt">게시글 목록 이동</span></button>
					<button type = "button" class = "btn btn-warning" onclick = "fn_boardUpdateFrom(${noticeDetail.bno})">
					<span class = "glyphicon glyphicon-pencil">게시글 수정</span></button>
					<button type = "button" class = "btn btn-danger" onclick = "deleteReviewList('${reviewBoardDTO.rvno}', '${reviewBoardDTO.pno}')">
					<span class = "glyphicon glyphicon-erase">게시글 삭제</span></button>
			</div>
		</form>
	</div>
<script type="text/javascript">
	function deleteReviewList(rvno, pno) {
	
		let deleteYN = confirm("삭제할까요?");
	
	if(deleteYN == true) {
		
		$.ajax({
			url : '/review/reviewDelete',
			type : 'GET',
			data : {
				rvno : rvno
			},
			success : function(data) {
				alert("삭제되었습니다.");
				location.href = '/product/productView?pno=' + pno;
			},
			error : function(error) {
				alert('알 수 없는 오류 발생하였습니다.\n잠시 후에 다시 시도해주세요.');
			}	
		});
	} else {
		alert("삭제가 취소되었습니다.");
	}
}
</script>
</body>
</html>