<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
				<div class="card card-4">
					<div class="card-body">
						<!-- Title -->
						<div class="title">장바구니</div>

						<!-- Product #1 -->
						<div class="item">
							<div class="buttons">
								<span class="delete-btn"></span>
							</div>

							<div class="image">
								<img src="/resources/product/img/item-1.png" alt="" />
							</div>

							<div class="description">
								<span class="productName">친환경 비누</span> <span
									class="categoryName">비누</span> <span class="brandName">동구밭</span>
							</div>

							<div class="quantity">
								<button class="minus-btn" type="button" name="button">
									<img src="/resources/product/img/minus.svg" alt="" />
								</button>
								<input type="text" name="name" value="1">
								<button class="plus-btn" type="button" name="button">
									<img src="/resources/product/img/plus.svg" alt="" />
								</button>
							</div>

							<div class="price">$549</div>
						</div>

						<!-- Product #2 -->
						<div class="item">
							<div class="buttons">
								<span class="delete-btn"></span>
							</div>

							<div class="image">
								<img src="/resources/product/img/item-2.png" alt="" />
							</div>
							<div class="description">
								<span class="productName">친환경세제</span> <span
									class="categoryName">세제</span> <span class="brandName">더피커</span>
							</div>

							<div class="quantity">
								<button class="minus-btn" type="button" name="button">
									<img src="/resources/product/img/minus.svg" alt="" />
								</button>
								<input type="text" name="name" value="1">
								<button class="plus-btn" type="button" name="button">
									<img src="/resources/product/img/plus.svg" alt="" />
								</button>
							</div>

							<div class="price">$870</div>
						</div>

						<!-- Product #3 -->
						<div class="item">
							<div class="buttons">
								<span class="delete-btn"></span>
							</div>

							<div class="image">
								<img src="/resources/product/img/item-3.png" alt="" />
							</div>

							<div class="description">
								<span class="productName">친환경 가방</span> <span
									class="categoryName">에코백</span> <span class="brandName">동구밭</span>
							</div>

							<div class="quantity">
								<button class="minus-btn" type="button" name="button">
									<img src="/resources/product/img/minus.svg" alt="" />
								</button>
								<input type="text" name="name" value="1">

								<button class="plus-btn" type="button" name="button">
									<img src="/resources/product/img/plus.svg" alt="" />
								</button>
							</div>
							<div class="price">$349</div>
						</div>
					</div>
					<div class="total-price">상품금액 : $9999</div>
					<div class="total-price">배송비 : $9999</div>
					<div class="total-price">총 결제금액 : $9999</div>
					<br> <br> <br>
					<div class="cart_btn col-10" style="float: none; margin:0 auto;">결제하기</div>
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
		
	});
	</script>

</body>
</html>