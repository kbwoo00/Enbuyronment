<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>enbuyronment</title>
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
	 
	<link rel="stylesheet" href="/resources/user/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/user/css/animate.css">
	<link rel="stylesheet" href="/resources/user/css/style.css">

	<!-- Modernizr JS -->
	<script src="./resources/user/js/modernizr-2.6.2.min.js"></script>

	</head>
	<body>
	<br><br><br><br><br><br><br><br><br><br>
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					

					<!-- Start Sign In Form -->
					<form method="post" class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>아이디 찾기</h2>
							<div class="form-group">
							<label for="username" class="sr-only">이름</label>
							<input type="text" name="name" class="form-control" id="username" placeholder="이름" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">이메일</label>
							<input type="email" name="email" class="form-control" id="email" placeholder="이메일" autocomplete="off">
						</div>
						<div class="form-group">
							<div class="alert alert-success" id="foundId" role="alert"></div>
						</div>
						<div class="form-group">
							<p><a href="index.html">로그인</a> | <a href="sign-up.html">회원가입</a></p>
						</div>
						<div class="form-group">
							<input type="submit" value="아이디 찾기" class="btn btn-primary">
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('.btn-primary').click(function() {
			$.ajax({
				url: '/user/findId',
				type: 'post',
				data: {
					'name':$('#username').val(),
					'email':$('#email').val()
				},
				success: function(result) {
					$('#foundId').html(result);
				}
			});
		});
	});
	</script>

	</body>
</html>