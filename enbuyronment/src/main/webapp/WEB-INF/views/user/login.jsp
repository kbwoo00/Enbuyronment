<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>enbuyronment</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet" href="/resources/user/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/user/css/animate.css">
<link rel="stylesheet" href="/resources/user/css/style.css">

<!-- Modernizr JS -->
<script src="/resources/user/js/modernizr-2.6.2.min.js"></script>

</head>
<body>
	<div class="container">
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="row">
			<a class="col-md-5 col-md-offset-4" href="/"><img class="logo"
				src="/resources/user/images/enbuyronment.png"
				style="cursor: pointer;"> </a>
			<div class="col-md-12 text-center"></div>
			<div class="col-md-4 col-md-offset-4">
				<!-- Start Sign In Form -->
				<form action="" method="post"
					class="fh5co-form animate-box" data-animate-effect="fadeIn">
					<h2>로그인</h2>
					<div class="form-group">
						<label for="username" class="sr-only">아이디</label> <input
							type="text" class="form-control" id="username" placeholder="아이디"
							autocomplete="off" name="uid">
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">비밀번호</label> <input
							type="password" class="form-control" id="password"
							placeholder="비밀번호" autocomplete="off" name="pass">
					</div>
					<div class="form-group">
						<p>아직 회원이 아니십니까?</p>
						<p>
							<a href="/user/join">회원가입</a> | <a href="/user/findId">아이디 찾기</a>
							| <a href="/user/findPw">비밀번호 찾기</a>
						</p>
					</div>
					<div class="col col-md-offset-4 justify-content-center">
						<div class="form-group">
							<input type="submit" value="로그인" class="btn btn-primary">
						</div>
					</div>
				</form>
				<!-- END Sign In Form -->
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="/resources/user/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="/resources/user/js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="/resources/user/js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="/resources/user/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="/resources/user/js/main.js"></script>

	<script type="text/javascript">
		var msg = '${msg }'
		if (msg == 'fail') {
			alert('아이디 또는 비밀번호가 틀렸습니다.');
		}
	</script>
</body>
</html>
