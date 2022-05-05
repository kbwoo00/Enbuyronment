<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Minimal and Clean Sign up / Login and Forgot Form by FreeHTML5.co</title>
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
	<script src="/resources/user/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

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
					<form class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>비밀번호 찾기</h2>
							<div class="form-group">
							<label for="id" class="sr-only">아이디</label>
							<input type="text" name="uid" class="form-control" id="id" placeholder="아이디" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">이메일</label>
							<input type="email" name="email" class="form-control" id="email" placeholder="이메일" autocomplete="off">
						</div>
						<div class="form-group">
							<p><a href="/user/login">로그인</a> | <a href="/user/userJoin">회원가입</a></p>
						</div>
						<div class="form-group">
							<input type="button" value="임시 비밀번호 발급" class="btn btn-primary" id="findPwBtn">
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
	$(document).ready(function() {
		$('#findPwBtn').click(function() {
			$.ajax({
				url: '/user/findPw',
				type: 'post',
				data: {
					'uid':$('#id').val(),
					'email':$('#email').val()
				},
				success: function(result) {
					if(result == "1")	{
						alert("이메일로 임시 비밀번호가 발송되었습니다");
						location.href = "/user/login";
						
					} else if(result == "2") {
						alert("이메일을 확인해주세요");
						
					} else if(result == "3") {
						alert("비회원입니다");
						
					} else {    //DB 비밀번호 변경 실패
						alert("비밀번호 발급 실패");
					}
				}
			});
		});
	});
	</script>

	</body>
</html>