<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>earnvironment</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
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
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

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
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center"></div>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-4">
				<!-- Start Sign In Form -->
				<form action="/user/join" method="post"
					class="fh5co-form animate-box" data-animate-effect="fadeIn">
					<h2>회원가입</h2>
					<!-- 						<div class="form-group"> -->
					<!-- 							<div class="alert alert-success" role="alert">Your info has been saved.</div> -->
					<!-- 						</div> -->
					<div class="form-group">
						<label for="id" class="sr-only">Id</label> <input type="text"
							class="form-control" id="uid" placeholder="아이디" autocomplete="off"
							name="uid"> <input type="button" id="checkIdBtn"
							class="btn btn-primary" value="아이디 중복 체크">
					</div>
					<div class="form-group">
						<label for="name" class="sr-only">Name</label> <input type="text"
							class="form-control" id="name" placeholder="이름"
							autocomplete="off" name="name">
					</div>
					<div class="form-group">
						<label for="email" class="sr-only">Email</label> <input
							type="email" class="form-control" id="email" placeholder="이메일"
							autocomplete="off" name="email">
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">Password</label> <input
							type="password" class="form-control" id="password"
							placeholder="비밀번호" autocomplete="off" name="pass">
					</div>
					<div class="form-group">
						<label for="re-password" class="sr-only">Re-type Password</label>
						<input type="password" class="form-control" id="re-password"
							placeholder="비밀번호 확인" autocomplete="off">
					</div>
					<div class="form-group">
						<div>
							<input type="text" class="form-control col-md-3" id="postcode"
								placeholder="우편번호" autocomplete="off" name="postcode"
								readonly="readonly"> <input type="button"
								class="btn btn-primary col-md-3" onclick="execDaumPostcode()"
								value="우편번호 찾기">
						</div>
						<label for="address" class="sr-only">Address</label> <input
							type="text" class="form-control" id="address" placeholder="주소"
							autocomplete="off" name="addr" readonly="readonly"> <input
							type="text" class="form-control" id="detailAddress"
							placeholder="상세주소" autocomplete="off" name="dtAddr"> <input
							type="text" class="form-control" id="extraAddress" name="exAddr"
							placeholder="참고항목" autocomplete="off" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="phone" class="sr-only">Phone</label> <input
							type="text" class="form-control" id="phone" placeholder="휴대폰"
							autocomplete="off" name="phone">
					</div>
					<div class="form-group">
						<label for="jumin" class="sr-only">Jumin</label> <input
							type="text" class="form-control" id="jumin" placeholder="주민번호"
							autocomplete="off" name="jumin">
					</div>
					<div class="form-group">
						<p>
							이미 아이디가 있나요? <a href="index.html">로그인</a>
						</p>
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
	<script src="/resources/user/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="/resources/user/js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="/resources/user/js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="/resources/user/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="/resources/user/js/main.js"></script>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress").value = extraAddr;

							} else {
								document.getElementById("extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress")
									.focus();
						}
					}).open();
		}
		
		$(document).ready(function() {
			$('#checkIdBtn').click(function() {
				console.log($('#uid').val());
				$.ajax({
					url: '/user/checkId',
					type: 'post',
					data: {
						'uid' : $('#uid').val()
					},
					success: function(result) {
						alert(result);
					}
				});
			});
		});
	</script>
</body>
</html>
