<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>cart</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/cart/cart.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<div class="wrap">
	<!--공통 헤더 영역-->
	<div id="header">
		<header>
			<div id="gnb">
				<!--상단 로고-->
				<h1>
					<a href="/mainPage/mainPage">MGSJ</a>
				</h1>
				<!--검색창-->
				<div class="search">
					<button type="submit">
						<i class="bi bi-search" style="font-size: 25px;"></i>
					</button>
					<input class="search_box" type="text" />
				</div>
				<!--유틸메뉴-->
				<div class="gnb-utilmenu">
					<c:choose>
						<c:when test="${(memberInfo.userVerify) == 128 && (memberInfo != null) }">
							<!-- 관리자 -->
							<div class="gnb-utilmenu">
								<a href="/member/memberLoginPage" title="관리자 회원 관리 페이지">
									<i class="bi bi-bookmark-star-fill" style="font-size: 30px;"></i>
								</a>
								<a href="/cart.html" title="관리자 상품 관리 페이지">
									<i class="bi bi-box-seam-fill" style="font-size: 30px;"></i>
								</a>
								<a href="#" title="로그 기록 확인 페이지">
									<i class="bi bi-clock-history" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:when>

						<c:when test="${(memberInfo.userVerify) == 0 && (memberInfo != null) }">
							<!-- 회원 -->
							<div class="gnb-utilmenu">
								<a href="/member/memberModifyPage" title="회원정보수정">
									<i class="bi bi-person-fill" style="font-size: 30px;"></i>
								</a>
								<a href="/cart/cartList" title="주문내역">
									<i class="bi bi-cart" style="font-size: 30px;"></i>
								</a>
								<a href="#" title="활동 기록">
									<i class="bi bi-clock-history" style="font-size: 30px;"></i>
								</a>
								<a href="javascript:memberLogout()" title="로그아웃">
									<i class="bi bi-door-open" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:when>
						<c:when test="${(memberInfo.userVerify) == 5 && (memberInfo != null) }">
							<!-- 판매자 -->
							<div class="gnb-utilmenu">
								<a href="/member/memberModifyPage" title="판매자 정보 수정">
									<i class="bi bi-person-fill" style="font-size: 30px;"></i>
								</a>
								<a href="/cart/cartList" title="판매상품내역">
									<i class="bi bi-cart" style="font-size: 30px;"></i>
								</a>
								<a href="#" title="활동 기록">
									<i class="bi bi-clock-history" style="font-size: 30px;"></i>
								</a>
								<a href="javascript:memberLogout()" title="로그아웃">
									<i class="bi bi-door-open" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 비회원 -->
							<div class="gnb-utilmenu">
								<a href="/member/memberLoginPage" title="로그인">
									<i class="bi bi-person-fill" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<!--네비게이션토글-->
			<div class="gnb-navmenu">
				<ul>
					<li class="dropdown">
						<a href="javascript:void(0)" class="dropbtn">
							<i class="bi bi-list"></i>
						</a>
						<div class="dropdown-content">
							<c:forEach var="categoryList" items="${categoryList}">
								<a href="#" id="cateName">${categoryList.categoryName}</a>
							</c:forEach>
						</div>
					</li>
					<li>
						<a href="pickup.html#pickup-01">현재 픽업 가능</a>
					</li>
					<li>
						<a href="pickup.html#pickup-02">1시간 내 픽업 가능</a>
					</li>
					<li>
						<a href="pickup.html#pickup-03">3시간 내 픽업 가능</a>
					</li>
				</ul>
			</div>
		</header>
	</div>


	<!--cart 작업부분 시작-->
	<div class="main">

		<div class="titlearea">
			<p>장바구니</p>
		</div>
		<div class="cartarea">
			<div class="cart_lft">
				<div class="itemcheck">
					<ul class="checkbtn1">
						<li>
							<span class="checkall">
								<input type="checkbox" id="allchk" />
								<label>전체선택</label>
							</span>
						</li>
					</ul>
					<ul class="checkbtn2">
						<li>
							<button type="button" class="delete-btn">
								<span>선택삭제</span>
							</button>
						</li>
					</ul>
				</div>

				<div class="itemview">
					<table>
						<colgroup>
							<col style="width: 70px">
							<col style="width: 140px">
							<col style="width: 210px">
							<col style="width: 140px">
							<col style="width: 140px">
						</colgroup>
						<tbody id="cart-info-all">
							<c:set var="total" value="0" />
							<c:forEach var="cartList" items="${cartList}">
								<tr class="cart-info">
									<td class="itemview_chk">
										<input type="checkbox" id="chkbox" class="pnoCheckBox" value="${cartList.pno}">
									</td>

									<td class="itemview_thum">
										<a href="/product.html">
											<img src="/resources/product/images/product_sample.png">
										</a>
									</td>

									<td class="itemview_info">

										<div>
											<!--  <span>제품번호 : </span><span class="product_num">00000</span><br> -->
											<span class="product_name">
												<a href="${contextPath}/product/productView?pno=${cartList.pno}">${cartList.productName}</a>
											</span>
										</div>

									</td>

									<td class="itemview_price">

										<div>
											<span>${cartList.productPrice}</span>
											<span>원</span>
										</div>

										<div class="product_amount">
											<div class="amount_pm">

												<div class="input-group">
													<button class="btn-decrease">-</button>
													<input type="number" class="input-number" min="1" value="${cartList.totalCnt}" onkeydown="javascript: return event.keyCode == 69 ? false : true">
													<button class="btn-increase">+</button>
												</div>

											</div>
										</div>
									</td>

									<td>
										<div class="del-product">
											<a href="javascript:deleteCartProduct()">상품삭제</a>
										</div>
									</td>

								</tr>
								<c:set var="total" value="${total + (cartList.productPrice * cartList.totalCnt)}" />
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>


			<div class="cart_rgt">
				<div class="cart_price">
					<div class="cart_itemprice">
						<span>주문금액</span>
						<span>
							<c:out value="${total}" />
							원
						</span>
					</div>
					<div class="cart_deliveryprice">
						<span>배송비</span>
						<span>3,000원</span>
					</div>
				</div>
				<hr>
				<div class="cart_sum">
					<span>결제예정금액</span>
					<span>
						<input type="text" name="productTotalPrice" value="${total + 3000}" />
						원
					</span>
				</div>

				<a href="/order/orderPage">
					<button type="button" class="btn_pay">
						<span>주문하기</span>
					</button>
				</a>
			</div>
		</div>
	</div>
