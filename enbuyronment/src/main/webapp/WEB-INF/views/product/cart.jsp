<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="/resources/main/image/x-icon"
	href="/resources/main/img/favicon.ico">
<link rel="stylesheet" href="/resources/product/css/cart_style.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<br>
	<br>
	<br>
	<div class="container" style="display: flex; justify-content: center;">
		<div class="page-wrapper">
			<div class="wrapper">
				<div class="card card-5">
					<div class="card-header">
						<div class="title">
							<span>장바구니</span>
						</div>
						<input type="checkbox"><span>전체
								선택/해제</span>
					</div>
					<div class="card-body">


						<c:forEach var="cart" items="${cartList }" varStatus="status">
							<!-- Product #1 -->
							<div class="item">
								<div>
									<input type="checkbox" value="${cart.prodNo }">
								</div>
								<img
									style="display: block; margin: 0 auto; width: 150px; height: 130px;"
									width="150px;" height="130px" src="../upload/${cart.thumb }">
								<div class="description">
									<span class="productName">${cart.prodName }</span> <span
										class="categoryName">비누</span> <span class="brandName">동구밭</span>
								</div>
								<div class="quantity">
									<button id="minusBtn${status.index }" class="minus-btn"
										type="button" name="button">
										<img src="/resources/product/img/minus.svg" alt="" />
									</button>
									<input type="text" name="name" id="amount${status.index }"
										value="${cart.amount }"> <input type="hidden"
										id="prodNo${status.index }" value="${cart.prodNo }">
									<button id="plusBtn${status.index }" class="plus-btn"
										type="button" name="button">
										<img src="/resources/product/img/plus.svg" alt="" />
									</button>
									<button id="updateAmountBtn${status.index }" type="button"
										name="button">수량 변경</button>
								</div>
								<div id="prodPrice${status.index }">${cart.price }</div>
								<div id="prodTotalPrice${status.index }" class="total-price">상품금액:
									$9999</div>
								<div>
									<button id="delBtn${status.index }"
										class="delete-btn row align-items-center"></button>
								</div>

							</div>
						</c:forEach>
					</div>
					<div class="row">
						<button class="btn col-md-auto">선택상품 삭제</button>
						<button class="btn col-md-auto">전체 삭제</button>
					</div>


					<div id="cartPrice" class="total-price"></div>
					<div class="total-price">배송비 : $9999</div>
					<div class="total-price">총 결제금액 : $9999</div>
					<br> <br> <br>
					<button id="paymentBtn" onclick="location.href='/order'"
						class="cart_btn col-10" style="float: none; margin: 0 auto;">결제하기</button>

					<br> <br> <br>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			var cartLength = "${fn:length(cartList) }";
			var cartPrice = 0;
			var prodPrice = [];
			var prodTotalPrice = [];
			var amount = [];
			var prodNo = [];
			var updateAmountBtn = [];
			var plusBtn = [];
			var minusBtn = [];
			var delBtn = [];

			for (let i = 0; i < cartLength; i++) {
				prodPrice[i] = $('#prodPrice' + i);
				prodTotalPrice[i] = $('#prodTotalPrice' + i);
				amount[i] = $('#amount' + i);
				prodNo[i] = $('#prodNo' + i);
				updateAmountBtn[i] = $('#updateAmountBtn' + i);
				plusBtn[i] = $('#plusBtn' + i);
				minusBtn[i] = $('#minusBtn' + i);
				delBtn[i] = $('#delBtn' + i);

				prodTotalPrice[i].text(prodPrice[i].text() * amount[i].val());

				cartPrice += Number(prodTotalPrice[i].text());

				updateAmountBtn[i].click(function() {
					$.ajax({
						url : '/cart/updateAmount',
						type : 'post',
						dataType : "text",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify({
							'prodNo' : Number(prodNo[i].val()),
							'amount' : amount[i].val()
						}),
						success : function(result) {
							location.replace("/cart/view");
						}
					});
				});

				plusBtn[i].click(function() {
					amount[i].val(Number(amount[i].val()) + 1);
				});

				minusBtn[i].click(function() {
					amount[i].val(Number(amount[i].val()) - 1);
				});

				delBtn[i].click(function() {
					if (confirm('선택하신 상품을 장바구니에서 삭제하시겠습니까?')) {
						$.ajax({
							url : '/cart/delProduct',
							type : 'post',
							dataType : "text",
							contentType : "application/json; charset=utf-8",
							data : JSON.stringify({
								'uid' : "${sessionScope.userId}",
								'prodNo' : Number(prodNo[i].val()),
							}),
							success : function(result) {
								location.replace("/cart/view");
							}
						});
					}
				});
			}

			$('#cartPrice').text('상품금액 : ' + cartPrice + '원');

		});
	</script>

</body>
</html>