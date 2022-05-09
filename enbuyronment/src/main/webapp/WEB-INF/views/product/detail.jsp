<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/user/js/jquery.min.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			
			$('#plus').click(function() {
				if(Number($('#account').val()) < 10) {
					$('#account').val(Number($('#account').val()) + 1)
					$('#total-price').html(${vo.price} * $('#account').val());
				}
			});
			
			$('#minus').click(function() {
				if(Number($('#account').val()) > 0) {
					$('#account').val(Number($('#account').val()) - 1)
					$('#total-price').html(${vo.price} * $('#account').val());
				}
			});
		});
	</script>
</head>
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

수량 : <span class="product_count_item inumber-decrement" id="plus"><input type="button" value="+"></span>
	  <input class="product_count_item input-number" type="text" value="1" id="account">
	  <span class="product_count_item number-increment" id="minus"><input type="button" value="-"></span>
금액 : <span id="total-price"></span>

<br><br>

<input type="button" value="장바구니 담기">
<input type="button" value="바로구매">

</body>
</html>