</div>
<!--cart 작업부분 끝-->


<!--푸터 영역-->
<footer>
	<div class="company">
		<div class="corporate">
			<span>고객센터</span>
			<i class="bi bi-headset"></i> <i>1234-5678</i>
		</div>
		<div class="corporate-txt">
			<p>대표자 : 이젠3조 | 서울특별시 종로구 | 사업자등록번호 : 000-00-00000</p>
			<br>
			<p>
				<a href="mailto:3teamproject@example.com">3teamproject@example.com</a>
				&nbsp;&nbsp;| FAX : 02-0000-0000
			</p>
			<address>&copy;Copyright 2023. ezen3projectteam. All rights reserved.</address>
		</div>
	</div>

</footer>

<script>
		// 상품 전체선택
		const allchk = document.querySelector("#allchk");
		
		allchk.addEventListener("click", function() {
		  const chk = allchk.checked;
		
		  const pnoCheckBoxes = document.querySelectorAll(".pnoCheckBox");
		  pnoCheckBoxes.forEach(function(pnoCheckBoxes) {
			pnoCheckBoxes.checked = chk;
		  });
		});
		
		// 선택된 상품 삭제 - ajax로 db까지 연동
		const productDeleteButton = document.querySelector(".delete-btn");
		
		// 선택 삭제 버튼을 눌렀을 때
		productDeleteButton.addEventListener("click", function() {
			
		  const mainProductCheckBoxes = document.querySelectorAll(".pnoCheckBox:checked");
		  
		  const productNum = document.getElementById("chkbox").value;
			  
			  let deleteCartProduct = confirm("선택하신 상품을 삭제하시겠습니까?");
			  
			  if(deleteCartProduct == true){
				  
				  const checkProductArr = new Array();
				  const checkboxes = document.querySelectorAll('input[class="pnoCheckBox"]:checked');
				  
				  checkboxes.forEach(function(checkbox) {
					  checkProductArr.push(checkbox.getAttribute("value"));
				  });
				  
				  $.ajax({
					  url : "/cart/cartDelete",
					  type : "post",
					  data : {
						  cartProductNum : checkProductArr
					  },
					  
					  success : function (deleteResult) {
						  
						  if(deleteResult == 1){
							  
						  	mainProductCheckBoxes.forEach(function(eachProductCheckBox) {
								// 체크박스된 태그의 부모노드 (td태그) 선택
							  	const parentTag = eachProductCheckBox.parentNode;
							  	// 그 input태그의 부모노드 (tr태그 전체) 선택
							  	const overParentTag = parentTag.parentNode;
							  	// tr태그 delete
							  	overParentTag.parentNode.removeChild(overParentTag);
							  });
							  
							  alert("장바구니 목록 삭제가 완료되었습니다.");
							  
							  location.reload(true);
							  
						  } else {
							  
							  alert("장바구니 목록 삭제에 실패하였습니다. 로그인 해주십시오.");
						  }
						  
					},
					error : function (error) {
						alert("오류가 발생하였습니다.");
						console.log(error);
					}
					  
				  })
			  } else {
				  alert("장바구니 목록 삭제를 취소하셨습니다.");
			  }
			  
		});

        const groups = document.querySelectorAll('.input-group');

        groups.forEach(group => {
          const input = group.querySelector('.input-number');
          const increaseBtn = group.querySelector('.btn-increase');
          const decreaseBtn = group.querySelector('.btn-decrease');

          increaseBtn.addEventListener('click', () => {
            input.value = parseInt(input.value) + 1;
          });

          decreaseBtn.addEventListener('click', () => {
            input.value = parseInt(input.value) - 1;
          });
        });
        
        
</script>

</body>
</html>