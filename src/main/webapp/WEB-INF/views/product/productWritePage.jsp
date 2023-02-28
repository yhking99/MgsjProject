<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록(간이)</title>
</head>
<body>
	<div class = "container" align = "center">
		<form class = "form-horizontal" action = "/product/productWrite" method ="post">
			<!-- form-action은 타이틀 밑의 js파일에서 구현 예정 -->
			<div class = "form-group">
				<div class = "col-sm-12">
					<h2 align = "center">상품 등록하기</h2>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">제품 번호</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" name = "pno"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">카테고리 번호</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" name = "cno"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">제품이름</label>
				<div class = "col-sm-6">
					<input type = "text" class = "form-control"name = "productName" maxlength = "20" placeholder = "제품 이름 입력"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">제품 가격</label>
				<div class = "col-sm-4">
					<input type = "number" class = "form-control" name = "productPrice" maxlength = "20" placeholder = "제품 가격 입력"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">제품 재고</label>
				<div class = "col-sm-3">
					<input type = "number" class = "form-control" name = "productStock" maxlength = "10" placeholder = "제품 재고 입력"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">제품 설명</label>
				<div class = "col-sm-8">
					<textarea class = "form-control" id = "content" name = "productDescription" rows = "10" cols = "160" placeholder = "제품 설명 입력"></textarea>
				</div>
			</div>
			<div class = "form-group">
				<div class = "col-sm-offset-4 left">
					<button type = "reset" class = "btn btn-warning">다시 입력</button>
					<button type = "submit" class = "btn btn-primary">게시글 등록</button>
					<button type = "button" class = "btn btn-danger" onClick = "location.href = '/product/productList'">상품 목록 이동</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>