<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지(간이)</title>
</head>
<body>
<div class = "container" align = "center">
		<form class = "form-horizontal" action = "/review/reviewWrite" method ="post">
			<!-- form-action은 타이틀 밑의 js파일에서 구현 예정 -->
			<div class = "form-group">
				<div class = "col-sm-12">
					<h2 align = "center">리뷰 작성하기</h2>
				</div>
			</div>
			<!-- <div class = "form-group">
				<label class = "col-sm-2 control-label">리뷰 번호</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" name = "rvno"/>
				</div>
			</div> -->
			<div class = "form-group">
				<label class = "col-sm-2 control-label">제품번호(관리자만 보면됨)</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" name = "pno" value="${productNumber }" readonly="readonly"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">리뷰 제목</label>
				<div class = "col-sm-6">
					<input type = "text" class = "form-control"name = "rvTitle" maxlength = "20" placeholder = "리뷰 제목 입력"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">리뷰 작성자</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" name = "rvWriter" maxlength = "20" placeholder = "리뷰 작성자 입력"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">리뷰 내용</label>
				<div class = "col-sm-8">
					<textarea class = "form-control" id = "content" name = "rvContent" rows = "10" cols = "160" placeholder = "리뷰 내용 입력"></textarea>
				</div>
			</div>
			<div class = "form-group">
				<div class = "col-sm-offset-4 left">
					<button type = "reset" class = "btn btn-warning">다시 입력</button>
					<button type = "submit" class = "btn btn-primary">게시글 등록</button>
					<button type = "button" class = "btn btn-danger" onClick = "/product/productView?pno='${productNumber}'">이전 페이지 이동</button>
				</div>
			</div>
		</form>
	</div>
<script>
	
</script>
</body>
</html>