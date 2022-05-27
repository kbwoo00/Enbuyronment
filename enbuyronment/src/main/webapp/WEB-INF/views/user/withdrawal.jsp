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
		<div class="row justify-content-around mt-5">
			<div class="col-md-2 mt-5">
				<%@include file="/WEB-INF/views/include/mypage_sidebar.jsp"%>
			</div>

			<div class="col-md-8">
				<div class="card mb-4 rounded-3 shadow-sm">
					<div class="card-header py-3">
						<h3 class="my-0 fw-normal">회원 탈퇴</h3>
					</div>
					<div class="card-body">
						<strong class="my-0 fw-normal text-danger">정말 탈퇴하시겠습니까?</strong>
						<strong class="my-0 fw-normal">계속 진행하려면 비밀번호를 입력해주세요</strong>
						<form class="form mt-3" action="/mypage/withdrawal" method="post"
							style="width: 80%;">
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
									<input type="password" class="form-control" name="pass"
										style="width: 80%;">
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