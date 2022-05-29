<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/assets/img/favicon.ico">
<%@include file="/WEB-INF/views/include/css.jsp"%>
<style type="text/css">
	.orderInfo{
		color: black;
	}
</style>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<main>
		<!-- Preloader Start -->
		<div id="preloader-active">
			<div
				class="preloader d-flex align-items-center justify-content-center">
				<div class="preloader-inner position-relative">
					<div class="preloader-circle"></div>
					<div class="preloader-img pere-text">
						<img src="/resources/img/loading.png" alt="loding_logo">
					</div>
				</div>
			</div>
		</div>
		<!-- Preloader Start -->

		<!-- sidebar include조각으로 넣어주기 -->
		<div class="container justify-content-center mt-5">
			<div class="row justify-content-around mt-5">
				<div class="col-md-2 mt-5">
					<%@include file="/WEB-INF/views/include/mypage_sidebar.jsp"%>
				</div>
				<div class="col-md-8">
					<%@include file="/WEB-INF/views/include/mypage_navbar.jsp"%>
					<div class="card mb-4 rounded-3 shadow-sm">
						<div class="card-header py-3">
							<h3 class="my-0 fw-normal">주문 상세</h3>
						</div>
						<div class="card-body border-top">
							<div class="d-flex flex-column align-items-stretch flex-shrink-0">
								<!-- 주문 상품들 -->

								<div class="list-group list-group-flush border-bottom scrollarea mt-3 mb-5">
									<div class="row justify-content-between mb-3">
										<div class="col-md-auto">
											<h4>
												<fmt:formatDate value="${orderInfo.orderDate }"
													pattern="yyyy년 MM월 dd일" />
												주문
											</h4>
											<h5>[${orderInfo.status }]</h5>
										</div>
										<div class="col-md-auto"><h5>주문번호</h5><strong>${orderInfo.orderNo }</<strong></div>

										<div class="col-md-3">
											<c:if test="${orderInfo.status == '배송 준비' }">
												<input class="btn enb-loginBtn" type="button" value="주문 취소"
													style="margin-left: 1.3rem; padding: 1.3rem 1.3rem !important;">
											</c:if>
										</div>
									</div>
									<c:forEach var="prod" items="${prodList }">
										<div class="card mb-3">
											<div class="card-body">
												<div class="row justify-content-around">
													<div class="col-md-auto">
														<a href="/product/${prod.prodNo }" style="color: black;">
															<img class="img-thumbnail" alt="#"
															src="/upload/${prod.thumb }" width="130px;"
															height="130px;">
														</a>
													</div>
													<div class="col-md-8">
														<div class="row mb-1">
															<a href="/product/${prod.prodNo }"
																style="color: black; font-size: 20px; font-weight: bold;">
																<span>[${prod.brandName}] ${prod.prodName }</span>
															</a>
														</div>
														<a href="/product/${prod.prodNo }" style="color: black;">
															<div class="row justify-content-between mb-4">
																<span>${prod.price } 원</span> <span>${prod.amount }
																	개</span>
															</div>
														</a>
														<c:if test="${orderInfo.status == '배송 완료' }">
															<div class="row justify-content-end">
																<div class="col-md-3">
																	<input type="hidden" value="${prod.prodNo }"> <a
																		href="/mypage/review/write?prodNo=${prod.prodNo }">
																		<input class="btn enb-loginBtn me-1" type="button"
																		value="리뷰 작성"
																		style="padding: 1.3rem 1.3rem !important;">
																	</a>
																</div>
																<div class="col-md-3">
																	<input class="btn enb-loginBtn me-1" type="button"
																		value="상품 문의"
																		style="padding: 1.3rem 1.3rem !important;">
																</div>
															</div>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<!-- 주문 상품들 -->

								<!-- 수령인 정보 -->
								<h5>수령인 정보</h5>
								<div class="col-md-12 mb-5">
									<div class="h-100 p-3 bg-light border rounded-3">
										<div class="row">
											<div class="col-md-2">
												<p class="fs-4">받는 사람</p>
											</div>
											<div class="col-md-10 text-start">
												<p class="orderInfo">: ${orderInfo.receiver }</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<p class="fs-4">연락처</p>
											</div>
											<div class="col-md-10 text-start">
												<p class="orderInfo">: ${orderInfo.phone }</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<p class="fs-4">주소</p>
											</div>
											<div class="col-md-10 text-start">
												<p class="orderInfo">: (${orderInfo.postcode }) ${orderInfo.addr } ${orderInfo.dtAddr } ${orderInfo.exAddr }</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<p class="fs-4">요청사항</p>
											</div>
											<div class="col-md-10 text-start">
												<p class="orderInfo">: ${orderInfo.request }</p>
											</div>
										</div>
									</div>
								</div>
								<!-- 수령인 정보 -->

								<!-- 결제 정보 -->
								<h5>결제 정보</h5>
								<div class="col-md-12 mb-5">
									<div class="h-100 p-3 bg-light border rounded-3">
										<div class="row">
											<div class="col-md-3">
												<p>상품 총 금액</p>
											</div>
											<div class="col-md-9 text-start">
												<p class="orderInfo">: ${prodTotalPrice } 원</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
												<p>배송비</p>
											</div>
											<div class="col-md-9 text-start">
												<c:choose>
													<c:when test="${prodTotalPrice > 20000}"><p class="orderInfo">: 0원</p></c:when>
													<c:otherwise><p class="orderInfo">: 2000원</p></c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
												<p>사용 포인트</p>
											</div>
											<div class="col-md-9 text-start">
												<p class="orderInfo">: ${orderInfo.pointDown } p</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
												<p>적립 포인트</p>
											</div>
											<div class="col-md-9 text-start">
												<p class="orderInfo">: ${orderInfo.pointUp } p</p>
											</div>
										</div>
										<div class="row ">
											<div class="col-md-3">
												<p>총 결제 금액</p>
											</div>
											<div class="col-md-9 text-start">
												<p class="orderInfo">: ${orderInfo.totalPrice } 원</p>
											</div>
										</div>
									</div>
								</div>
								<!-- 결제 정보 -->

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
		$(document).ready(function() {
			$('#orderLink').attr('class', 'mypage-menu-active');
		});
	</script>
	<script src="/resources/user/js/mypage.js" type="text/javascript"></script>

	<script src="https://kit.fontawesome.com/58cff89876.js"
		crossorigin="anonymous"></script>
</body>
</html>