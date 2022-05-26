<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
	.fa-star{
		color: #ffd400;
		cursor: pointer;
	}

</style>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<!-- Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="/resources/img/loading.png" alt="loding_logo">
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->

	<!-- sidebar include조각으로 넣어주기 -->
	<div class="container justify-content-center mt-5">
		<%@include file="/WEB-INF/views/include/mypage_navbar.jsp"%>

		<div class="row justify-content-around mt-5">
			<div class="col-md-2 mt-5">
				<%@include file="/WEB-INF/views/include/mypage_sidebar.jsp"%>
			</div>
			<div class="col-md-8">
				<div class="card mb-4 rounded-3 shadow-sm">
					<div class="card-header py-3">
						<h3 class="my-0 fw-normal">상품 리뷰 수정하기</h3>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-auto">
								<img alt="#" src="/upload/${review.thumb }" class="img-thumbnail" style="max-width: 200px; max-height: 200px;">
							</div>
							<div class="col-md-5">
								<h4 class="mb-5">${review.prodName }</h4>
								
								<c:choose>
					          		<c:when test="${review.star == 0 }">
						          		<a><i id="star0" class='fa-regular fa-star fa-2x'></i></a>
						          		<a><i id="star1" class='fa-regular fa-star fa-2x'></i></a>
						          		<a><i id="star2" class='fa-regular fa-star fa-2x'></i></a>
						          		<a><i id="star3" class='fa-regular fa-star fa-2x'></i></a>
						          		<a><i id="star4" class='fa-regular fa-star fa-2x'></i></a>
					          		</c:when>
					          		<c:when test="${review.star == 1 }">
					          			<a><i id="star0" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star1" class='fa-regular fa-star fa-2x'></i></a>
						          		<a><i id="star2" class='fa-regular fa-star fa-2x'></i></a>
						          		<a><i id="star3" class='fa-regular fa-star fa-2x'></i></a>
						          		<a><i id="star4" class='fa-regular fa-star fa-2x'></i></a>
					          		</c:when>
					          		<c:when test="${review.star == 2 }">
					          			<a><i id="star0" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star1" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star2" class='fa-regular fa-star fa-2x'></i></a>
						          		<a><i id="star3" class='fa-regular fa-star fa-2x'></i></a>
						          		<a><i id="star4" class='fa-regular fa-star fa-2x'></i></a>
					          		</c:when>
					          		<c:when test="${review.star == 3 }">
					          			<a><i id="star0" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star1" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star2" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star3" class='fa-regular fa-star fa-2x'></i></a>
						          		<a><i id="star4" class='fa-regular fa-star fa-2x'></i></a>
					          		</c:when>
					          		<c:when test="${review.star == 4 }">
					          			<a><i id="star0" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star1" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star2" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star3" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star4" class='fa-regular fa-star fa-2x'></i></a>
					          		</c:when>
					          		<c:when test="${review.star == 5 }">
					          			<a><i id="star0" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star1" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star2" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star3" class='fa-solid fa-star fa-2x'></i></a>
						          		<a><i id="star4" class='fa-solid fa-star fa-2x'></i></a>
					          		</c:when>
					          	</c:choose>
								<br><br>
								
								<strong>작성일 : <fmt:formatDate value="${review.regdate }" pattern="yyyy-MM-dd"/></strong>
							</div>
						</div>
						<label class="form-label col-md-2 mt-3">한줄평</label>
						<div class="row justify-content-center mb-3">
							<input id="comment" class="form-control col-md-11" value="${review.comment }">
						</div>
						<div class="row mt-3 justify-content-center mb-3">
							<input id="modBtn" type="button" class="btn enb-loginBtn" value="리뷰 수정하기">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			// 별점 클릭시 색칠
			$('.fa-star').each(function(index, item) {
				$(item).click(function() {
					$('.fa-star').removeClass('fa-solid');
					$('.fa-star').addClass('fa-regular');
					for(let i = 0; i <= index; i++){
						$('#star' + i).addClass('fa-solid');
						$('#star' + i).removeClass('fa-regular');
					}
				});
			});
			
			$('#modBtn').click(function() {
				if(confirm('이대로 수정하시겠습니까?')){
					if($('#comment').val() == ''){
						alert('한줄평을 작성해주세요!');
						return;
					}
					
					let star = 0;
					$('.fa-star').each(function(index, item) {
						if($(item).hasClass('fa-solid')){
							star++;
						}
					});
					console.log(star);
					
					$.ajax({
					      url: "/mypage/review/${review.reviewNo}/update",
					      type: "post",
					      contentType: "application/json; charset=utf-8",
					      data: JSON.stringify({
					    	  'star': star,
					    	  'comment': $('#comment').val()
					      }),
					      success: function () {
					    	  location.replace('/mypage/review');
					      }
				    });
				}
				
			});
		});
	</script>
	
	<script src="https://kit.fontawesome.com/58cff89876.js" crossorigin="anonymous"></script>
</body>
</html>