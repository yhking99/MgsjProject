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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>주문 조회</title>
</head>
<body>
<div class="container" align="center">
		<form class="form-horizontal" id="frm">
			<div class="form-group">
				<div>
					<h2 align="center">주문 조회</h2>
				</div>
			</div>
			<!--
				orderDTO
				private int orderNum;
				private String userId;
				private Date orderDate;
				private String postAddress;
				private String detailAddress;
				private String detailAddress2;
				private String recipient;
				private String recipientPhone;
			 -->
			<div class="form-group">
				<label for="bno" class="col-sm-2 control-label">주문 번호</label>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="orderNum" maxlength="200" value="${orderDTO.orderNum}" readOnly />
				</div>
			</div>
			<div class="form-group">
				<label for="subject" class="col-sm-2 control-label">회원아이디</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="userId" maxlength="200" value="${orderDTO.userId}" readOnly>
				</div>
			</div>
			<div class="form-group">
				<label for="reg_date" class="col-sm-2 control-label">주문 날짜</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="orderDate" maxlength="200" value="<fmt:formatDate value = '${orderDTO.orderDate}' pattern = 'yyyy-MM-dd'/>" readonly />
				</div>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">우편번호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="postAddress" maxlength="200" value="${orderDTO.postAddress}" readOnly />
				</div>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">상세주소1</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="detailAddress" maxlength="200" value="${orderDTO.detailAddress}" readOnly />
				</div>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">상세주소2</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="detailAddress2" maxlength="200" value="${orderDTO.detailAddress2}" readOnly />
				</div>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">수령인</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="recipient" maxlength="200" value="${orderDTO.recipient}" readOnly />
				</div>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">수령인 전화번호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="recipientPhone" maxlength="200" value="${orderDTO.recipientPhone}" readOnly />
				</div>
			</div>
			<div class = "form-group">
				<button type="button" class="btn btn-primary" onclick = "location.href = '${contextPath}/order/orderList'">
				<span class="glyphicon glyphicon-list-alt">주문 조회 목록 이동</span></button>
				<button type="button" class="btn btn-primary" onclick = "deleteOrder('${orderDTO.orderNum}')">
				<span class="glyphicon glyphicon-list-alt">주문 취소</span></button>
				
			</div>
	</form>
</div>
<script>
	function deleteOrder(orderNum) {
		var deleteYN = confirm("주문을 취소할까요?");
		
		if(deleteYN == true) {
			$.ajax({
				url : '/order/orderDelete',
				type : 'POST',
				data : {
					orderNum : orderNum
				},
				success : function(data) {
					alert("주문이 취소되었습니다.");
					location.href = '/order/orderList'
				},
				
				error : function(error) {
					alert("알 수 없는 오류 발생하였습니다.\n 잠시 후에 다시 시도해주세요.");
				}
				
			});
		} else {
			alert("주문 취소가 취소되었습니다.");
		}
	}


</script>

</body>
</html>