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
		<div class="page-wrapper" style="width: 80vw;">
			<div class="wrapper">
				<div>
					<h3>장바구니</h3>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col"><input id="ckAll" type="checkbox"></th>
							<th scope="col">상품 이미지</th>
							<th class="col-md-4" scope="col">상품 정보</th>
							<th scope="col"><div class="row justify-content-center">수량</div></th>
							<th scope="col">금액</th>
							<th scope="col">상품 총 금액</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach var="cart" items="${cartList }" varStatus="status">
							<tr>
								<td class="align-middle"><input class="check-input" type="checkbox"
									value="${cart.prodNo }"></td>
								<td><img
									style="margin: 0 auto; width: 150px; height: 130px;"
									src="../upload/${cart.thumb }"></td>
								<td class="align-middle"><span class="productName">${cart.prodName }</span><br>
									<span class="categoryName">${cart.cateName }</span><br> <span
									class="brandName">${cart.brandName }</span></td>
								<td class="align-middle">
									<div class="row justify-content-center">
										<button id="minusBtn${status.index }" class="minus-btn"
											type="button" name="button">
											<img src="/resources/product/img/minus.svg" alt="" />
										</button>
										<input style="width:20px" type="text" name="name"
											id="amount${status.index }" value="${cart.amount }" min="1" max="10">
										<input type="hidden" id="prodNo${status.index }"
											value="${cart.prodNo }">
										<button id="plusBtn${status.index }" class="plus-btn"
											type="button" name="button">
											<img src="/resources/product/img/plus.svg" alt="" />
										</button>
									</div>
									<br>
									<div class="row justify-content-center">
										<button id="updateAmountBtn${status.index }" type="button"
											name="button">수량 변경</button>
									</div>

								</td>
								<td class="align-middle">
									<div id="prodPrice${status.index }">${cart.price }</div>
								</td>
								<td class="align-middle"><div class="col-md-auto"
										id="prodTotalPrice${status.index }" class="total-price"></div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="row">
					<button id="delBtn" class="btn col-md-auto">선택상품 삭제</button>
					<button id="delAllBtn" class="btn col-md-auto">전체 삭제</button>
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

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			// 체크박스
			var ckedArr = [];
			delBtn = $('#delBtn');
			delAllBtn = $('#delAllBtn');
			$('#ckAll').click(function() {
				if($('#ckAll').is(':checked')){
					$("input[type=checkbox]").prop("checked", true);
				} else {
					$("input[type=checkbox]").prop("checked", false);
				}
			});
			
			delAllBtn.click(function() {
				if(confirm('모든 상품을 장바구니에서 삭제하시겠습니까?')){
					$(".check-input").each(function() {
						ckedArr.push($(this).val());
					});
					
					$.ajax({
						url : '/cart/delProduct',
						type : 'post',
						dataType : "text",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify(ckedArr),
						success : function(result) {
							ckedArr.length = 0;
							location.replace("/cart/view");
						}
					});
				}
			});
			
			delBtn.click(function() {
				if (confirm('선택하신 상품을 장바구니에서 삭제하시겠습니까?')) {
					$(".check-input:checked").each(function() {
						ckedArr.push($(this).val());
					});
					
					$.ajax({
						url : '/cart/delProduct',
						type : 'post',
						dataType : "text",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify(ckedArr),
						success : function(result) {
							ckedArr.length = 0;
							location.replace("/cart/view");
						}
					});
				}
			});
			
			// 장바구니 수량변경
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
		
			}

			$('#cartPrice').text('상품금액 : ' + cartPrice + '원');

			if(cartLength == 0){
				$('#tbody').html("<tr><td colspan='6'><h4 class='text-center'>장바구니가 비어 있습니다. </h4></td></tr>");
			}
			
		});
	</script>

</body>
</html>