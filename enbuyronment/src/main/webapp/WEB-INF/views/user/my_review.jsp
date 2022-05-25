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
		
		<div class="row justify-content-between mt-5">
			<div class="col-md-2 mt-5">
				<%@include file="/WEB-INF/views/include/mypage_sidebar.jsp"%>
			</div>
			<div class="col-md-8">
		  		<div class="d-flex flex-column align-items-stretch flex-shrink-0">
				  	<h3>내가 쓴 리뷰 목록</h3>
				  	<div class="border-bottom"></div>
				  	<c:choose>
				  		<c:when test="${reviewList.size() == 0}">
				  			<h4>작성한 리뷰가 없습니다.</h4>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach var="review" items="${reviewList }" varStatus="status">
				  				<div class="list-group list-group-flush border-bottom scrollarea mt-3">
							        <div class="d-flex w-100 align-items-center justify-content-between">
							        	<div class="col-md-8 mb-3">
							        		<a href="/product/${review.prodNo }">
							        			<img alt="#" src="../upload/${review.thumb }" style="width: 70px; height: 70px;">
								          		<div class="mb-1 text-truncate" style="color: black; font-weight: bold; ">${review.prodName }</div>
							        		</a>
						        		</div>
							          <div class="col-sm-3">
							          	<div>
								          	<c:choose>
								          		<c:when test="${review.star == 0 }">
								          		<i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i>
								          		</c:when>
								          		<c:when test="${review.star == 1 }">
								          		<i class='fa-solid fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i>
								          		</c:when>
								          		<c:when test="${review.star == 2 }">
								          		<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i>
								          		</c:when>
								          		<c:when test="${review.star == 3 }">
								          		<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i>
								          		</c:when>
								          		<c:when test="${review.star == 4 }">
								          		<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-regular fa-star'></i>
								          		</c:when>
								          		<c:when test="${review.star == 5 }">
								          		<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i>
								          		</c:when>
								          	</c:choose>
							          	</div>
								          <small class="text-muted">
								          	<fmt:formatDate value="${review.regdate }" pattern="yyyy-MM-dd"/>
								          </small>
							          </div>
							        </div>
							        <div class="col-10 mb-1">
							        	<p>한줄평</p>
									</div>
									<div class="d-flex w-100 align-items-center justify-content-end mb-3">
										<div class="col-md-3">
											<div class="row justify-content-around">
												<input type="hidden" id="reviewNo${status.count }" value="${review.reviewNo }">
												<input type="button" class="btn enb-loginBtn" id="modBtn${status.count }" value="수정" style="padding: 1.3rem 1.3rem !important;">
												<input type="button" class="btn enb-loginBtn" id="delBtn${status.count }" value="삭제" style="padding: 1.3rem 1.3rem !important;">
											</div>
										</div>
									</div>
					    		</div>
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>
			  </div>
			  <!-- 페이지 버튼 그룹 -->
			  <div class="row justify-content-center">
				<nav class="blog-pagination d-flex"
					aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${pageInfo.prev }">
							<li class="page-item"><a class="page-link"
								href="/mypage/review?page=${pageInfo.startPage - 1}"
								aria-label="Previous"> <i class="ti-angle-left"></i>
							</a></li>
						</c:if>
						<c:forEach begin="${pageInfo.startPage }"
							end="${pageInfo.endPage }" var="i">
							<c:choose>
								<c:when test="${i == presentPage }">
									<li class="page-item active"><a class="page-link "
										href="/mypage/review?page=${i }">${i }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link active"
										href="/mypage/review?page=${i }">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageInfo.next && pageInfo.endPage > 0  }">
							<li class="page-item"><a class="page-link"
								href="/mypage/review?page=${pageInfo.endPage + 1}"
								aria-label="Next"> <i class="ti-angle-right"></i>
							</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- 페이지 버튼 그룹 -->
		</div>
	</div>
</div>
			

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>
	
	<script type="text/javascript">
	$(document).ready(function () {
		let reviewLength = ${reviewList.size() };
		for(let i = 1; i < reviewLength; i++){
			$('#delBtn' + i).click(function() {
				if(confirm('정말 리뷰를 삭제하시겠습니까? 재작성은 불가능합니다.')){
					console.log($('#reviewNo' + i).val());
					$.ajax({
					      url: "/mypage/review/delete",
					      type: "post",
					      contentType: "text/plain; charset=utf-8",
					      data: $('#reviewNo' + i).val(),
					      success: function () {
					    	  location.reload();
					      }
				    });
				}
			});
		}
		for(let i = 1; i < reviewLength; i++){
			$('#modBtn' + i).click(function() {
				location.href = "/mypage/review/" + $('#reviewNo' + i).val() + "/update";
			});
		}
		
		
	});
	</script>

	<script src="https://kit.fontawesome.com/58cff89876.js" crossorigin="anonymous"></script>
</body>
</html>