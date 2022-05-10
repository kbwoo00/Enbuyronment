<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="/resources/main/image/x-icon" href="/resources/main/img/favicon.ico">
<script src="/resources/user/js/jquery.min.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			var uri = location.pathname;
			var prodNo = uri.substring(uri.lastIndexOf('/')+1);
			
			$('#modProd').click(function() {
				location.href = uri+'/update';
			});
			
			$('#delProd').click(function() {
				if(confirm('상품을 삭제하시겠습니까?')) {
					location.href = uri+'/delete';
				}
			});
			
		});
	</script>
<link rel="stylesheet" href="/resources/product/css/main.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>

상품명 : ${vo.prodName }<br>
상품가격 : ${vo.price }<br>
브랜드 : ${vo.brandName }<br>
용도 : ${vo.cateName }

<hr>

썸네일 : <img src="../upload/${vo.thumb }">

<c:if test="${vo.prodImg2 ne '' }">
	추가 이미지 : <img src="../upload/${vo.prodImg2 }">
</c:if>
<c:if test="${vo.prodImg3 ne '' }">
	추가 이미지 : <img src="../upload/${vo.prodImg3 }">
</c:if>
<c:if test="${vo.prodImg4 ne '' }">
	추가 이미지 : <img src="../upload/${vo.prodImg4 }">
</c:if>

<br>

상품설명 : <img src="../upload/${vo.script }">

<hr><br>

수량 : <input class="product_count_item input-number" type="text" value="1" id="amount">

<br><br>

<input type="button" value="장바구니 담기" id="toCart">

<br><br><hr><br>

<input type="button" value="상품 수정" id="modProd">
<input type="button" value="상품 삭제" id="delProd">

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@include file="/WEB-INF/views/include/script.jsp"%>
<%@include file="/WEB-INF/views/include/header_script.jsp"%>
</body>
</html>