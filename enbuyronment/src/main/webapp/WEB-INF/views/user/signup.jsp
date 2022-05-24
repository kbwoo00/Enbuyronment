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
<title>enbuyonment</title>
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
	<br>
	<br>
	<div class="container">
		<div class="row align-items-center">
		<div class="col-md-6 col-md-offset-3">
				<a href="/"><img class="logo"
					src="/resources/user/images/enbuyronment.png"
					style="cursor: pointer;"> </a>
		</div>
		</div>
		<div class="row ">
			
			<div class="col-md-6 col-md-offset-3">
				<!-- Start Sign In Form -->
				<form action="/user/join" method="post"
					class="fh5co-form animate-box" data-animate-effect="fadeIn"
					onsubmit="return check()">
					<h2>회원가입</h2>
					<!-- 						<div class="form-group"> -->
					<!-- 							<div class="alert alert-success" role="alert">Your info has been saved.</div> -->
					<!-- 						</div> -->
					<div class="row">
						<div class="col-md-8 form-group">
							<label for="id" class="sr-only">Id</label> <input type="text"
								class="form-control" id="uid" placeholder="아이디"
								autocomplete="off" name="uid" required="required">
						</div>
						<div class="col-md-2 form-group">
							<input type="button" id="checkIdBtn" class="btn btn-primary"
								value="아이디 중복 체크">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="sr-only">Name</label> <input type="text"
							class="form-control" id="name" placeholder="이름"
							autocomplete="off" name="name" required="required">
					</div>
					<div class="row">
						<div class="col-md-8 form-group">
							<label for="email" class="sr-only">Email</label> <input
								type="email" class="form-control" id="email" placeholder="이메일"
								autocomplete="off" name="email" required="required">
						</div>
						<div class="col-md-4 form-group">
							<input type="button" class="btn btn-primary col-md-12"
								id="emailCheckBtn" value="인증번호 보내기">
						</div>
					</div>
					<div class="row">
						<div class="col-md-8 form-group">
							<input type="text" class="form-control" id="certifyNum"
								placeholder="이메일로 보낸 인증번호를 입력해주세요" autocomplete="off"
								required="required">
						</div>
						<div class="col-md-4 form-group">
							<input type="button" class="btn btn-primary col-md-12"
								id="numCheckBtn" value="인증 번호 확인">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">Password</label> <input
							type="password" class="form-control" id="pass" placeholder="비밀번호"
							autocomplete="off" name="pass" required="required">
							<p>8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합</p>
					</div>
					<div class="form-group">
						<label for="re-password" class="sr-only">Re-type Password</label>
						<input type="password" class="form-control" id="rePass"
							placeholder="비밀번호 확인" autocomplete="off" required="required">
					</div>
					<p class="text-danger" id="passCfErMsg"></p>
					<div class="row">
						<div class="col-md-6 form-group">
							<input type="text" class="form-control" id="postcode"
								placeholder="우편번호" autocomplete="off" name="postcode"
								readonly="readonly" required="required">
						</div>
						<div class="col-md-6 form-group">
							<input type="button" class="btn btn-primary col-md-12"
								onclick="execDaumPostcode()" value="우편번호 찾기">
						</div>
					</div>
					<div class="form-group">
						<label for="address" class="sr-only">Address</label> <input
							type="text" class="form-control" id="address" placeholder="주소"
							autocomplete="off" name="addr" readonly="readonly"
							required="required"> <input type="text"
							class="form-control" id="detailAddress" placeholder="상세주소"
							autocomplete="off" name="dtAddr" required="required"> <input
							type="text" class="form-control" id="extraAddress" name="exAddr"
							placeholder="참고항목" autocomplete="off" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="phone" class="sr-only">Phone</label> <input type="tel"
							class="form-control" id="phone" placeholder="휴대폰 ex)010-1234-5678"
							autocomplete="off" name="phone" required="required">
					</div>
					<div class="form-group">
						<label for="jumin" class="sr-only">Jumin</label> <input
							type="text" class="form-control" id="jumin" placeholder="주민번호 ex)801025-1234567"
							autocomplete="off" name="jumin" required="required">
					</div>
					<div class="form-group">
						<p>
							이미 아이디가 있나요? <a href="/user/login">로그인</a>
						</p>
					</div>
					<div class="form-group">
						<input type="submit" value="회원가입" id="signupBtn"
							class="btn btn-primary btn-lg col-md-offset-5">
					</div>
				</form>
				<!-- END Sign In Form -->
			</div>
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
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
	</script>
	<script>
		var emailCheck = false;
		var idCheck = false;
		var certiNum;
		var pass = $('#pass');
		var rePass = $('#rePass');
		var passCfErMsg = $('#passCfErMsg');
		var uid = $('#uid');
		var email = $('#email');
		var phone = $('#phone');
		var jumin = $('#jumin');

		var idRegExp = /^[a-z]+[a-z0-9]{5,19}$/g;
		var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var passRegExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		var phoneRegExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
		var juminRegExp = /\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])[-]*[1-4]\d{6}/;

		// 유효성 검증
		function check() {
			if (!idCheck) {
				alert('아이디 중복체크를 확인해주세요');
				uid.focus();
				return false;
			}

			if (!emailCheck) {
				alert('이메일을 인증해주세요.');
				email.focus();
				return false;
			}
			
			if(!passRegExp.test(pass.val())){
				alert('비밀번호는 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합해야 합니다.');
				pass.focus();
				return false;
			}

			if (rePass.val() != pass.val()) {
				alert('비밀번호가 일치하지 않습니다.');
				pass.focus();
				return false;
			}
			
			if (!phoneRegExp.test(phone.val())){
				alert('휴대폰 번호의 형식이 올바르지 않습니다.');
				phone.focus();
				return false;
			}
			
			if (!juminRegExp.test(jumin.val())){
				alert('주민번호의 형식이 올바르지 않습니다.');
				jumin.focus();
				return false;
			}
			
			alert('회원가입이 정상적으로 되었습니다.');
		}

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
							document.getElementById("detailAddress").focus();
						}
					}).open();
		}

		$(document).ready(function() {
			// 아이디 중복 체크
			$('#checkIdBtn').click(function() {
				if (idRegExp.test(uid.val())) {
					$.ajax({
						url : '/user/checkId',
						type : 'post',
						data : {
							'uid' : $('#uid').val()
						},
						success : function(msg) {
							if (confirm(msg)) {
								idCheck = true;
								uid.attr("readonly", true);
							}
						}
					});
				} else {
					alert('아이디는 영문자로 시작해야 하며, 영어 숫자 조합으로 6 ~ 20자 사이만 가능합니다.');
				}

			});

			// 이메일에 인증번호 보내기
			$('#emailCheckBtn').click(function() {
				if (emailRegExp.test(email.val())) {
					$.ajax({
						url : '/user/checkEmail',
						type : 'post',
						contentType : "application/text; charset=utf-8",
						data : email.val(),
						success : function(msg) {
							if (msg == '인증실패') {
								alert('인증에 실패했습니다. 이메일을 다시 입력해주세요');
							} else {
								certiNum = msg;
								$('#email').attr("readonly", true);
								alert('인증번호를 발급하였습니다. 이메일을 확인해주세요');
							}
						}
					});
				} else {
					alert('이메일 형식이 올바르지 않습니다.');
				}
			});

			// 인증번호 확인
			$('#numCheckBtn').click(function() {
				if (certiNum == $('#certifyNum').val()) {
					emailCheck = true;
					$('#certifyNum').attr("readonly", true);
					alert('정상적으로 인증되었습니다. 나머지 정보를 입력해주세요');
				} else {
					alert('인증번호가 틀렸습니다. 다시 입력해주세요');
				}
			});

			// 비밀번호 확인
			rePass.keyup(function() {
				if (rePass.val() != pass.val()) {
					passCfErMsg.text('비밀번호가 일치하지 않습니다.');
				} else {
					passCfErMsg.text('비밀번호가 일치합니다');
				}
			});
			pass.keyup(function() {
				if (rePass.val() != pass.val()) {
					passCfErMsg.text('비밀번호가 일치하지 않습니다.');
				} else {
					passCfErMsg.text('비밀번호가 일치합니다');
				}
			});

		});
	</script>
	<br>
	<br>
	<br>
</body>
</html>
