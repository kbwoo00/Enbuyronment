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
					<div class="card-body">
						
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
			
		});
	</script>
	<script src="/resources/user/js/mypage.js" type="text/javascript"></script>
	
	<script src="https://kit.fontawesome.com/58cff89876.js" crossorigin="anonymous"></script>
</body>
</html>