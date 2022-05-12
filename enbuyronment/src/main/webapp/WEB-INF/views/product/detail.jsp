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
<link rel="stylesheet" href="/resources/product/css/main.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>

상품명 : ${vo.prodName }<br>
가격 : ${vo.price }<br>
브랜드 : ${vo.brandName }<br>
#${vo.cateName }<br>
수량 : <input class="product_count_item input-number" type="text" value="1" id="amount">
<input type="button" value="장바구니 담기" id="toCart">

<hr>

<input type="button" value="상품 수정" id="modProd">
<input type="button" value="상품 삭제" id="delProd">

<hr>

<img src="../upload/${vo.thumb }">

<c:if test="${vo.prodImg2 ne '' }">
	<img src="../upload/${vo.prodImg2 }">
</c:if>
<c:if test="${vo.prodImg3 ne '' }">
	<img src="../upload/${vo.prodImg3 }">
</c:if>
<c:if test="${vo.prodImg4 ne '' }">
	<img src="../upload/${vo.prodImg4 }">
</c:if>

<hr>

<div>배송 정보<br>
	배송기간 : 평균 3~5일 이내<br>
	배송비 : 2,000원 (20,000원 이상 무료배송)</div>

<hr>

<img src="../upload/${vo.script }">

<hr>

<div>리뷰</div>
<table border="1">
	<c:forEach var="rv" items="${reviewList }">
		<tr><td>${rv.uid }</td><td>${rv.star }</td><td>${rv.comment }</td><td>${rv.regdate }</td></tr>
	</c:forEach>
</table>

<div class="row justify-content-center">
	<nav class="blog-pagination d-flex"
		aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${pageInfo.prev }">
				<li class="page-item">
					<a class="page-link" href="/product/${vo.prodNo }?page=${pageInfo.startPage - 1}" aria-label="Previous">
						<i class="ti-angle-left"></i>
					</a>
				</li>
			</c:if>
			<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
				<c:choose>
					<c:when test="${i == presentPage }">
						<li class="page-item active">
							<a class="page-link" href="/product/${vo.prodNo }?page=${i }">${i }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link active" href="/product/${vo.prodNo }?page=${i }">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageInfo.next && pageInfo.endPage > 0  }">
				<li class="page-item">
					<a class="page-link" href="/product/${vo.prodNo }?page=${pageInfo.endPage + 1}" aria-label="Next">
						<i class="ti-angle-right"></i>
					</a>
				</li>
			</c:if>
		</ul>
	</nav>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@include file="/WEB-INF/views/include/script.jsp"%>
<%@include file="/WEB-INF/views/include/header_script.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		$('#modProd').click(function() {
			location.href = '/product/${vo.prodNo}/update';
		});
		
		$('#delProd').click(function() {
			if(confirm('상품을 삭제하시겠습니까?')) {
				location.href = '/product/${vo.prodNo}/delete';
			}
		});
		
	});
</script>
</body>
</html>