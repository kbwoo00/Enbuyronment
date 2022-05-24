<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<div class="container justify-content-center mt-5">
	<%@include file="/WEB-INF/views/include/mypage_navbar.jsp"%>
		<div class="row justify-content-between mt-5">
			<div class="col-md-2 mt-5">
				<%@include file="/WEB-INF/views/include/mypage_sidebar.jsp"%>
			</div>
		
			<div class="col-md-8">
				<div class="row"><h3>정말 탈퇴하시겠습니까?</h3></div>
				<div class="row"><h4 class="mb-5">탈퇴하시려면 비밀번호를 입력해주세요</h4></div>
				
				<form class="form" action="/mypage/withdrawal" method="post" style="width: 80%;">
					<div class="mb-3 ms-5 row justify-content-center">
						<label class="col-sm-2 col-form-label">아이디</label>
						<div class="col-md-6">
							<input type="text" readonly class="form-control-plaintext"
								id="staticEmail" value="${userId }" name="uid">
						</div>
					</div>
					<div class="mb-5 row justify-content-center">
						<label class="col-sm-2 col-form-label" style="width: 30%;">비밀번호</label>
						<div class="col-md-6">
							<input type="password" class="form-control" name="pass" style="width: 80%;">
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="form-group">
							<input type="submit" value="탈퇴하기" class="btn enb-loginBtn">
						</div>
					</div>
				</form>
			</div>


		</div>

	</div>



	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

	<script type="text/javascript">
		var msg = '${msg }'
		if (msg == 'fail') {
			alert('비밀번호가 틀렸습니다. 다시 입력해주세요');
		}
	</script>
</body>
</html>