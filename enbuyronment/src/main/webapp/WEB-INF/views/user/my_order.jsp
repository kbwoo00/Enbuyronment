<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	.fa-star{
		color: #ffd400;
		cursor: pointer;
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
						<h3 class="my-0 fw-normal">주문 내역</h3>
					</div>
					<div class="row justify-content-around mt-2 mb-2 align-items-center p-2">
						<strong>기간별로 보기</strong>
						<input class="btn enb-loginBtn" type="button" value="1주일" style="margin-left: 1.3rem; padding: 1.3rem 1.3rem !important;">
						<input class="btn enb-loginBtn" type="button" value="1개월" style="margin-left: 1.3rem; padding: 1.3rem 1.3rem !important;">
						<input class="btn enb-loginBtn" type="button" value="3개월" style="margin-left: 1.3rem; padding: 1.3rem 1.3rem !important;">
						<input class="btn enb-loginBtn" type="button" value="6개월" style="margin-left: 1.3rem; padding: 1.3rem 1.3rem !important;">
						<input class="btn enb-loginBtn" type="button" value="전체" style="margin-left: 1.3rem; padding: 1.3rem 1.3rem !important;">
					</div>
					<div class="card-body border-top">
					<div class="d-flex flex-column align-items-stretch flex-shrink-0">
						<c:forEach var="order" items="${orderList }" varStatus="status">
						<div class="list-group list-group-flush border-bottom scrollarea mt-3">
						<div class="row justify-content-between mb-3">
							<div class="col-md-auto">
								<h4><fmt:formatDate value="${order.key.orderDate }" pattern="yyyy년 MM월 dd일"/> 주문</h4>
								<h5>[${order.key.status }]</h5>
							</div>
							<div class="col-md-4">
								<a style="color: blue; font-size: 20px;" href="/mypage/order/${order.key.orderNo }"><span class="align-middle">주문 상세</span></a>
								<c:if test="${order.key.status == '배송 준비' }">
									<input class="btn enb-loginBtn" id="cancelOrderBtn${status.count }" type="button" value="주문 취소" style="margin-left: 1.3rem; padding: 1.3rem 1.3rem !important;">
								</c:if>
							</div>
						</div>
						
						<c:forEach var="prod" items="${order.value }">
							<div class="card">
						      <div class="card-body">
						      	<div class="row justify-content-around">
						      		<div class="col-md-auto">
						      			<a href="/product/${prod.prodNo }" style="color: black;">
									      <img class="img-thumbnail" alt="#" src="/upload/${prod.thumb }" width="130px;" height="130px;">
						      			</a>
						      		</div>
						      		<div class="col-md-8">
					      				<div class="row mb-1">
					      					<a href="/product/${prod.prodNo }" style="color: black; font-size: 20px; font-weight: bold;">
					      						<span>[${prod.brandName}] ${prod.prodName }</span>
					      					</a>
					      				</div>
				      					<a href="/product/${prod.prodNo }" style="color: black;">
									        <div class="row justify-content-between mb-4">
											        <span>${prod.price } 원</span>
											        <span>${prod.amount } 개</span>
									        </div>
				      					</a>
								       	<c:if test="${order.key.status == '배송 완료' }">
									        <div class="row justify-content-end">
									        	<div class="col-md-3">
									        		<input type="hidden" value="${prod.prodNo }">
										        <a href="/mypage/review/write?prodNo=${prod.prodNo }">
											        <input class="btn enb-loginBtn me-1" type="button" value="리뷰 작성" style="padding: 1.3rem 1.3rem !important;">
										        </a>	
									        	</div>
									        	<div class="col-md-3">
										        	<input class="btn enb-loginBtn me-1" type="button" value="상품 문의" style="padding: 1.3rem 1.3rem !important;">
									        	</div>
									        </div>
								       	</c:if>
						      		</div>
						      	</div>
						      </div>
					  	  	</div>
						</c:forEach>
						</div>
						</c:forEach>
					</div>
					</div>
				</div>
				<!-- 페이지 버튼 그룹 -->
			  <div class="row justify-content-center">
				<nav class="blog-pagination d-flex"
					aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${pageInfo.prev }">
							<li class="page-item"><a class="page-link"
								href="/mypage/order?page=${pageInfo.startPage - 1}"
								aria-label="Previous"> <i class="ti-angle-left"></i>
							</a></li>
						</c:if>
						<c:forEach begin="${pageInfo.startPage }"
							end="${pageInfo.endPage }" var="i">
							<c:choose>
								<c:when test="${i == presentPage }">
									<li class="page-item active"><a class="page-link "
										href="/mypage/order?page=${i }">${i }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link active"
										href="/mypage/order?page=${i }">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageInfo.next && pageInfo.endPage > 0  }">
							<li class="page-item"><a class="page-link"
								href="/mypage/order?page=${pageInfo.endPage + 1}"
								aria-label="Next"> <i class="ti-angle-right"></i>
							</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- 페이지 버튼 그룹 -->
			</div>
		</div>
	</div>

	</main>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
	<script src="/resources/user/js/mypage.js" type="text/javascript"></script>
	
	<script src="https://kit.fontawesome.com/58cff89876.js" crossorigin="anonymous"></script>
</body>
</html>