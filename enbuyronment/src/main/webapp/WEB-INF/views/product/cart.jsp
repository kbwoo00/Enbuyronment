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
<link rel="shortcut icon" type="/resources/main/image/x-icon"
	href="/resources/main/img/favicon.ico">
<link rel="stylesheet" href="/resources/product/css/cart_style.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<div class="container mt-5" style="display: flex; justify-content: center;">
		<div class="page-wrapper" style="width: 80vw;">
			<div class="wrapper">
				<div class="row justify-content-between">
					<h3 class="col-md-auto">장바구니</h3>
					<div class="col-md-auto">
						<a id="delBtn" class="btn header-btn enb-loginBtn mb-2"
						style="color: white; padding: 1.3rem 1.3rem !important;">선택상품
						삭제</a>	
						<a id="delAllBtn" class="btn header-btn enb-loginBtn mb-2"
						style="color: white; padding: 1.3rem 1.3rem !important;">전체 삭제</a>
					</div>
				</div>
			</div>
			
			<table class="table">
				<thead>
					<tr>
						<th scope="col">
							<div class="row justify-content-center"><input id="ckAll" type="checkbox"></div>
						</th>
						<th scope="col">
							<div class="row justify-content-center">상품 이미지</div>
						</th>
						<th class="col-md-4" scope="col">
							<div class="row justify-content-center">상품 정보</div>
						</th>
						<th class="col-md-2" scope="col">
							<div class="row justify-content-center">수량</div>
						</th>
						<th scope="col">
							<div class="row justify-content-center">가격</div>
						</th>
						<th scope="col">
							<div class="row justify-content-center">총 금액</div>
						</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach var="cart" items="${cartList }" varStatus="status">
						<tr>
							<td class="align-middle" style="text-align: center;">
								<input class="check-input" type="checkbox" id="prodNo${status.index }" value="${cart.prodNo }" checked>
							</td>
							<td class="align-middle" style="text-align: center;">
								<a href="/product/${cart.prodNo }">
									<img style="width: 150px; height: 130px;" src="../upload/${cart.thumb }">
								</a>
							</td>
							<td class="align-middle">
								<a href="/product/${cart.prodNo }">
									<span class="productName">${cart.prodName }</span><br>
									<span class="categoryName">${cart.cateName }</span><br>
									<span class="brandName">${cart.brandName }</span>
								</a>
							</td>
							<td class="align-middle">
								<div class="quantity row justify-content-center" style="margin-right:-16px !important;">
									<button id="minusBtn${status.index }" class="minus-btn" type="button" name="button">
										<img src="/resources/product/img/minus.svg" alt="" />
									</button>
									<input type="number" name="name" id="amount${status.index }" value="${cart.amount }">
									<input type="hidden" id="prodNo${status.index }" value="${cart.prodNo }">
									<button id="plusBtn${status.index }" class="plus-btn" type="button" name="button">
										<img src="/resources/product/img/plus.svg" alt="" />
									</button>
								</div>
							</td>
							<td class="align-middle text-center">
								<div id="prodPrice${status.index }">${cart.price }</div>
							</td>
							<td class="align-middle text-center">
								<div class="col-md-auto" id="prodTotalPrice${status.index }" class="total-price"></div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div id="cartPrice" class="total-price"></div>
			<div class="total-price" id="shipCost"></div>
			<div class="total-price" id="totalCost"></div>
			<button id="paymentBtn" class="cart_btn col-6 enb-loginBtn mt-5" style="margin: 0 auto;">결제하기</button>
		</div>
	</div>
</body>

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
		
		//상품 전체삭제
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
		
		//상품 선택삭제
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
		
		var cartLength = "${fn:length(cartList) }";

		//목록 불러오기
		function listCall() {
			
			if(cartLength == 0){
				$('#tbody').html("<tr><td colspan='6'><h4 class='text-center'>장바구니가 비어 있습니다.</h4></td></tr>");
				$('#cartPrice').empty();
				$('#shipCost').empty();
				$('#totalCost').empty();
				
			} else {
				var cartPrice = 0;
				
				for(let i = 0; i < cartLength; i++) {
					$('#prodTotalPrice' + i).text(Number($('#prodPrice' + i).text()) * Number($('#amount' + i).val()));
					cartPrice += Number($('#prodTotalPrice' + i).text());
				}
				
				$('#cartPrice').text('총 상품 금액 : ' + cartPrice + '원');
				
				if(cartPrice >= 20000) {
					$('#shipCost').text('배송비 : 0원');
					$('#totalCost').text('결제 예상 금액 : ' + cartPrice + '원');
					
				} else {
					$('#shipCost').text('배송비 : 2,000원');
					$('#totalCost').text('결제 예상 금액 : ' + (cartPrice+2000) + '원');
				}
			}
		}
		
		//페이지 로딩 시
		listCall();
		
		// 장바구니 수량변경 시
		for (let i = 0; i < cartLength; i++) {
			
			//플러스
			$('#plusBtn' + i).click(function() {
				if($('#amount' + i).val() < 10) {
					$('#amount' + i).val(Number($('#amount' + i).val()) + 1);
				}
				
				var data = {
					'prodNo' : $('#prodNo' + i).val(),
					'amount' : $('#amount' + i).val(),
				};
				
				$.ajax({
					url: '/cart/modAmount',
					type: 'post',
					data:  JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success: function(data) {
						$('#cartPrice').empty();
						$('#shipCost').empty();
						$('#totalCost').empty();
						listCall();
					}
				});
			});
			
			//마이너스
			$('#minusBtn' + i).click(function() {
				if($('#amount' + i).val() > 1) {
					$('#amount' + i).val(Number($('#amount' + i).val()) - 1);
				}
				
				var data = {
					'prodNo' : $('#prodNo' + i).val(),
					'amount' : $('#amount' + i).val(),
				};
				
				$.ajax({
					url: '/cart/modAmount',
					type: 'post',
					data: JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success: function(data) {
						$('#cartPrice').empty();
						$('#shipCost').empty();
						$('#totalCost').empty();
						listCall();
					}
				});
			});
		}
		
		//주문하기
		$('#paymentBtn').click(function() {
			if(cartLength == 0) {
				alert('상품이 존재하지 않습니다!');
				return false;
				
			} else {
				$(".check-input:checked").each(function() {
					ckedArr.push($(this).val());
				});
				
				if(ckedArr.length == 0) {
					alert('주문상품을 선택해주세요');
					return false;
					
				} else {
					$.ajax({
						url : '/cart/updateStat',
						type : 'post',
						dataType : "text",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify(ckedArr),
						success : function(result) {
							ckedArr.length = 0;
							location.href="/order/view";
						}
					});
				}
			}
		});
		
	});
</script>
</html>