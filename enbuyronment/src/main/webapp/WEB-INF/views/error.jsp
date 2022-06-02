<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>enbuyronment</title>
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<body>
	<main>
		<div class="container" style="max-width:1000px; text-align: center; height: 80vh;  display: flex;
    align-items: center;">
			<div class="row justify-content-center">
				<div class="col-md-5" style="width:500px;">
					<img src="/resources/assets/img/error.png" style="padding-bottom:2rem; width:20rem; height:15rem;">
					<h4 class="mt-3" style="color:#212529;">오류가 발생했어요 ;/</h4>
					<p style="color:#212529;">요청하신 페이지를 찾을 수 없어요</p>
					<input id="toMainBtn" type="button" class="btn enb-loginBtn" style="padding: 1.3rem 2.8rem !important;" value="메인으로">
				</div>
				<div class="col-md-5" style="width:400px;">
					<img src="/resources/assets/img/ahgo.png" style="width:16rem; height:16rem; margin-bottom: 4.8rem;">
					<input id="toBackBtn" type="button" class="btn enb-loginBtn" style="padding: 1.3rem 2.8rem !important;" value="뒤로가기">
				</div>
			</div>
		</div>
	</main>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$('#toMainBtn').click(function() {
			location.href = '/';
		});
		
		$('#toBackBtn').click(function() {
			location.history.back();
		});
	});
	</script>

</body>
</html>