<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="/resources/main/image/x-icon"
	href="/resources/main/img/favicon.ico">
<link rel="stylesheet" href="/resources/product/css/main.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>

	상품명 : ${vo.prodName }
	<br> 가격 : ${vo.price }
	<br> 브랜드 : ${vo.brandName }
	<br> #${vo.cateName }
	<br> 수량 :
	<input class="product_count_item input-number" type="text" value="1"
		id="amount">
	<input type="button" value="장바구니 담기" id="toCartBtn">

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

	<div>
		배송 정보<br> 배송기간 : 평균 3~5일 이내<br> 배송비 : 2,000원 (20,000원 이상
		무료배송)
	</div>

	<hr>
	<header
		class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<div class="btn-group" role="group"
			aria-label="Basic outlined example">
			<button id="prodScriptBtn" type="button" class="btn">상품상세</button>
			<button id="reviewBtn" type="button" class="btn">리뷰</button>
		</div>
	</header>

	<div id="content">
		<img src="../upload/${vo.script }">
	</div>

	<hr>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			var prodScriptBtn = $('#prodScriptBtn');
			var reviewBtn = $('#reviewBtn');
			var content = $('#content');
			var prodNo = "${vo.prodNo}";
			
			const rvDataCnt = 10;
			
			function getReview(page) {
				$.ajax({
					url : "/product/${vo.prodNo}/review",
					type : "post",
					data : JSON.stringify({
						"page" : page,
						"perDataCnt" : rvDataCnt
					}),
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					success : function(result) {
						content.html("<h2 id='reviewTitle'>리뷰</h2><table border='1' id='reviewList'></table>" + 
								"<div class='row justify-content-center'>"+  
								"<nav class='blog-pagination d-flex'>" + "<ul class='pagination'>");
						
						for(let i = 0; i < result.reviewList.length; i++){
							$('#reviewList').append(
									"<tr><td>" + result.reviewList[i].uid + "</td><td>" + result.reviewList[i].star + "</td><td>" +
									result.reviewList[i].comment + "</td><td>" + result.reviewList[i].regdate + "</td></tr>"
									);
						};
						
						// prev 버튼
						if(result.pageInfo.prev){
							$('.pagination').append("<li class='page-item'><button type='button' id='prevBtn' class='page-link' value='"+ (result.pageInfo.startPage - 1) +"'>" + 
							"<i class='ti-angle-left'></i></button></li>"
							);
						}
						
						// 숫자 버튼들
						for(let i = result.pageInfo.startPage; i <= result.pageInfo.endPage; i++){
							if(i == result.pageInfo.cri.page){
								$('.pagination').append(
										"<li class='page-item active'><button type='button' class='page-link'"+ 
										"value='"+ i + "'>" + i + "</button></li>"
								);
							} else{
								$('.pagination').append(
										"<li class='page-item'><button type='button' class='page-item-btn page-link'"+ 
										"value='"+ i + "'>" + i + "</button></li>"
								);
							}
						}
						
						// next 버튼 pageInfo.next && pageInfo.endPage > 0
						if(result.pageInfo.next && result.pageInfo.endPage > 0){
							$('.pagination').append("<li class='page-item'><button type='button' id='nextBtn' class='page-link' value = '"+ (result.pageInfo.endPage + 1) + "'>" + 
									"<i class='ti-angle-right'></i></button></li>"
									);
						}
						
						var reviewTitle = $('#reviewTitle');
						
						// 이전버튼 클릭시 ajax
						$('#prevBtn').click(function() {
							var prevPage = $('#prevBtn').val();
							getReview(prevPage);
							reviewTitle[0].scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});
						});
						
						// 숫자버튼 클릭시 ajax
						$('.page-item-btn').each(function(i, element) {
							$(this).click(function() {
								getReview($(this).val());
							});
							reviewTitle[0].scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});
						})
						
						// 다음버튼 클릭시 ajax
						$('#nextBtn').click(function() {
							console.log($('#nextBtn').val());
							var nextPage = $('#nextBtn').val();
							getReview(nextPage);
							reviewTitle[0].scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});
						});
					}
				});
			}
		
			$('#modProd').click(function() {
				location.href = '/product/${vo.prodNo}/update';
			});

			$('#delProd').click(function() {
				if (confirm('상품을 삭제하시겠습니까?')) {
					location.href = '/product/${vo.prodNo}/delete';
				}
			});
			
			// 상품상세 
			prodScriptBtn.click(function() {
				$.ajax({
					url : "/product/${vo.prodNo}/script",
					type : "post",
					contentType: "text/html; charset=utf-8",
					success : function(script) {
						content.html("<img src='../upload/" + script + "'>");
					}
				});
			});
			
			// 리뷰
			reviewBtn.click(function() {
				getReview();
			});
			
			var toCartBtn = $('#toCartBtn');
			var amount = $('#amount');
			var uid = "${sessionScope.userId}";
			
			// 장바구니에 상품 담기
			toCartBtn.click(function() {
				$.ajax({
					url : '/cart/addProduct',
					type : 'post',
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify({
						"uid" : uid,
						"prodNo" : prodNo,
						"amount" : amount.val()
					}),
					success : function() {
						alert('장바구니에 상품이 담겼습니다.');
					}
				});
			});
		});
		
		
		
	</script>
</body>
</html>