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
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
<div style="text-align:center; padding-top:150px; padding-bottom:100px;">
<img src="/resources/img/404.png">
<br>
<br>
<h2 style="text-align:center; color:#86A688">에러가 발생했어요 :/</h2>

<div class="col-form-label align-middle mt-5">
<button class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" onclick = "location.href ='/'"> 메인으로 돌아가기</button>
<button class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" onclick = "javascript:history.back();"> 이전으로 돌아가기</button>
</div>

</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

</body>
</html>