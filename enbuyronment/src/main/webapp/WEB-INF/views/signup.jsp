<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>earnvironment</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />

  <!-- 
	//////////////////////////////////////////////////////
	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co
	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="/resources/login/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/login/css/animate.css">
	<link rel="stylesheet" href="/resources/login/css/style.css">

	<!-- Modernizr JS -->
	<script src="/resources/login/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	<br><br>
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-md-offset-4">

					<!-- Start Sign In Form -->
					<form action="/user/userJoin" method="post" class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>회원가입</h2>
<!-- 						<div class="form-group"> -->
<!-- 							<div class="alert alert-success" role="alert">Your info has been saved.</div> -->
<!-- 						</div> -->
						<div class="form-group">
							<label for="id" class="sr-only">Id</label>
							<input type="text" class="form-control" id="id" placeholder="아이디" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="name" class="sr-only">Name</label>
							<input type="text" class="form-control" id="name" placeholder="이름" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">Email</label>
							<input type="email" class="form-control" id="email" placeholder="이메일" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">Password</label>
							<input type="password" class="form-control" id="password" placeholder="비밀번호" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="re-password" class="sr-only">Re-type Password</label>
							<input type="password" class="form-control" id="re-password" placeholder="비밀번호 확인" autocomplete="off">
						</div>
						<div class="form-group">
					<label for="address" class="sr-only">Address</label>
					<input type="text" class="form-control" id="sample5_address" placeholder="주소" autocomplete="off">
					<input type="submit" class="btn btn-primaryy" onclick="#" value="우편번호 찾기">
					</div>
					<div class="form-group">
							<label for="phone" class="sr-only">Phone</label>
							<input type="text" class="form-control" id="phone" placeholder="휴대폰" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="jumin" class="sr-only">Jumin</label>
							<input type="text" class="form-control" id="jumin" placeholder="주민번호" autocomplete="off">
						</div>
						<div class="form-group">
							<p>이미 아이디가 있나요? <a href="index.html">로그인</a></p>
						</div>
						<div class="form-group">
							<input type="submit" value="회원가입" class="btn btn-primary">
						</div>
					</form>
					<!-- END Sign In Form -->

				</div>
			</div>
		</div>

	<!-- jQuery -->
	<script src="/resources/login/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="/resources/login/js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="/resources/login/js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="/resources/login/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="/resources/login/js/main.js"></script>

	</body>
</html> 