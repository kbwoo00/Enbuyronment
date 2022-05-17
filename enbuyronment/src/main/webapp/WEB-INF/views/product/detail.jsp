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
<style type="text/css">
	.nav-link{
		color: black;
		width: 50%;
	}
</style>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<div class="product_image_area">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="product_img_slide owl-carousel">
						<div class="single_product_img">
							<img src="../upload/${vo.thumb }" alt="#" class="img-fluid">
						</div>
						<c:if test="${vo.prodImg2 ne '' }">
							<div class="single_product_img">
								<img src="../upload/${vo.prodImg2 }" alt="#" class="img-fluid">
							</div>
						</c:if>
						<c:if test="${vo.prodImg3 ne '' }">
							<div class="single_product_img">
								<img src="../upload/${vo.prodImg3 }" alt="#" class="img-fluid">
							</div>
						</c:if>
						<c:if test="${vo.prodImg4 ne '' }">
							<div class="single_product_img">
								<img src="../upload/${vo.prodImg4 }" alt="#" class="img-fluid">
							</div>
						</c:if>
					</div>
				</div>
				<div class="col-md-6">
					<div class="single_product_text text-center">
						<h3>[${vo.brandName }] ${vo.prodName }</h3>
						<h4>#${vo.cateName }</h4>
						<hr>
						<p>
							배송 정보 배송기간 : 평균 3~5일 이내 <br> 배송비 : 2,000원 <br> (20,000원
							이상 무료배송)
						</p>
						<div class="card_area">
							<div class="row justify-content-center">
								<div class="col-md-auto">
									<span>수량</span>
									<div class="product_count_area mt-2 mb-4">
										<div class="product_count d-inline-block">
											<span class="product_count_item inumber-decrement"> <i
												class="ti-minus"></i></span> <input
												class="product_count_item input-number" type="text"
												value="1" min="0" max="10" id="amount"> <span
												class="product_count_item number-increment"> <i
												class="ti-plus"></i></span>
										</div>
									</div>
									<span>가격 : ${vo.price }</span>
								</div>
							</div>

							<div class="mt-5">
								<input type="button" value="장바구니 담기" id="toCartBtn"
									class="btn enb-loginBtn">
							</div>

							<div class="row justify-content-center mt-5">
								<input type="button" value="상품 수정" id="modProd"
									class="btn enb-loginBtn"> <input type="button"
									value="상품 삭제" id="delProd" class="btn enb-loginBtn">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="product_script_area">
		<div class="container">
			<nav class="nav nav-pills nav-fill justify-content-center">
				<a class="nav-link text-center border active" href="javascript:void(0);" aria-current="page" id="prodScriptBtn">
					상품상세 </a> <a class="nav-link text-center border" href="javascript:void(0);" aria-current="page"
					id="reviewBtn"> 리뷰 </a>
			</nav>
			<div id="content">
				<img src="../upload/${vo.script }">
			</div>
		</div>

	</div>

	<hr>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

	<script type="text/javascript">
		$(document).ready(function () {
			  var prodScriptBtn = $("#prodScriptBtn");
			  var reviewBtn = $("#reviewBtn");
			  var content = $("#content");
			  var prodNo = "${vo.prodNo}";
	
			  const rvDataCnt = 10;
	
			  function getReview(page) {
			    $.ajax({
			      url: "/product/${vo.prodNo}/review",
			      type: "post",
			      data: JSON.stringify({
			        page: page,
			        perDataCnt: rvDataCnt,
			      }),
			      dataType: "json",
			      contentType: "application/json; charset=utf-8",
			      success: function (result) {
			        content.html(
			          "<h2 class='text-center mb-4 mt-4' id='reviewTitle'>리뷰</h2><ul id='reviewList' class='list-group list-group-flush'></ul>" +
			            "<div class='row justify-content-center'>" +
			            "<nav class='blog-pagination d-flex'>" +
			            "<ul class='pagination'>"
			        );
			        reviewBtn.addClass('active');
			        prodScriptBtn.removeClass('active');
	
			        for (let i = 0; i < result.reviewList.length; i++) {
			          $("#reviewList").append(
			            "<li class='list-group-item'>" +
			            "<div class='d-flex w-100 justify-content-between'>" + 
			              result.reviewList[i].comment + "<small>" +
			              result.reviewList[i].uid + "</small><small>" + 
			              result.reviewList[i].star + "</small><small>" + 
			              result.reviewList[i].regdate + "</small></div>" +
			              "</li>"
			          );
			        }
			        // prev 버튼
			        if (result.pageInfo.prev) {
			          $(".pagination").append(
			            "<li class='page-item'><button type='button' id='prevBtn' class='page-link' value='" +
			              (result.pageInfo.startPage - 1) +
			              "'>" +
			              "<i class='ti-angle-left'></i></button></li>"
			          );
			        }
	
			        // 숫자 버튼들
			        for (
			          let i = result.pageInfo.startPage;
			          i <= result.pageInfo.endPage;
			          i++
			        ) {
			          if (i == result.pageInfo.cri.page) {
			            $(".pagination").append(
			              "<li class='page-item active'><button type='button' class='page-link'" +
			                "value='" +
			                i +
			                "'>" +
			                i +
			                "</button></li>"
			            );
			          } else {
			            $(".pagination").append(
			              "<li class='page-item'><button type='button' class='page-item-btn page-link'" +
			                "value='" +
			                i +
			                "'>" +
			                i +
			                "</button></li>"
			            );
			          }
			        }
	
			        // next 버튼 pageInfo.next && pageInfo.endPage > 0
			        if (result.pageInfo.next && result.pageInfo.endPage > 0) {
			          $(".pagination").append(
			            "<li class='page-item'><button type='button' id='nextBtn' class='page-link' value = '" +
			              (result.pageInfo.endPage + 1) +
			              "'>" +
			              "<i class='ti-angle-right'></i></button></li>"
			          );
			        }
	
			        var reviewTitle = $("#reviewTitle");
	
			        // 이전버튼 클릭시 ajax
			        $("#prevBtn").click(function () {
			          var prevPage = $("#prevBtn").val();
			          getReview(prevPage);
			          reviewTitle[0].scrollIntoView({
			            behavior: "smooth",
			            block: "center",
			            inline: "nearest",
			          });
			        });
	
			        // 숫자버튼 클릭시 ajax
			        $(".page-item-btn").each(function (i, element) {
			          $(this).click(function () {
			            getReview($(this).val());
			          });
			          reviewTitle[0].scrollIntoView({
			            behavior: "smooth",
			            block: "center",
			            inline: "nearest",
			          });
			        });
	
			        // 다음버튼 클릭시 ajax
			        $("#nextBtn").click(function () {
			          console.log($("#nextBtn").val());
			          var nextPage = $("#nextBtn").val();
			          getReview(nextPage);
			          reviewTitle[0].scrollIntoView({
			            behavior: "smooth",
			            block: "center",
			            inline: "nearest",
			          });
			        });
			      },
			    });
			  }
	
			  $("#modProd").click(function () {
			    location.href = "/product/${vo.prodNo}/update";
			  });
	
			  $("#delProd").click(function () {
			    if (confirm("상품을 삭제하시겠습니까?")) {
			      location.href = "/product/${vo.prodNo}/delete";
			    }
			  });
	
			  // 상품상세
			  prodScriptBtn.click(function () {
			    $.ajax({
			      url: "/product/${vo.prodNo}/script",
			      type: "post",
			      contentType: "text/html; charset=utf-8",
			      success: function (script) {
			        prodScriptBtn.addClass('active');
			        reviewBtn.removeClass('active');
			        content.html("<img src='../upload/" + script + "'>");
			      },
			    });
			  });
	
			  // 리뷰
			  reviewBtn.click(function () {
			    getReview();
			  });
	
			  var toCartBtn = $("#toCartBtn");
			  var amount = $("#amount");
			  var uid = "${sessionScope.userId}";
	
			  // 장바구니에 상품 담기
			  toCartBtn.click(function () {
			    $.ajax({
			      url: "/cart/addProduct",
			      type: "post",
			      contentType: "application/json; charset=utf-8",
			      data: JSON.stringify({
			        uid: uid,
			        prodNo: prodNo,
			        amount: amount.val(),
			      }),
			      success: function () {
			        alert("장바구니에 상품이 담겼습니다.");
			        amount.val(1);
			      },
			    });
			  });
			});
	</script>
</body>
</html>