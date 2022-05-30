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
<main>
	<br>
	<br>
	<br>
	<div class="container" style="display: flex; justify-content: center;">
		<div class="page-wrapper">
			<div class="wrapper">
				<div class="card card-4">
					<div class="card-body">
						<h2 class="title">상품 수정</h2>
						<form method="post" enctype="multipart/form-data">
							<div class="row row-space">
								<div class="col">
									<label class="label form-label">상품명</label> <input
										class="reg_input form-control" type="text" name="prodName"
										value="${vo.prodName }"> <br>
								</div>
							</div>
							<div class="row row-space">
								<div class="col-md-6">
									<label class="label form-label">가격</label><br> <input
										class="reg_input form-control" type="text" name="price"
										value="${vo.price }">
								</div>
								<div class="col-md-6">
									<label class="label form-label">수량</label><br> <input
										class="reg_input form-control" type="text" name="stock"
										value="${vo.stock }">
								</div>
							</div>
							<br> <br>
							<div class="row row-space mb-4">
								<div class="col-5">
									<div class="input-group">
										<label class="label">상품이미지(대표)</label> 
										<input class="input"
											type="file" name="prodImg" id="thumbImg" accept="image/*">
									</div>
								</div>
								<div class="col-5">
									<div class="input-group">
										<label class="label">상품이미지</label><br> <input
											class="input" type="file" name="prodImg" id="prodImg2"
											accept="image/*">
									</div>
								</div>
								<br>
							</div>
							<div class="row row-space mb-4">
								<div class="col-5">
									<div class="input-group">
										<label class="label">상품이미지</label><br> <input
											class="input" type="file" name="prodImg" id="prodImg3"
											accept="image/*">
									</div>
								</div>
								<div class="col-5">
									<div class="input-group">
										<label class="label">상품이미지</label><br> <input
											class="input" type="file" name="prodImg" id="prodImg4"
											accept="image/*">
									</div>
								</div>
							</div>
							<div class="row row-space mb-4">
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
											class="select-group" name="brandName">
											<option disabled="disabled">브랜드를 선택하세요</option>
											<c:forEach var="i" items="${brand }">
												<c:choose>
													<c:when test="${i eq vo.brandName }">
														<option value="${i}" selected>${i}</option>
													</c:when>
													<c:otherwise>
														<option value="${i}">${i}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-5">
									<div class="input-group" style="flex-direction: column;">
										<br> <label class="label">용도</label> <select
											class="select-group" name="cateName">
											<option disabled="disabled">용도를 선택하세요</option>
											<c:forEach var="i" items="${cate }">
												<c:choose>
													<c:when test="${i eq vo.cateName }">
														<option value="${i}" selected>${i}</option>
													</c:when>
													<c:otherwise>
														<option value="${i}">${i}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="btn_submit row justify-content-center mt-4">
								<div class="col-md-auto">
								<button class="btn header-btn enb-loginBtn" id="modProdBtn"
									type="submit">수정</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#modProdBtn').click(
							function() {
								if ($('#prodImg2').val()
										|| $('#prodImg3').val()
										|| $('#prodImg4').val()) {
									if (!$('#thumbImg').val()) {
										alert('대표 이미지를 첨부해주세요');
										return false;
									}
								}
							});

				});
	</script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
<!-- end document-->