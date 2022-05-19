<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="/resources/main/image/x-icon"
	href="/resources/main/img/favicon.ico">
<link rel="stylesheet" href="/resources/product/css/main.css">
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
						<br>
						<h2 class="title">상품 등록</h2>
						<form method="post" enctype="multipart/form-data">
							<div class="row row-space">
								<div class="col">
									<label class="label form-label">상품명</label> <input
										class="reg_input form-control" type="text" name="prodName">
									<br>
								</div>
							</div>
							<div class="row row-space">
								<div class="col-md-6">
									<label class="label form-label">가격</label><br> <input
										class="reg_input form-control" type="text" name="price">
								</div>
								<div class="col-md-6">
									<label class="label form-label">수량</label><br> <input
										class="reg_input form-control" type="text" name="stock">
								</div>
							</div>
							<br> <br>
							<div class="row row-space">
								<div class="col-5">
									<div class="input-group">
										<label class="label">상품이미지(대표)</label> <input class="input"
											type="file" name="prodImg" accept="image/*">
									</div>
								</div>
								<div class="col-5">
									<div class="input-group">
										<label class="label">상품이미지</label><br> <input
											class="input" type="file" name="prodImg" accept="image/*">
									</div>
								</div>
								<br>
							</div>
							<div class="row row-space">
								<div class="col-5">
									<div class="input-group">
										<label class="label">상품이미지</label><br> <input
											class="input" type="file" name="prodImg" accept="image/*">
									</div>
								</div>
								<div class="col-5">
									<div class="input-group">
										<label class="label">상품이미지</label><br> <input
											class="input" type="file" name="prodImg" accept="image/*">
									</div>
								</div>
							</div>
							<div class="row row-space">
								<div class="col-5">
									<div class="input-group">
										<label class="label">상품설명</label><br> <input
											class="input" type="file" name="prodImg" accept="image/*">
									</div>
								</div>
							</div>
							<br>
							<div class="row justify-content-between">
								<div class="col-md-5">
									<div class="input-group" style="flex-direction: column;">
										<br> <label class="label">브랜드</label> <select
											class="select-group col-md-auto" name="brandName">
											<option disabled="disabled" selected="selected">브랜드를
												선택하세요</option>
											<c:forEach var="i" items="${brand }">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-5">
									<div class="input-group" style="flex-direction: column;">
										<br> <label class="label">용도</label> <select
											class="select-group col-md-auto" name="cateName">
											<option disabled="disabled" selected="selected">용도를
												선택하세요</option>
											<c:forEach var="i" items="${cate }">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="btn_submit row mt-4 justify-content-center">
									<div class="col-md-auto">
										<button class="btn header-btn enb-loginBtn" type="submit">등록</button>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
<!-- end document-->