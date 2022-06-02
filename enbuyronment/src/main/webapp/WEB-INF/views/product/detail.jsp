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
.owl-carousel {
	z-index: auto !important;
}

.nav-link {
	color: black;
	width: 50%;
}

.enb-active {
	background: #86a688;
	color: white;
}

.fa-star {
	color: #ffd400;
}

.btn {
	height: 20px;
}

.owl-prev:hover, .owl-next:hover {
	background-color: #86a688 !important;
	backgroud: #86a688 !important;
}

#toCartBtn, modProd {
	margin-right: 20px;
}

.card_area .product_count {
	border: 1px solid #86a688 !important;
}

.card_area .product_count input {
	background-color: #86a688 !important;
	border: 1px solid #86a688 !important;
}

#soldoutBtn {
	cursor: default;
}
</style>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<main>
		<div class="product_image_area mb-5">
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
						<c:if test="${sessionScope.mode eq 'adminMode' }">
									<div class="row justify-content-around mt-5">
										<div class="col-md-auto">
											<input type="button" value="상품 수정" id="modProd"
											class="btn enb-loginBtn">
										</div>
										<div class="col-md-auto">
											<input type="button"
												value="상품 삭제" id="delProd" class="btn enb-loginBtn">
										</div>
									</div>
								</c:if>
					</div>
					<div class="col-md-6">
						<div class="text-center">
							<h2>[${vo.brandName }] ${vo.prodName }</h2>
							<h3>#${vo.cateName }</h3>
							<hr>

							<p>
								배송기간 : 평균 3~5일 이내 <br> 배송비 : 2,000원 <br> (20,000원 이상
								무료배송)
							</p>
							<div class="card_area">
								<div class="row justify-content-center">
									<div class="col-md-auto">
										<span>수량</span>
										<div class="product_count_area mt-2 mb-4">
											<div class="product_count d-inline-block">
												<span
													class="product_count_item inumber-decrement amount-btn">
													<i class="ti-minus amount-btn"></i>
												</span> <input class="product_count_item input-number" type="text"
													value="1" min="0" max="10" id="amount"> <span
													class="product_count_item number-increment amount-btn">
													<i class="ti-plus amount-btn"></i>
												</span>
											</div>
										</div>
										<span>가격 : ${vo.price }</span><br> <span id="totalPrice">총
											가격 : ${vo.price }</span>
									</div>
								</div>

								<div class="mt-5 row justify-content-between">
									<div class="col"
										style="display: flex; justify-content: center;">
										<c:choose>
											<c:when test="${vo.stock eq 0 }">
												<input type="button" class="btn enb-loginBtn"
													id="soldoutBtn" disabled value="일시품절">
											</c:when>
											<c:otherwise>
												<input type="button" id="toCartBtn" class="btn enb-loginBtn"
													value="장바구니 담기">
												<div id="heartArea"></div>
											</c:otherwise>
										</c:choose>
									</div>
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
					<a class="nav-link text-center border enb-active"
						href="javascript:void(0);" aria-current="page" id="prodScriptBtn">
						상품상세 </a> <a class="nav-link text-center border"
						href="javascript:void(0);" aria-current="page" id="reviewBtn">
						리뷰 </a>
				</nav>
				<div class="mt-5" id="content">
					<div class="row justify-content-center">
						<img src="../upload/${vo.script }">
					</div>
				</div>
			</div>

		</div>

		<hr>
	</main>
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
		        reviewBtn.addClass("enb-active");
		        prodScriptBtn.removeClass("enb-active");
		        if (result.reviewList.length != 0) {
		          content.html(
		            "<h2 class='text-center mb-4' id='reviewTitle'>리뷰</h2><ul id='reviewList' class='list-group list-group-flush'></ul>" +
		              "<div class='row justify-content-center'>" +
		              "<nav class='blog-pagination d-flex'>" +
		              "<ul class='pagination'>"
		          );

		          for (let i = 0; i < result.reviewList.length; i++) {
		            var starEmpty = "<i class='fa-regular fa-star'></i>";
		            var starFill = "<i class='fa-solid fa-star'></i>";
		            if (Number(result.reviewList[i].star) == 0) {
		              var starImg =
		                starEmpty + starEmpty + starEmpty + starEmpty + starEmpty;
		            } else if (Number(result.reviewList[i].star) == 1) {
		              var starImg =
		                starFill + starEmpty + starEmpty + starEmpty + starEmpty;
		            } else if (Number(result.reviewList[i].star) == 2) {
		              var starImg =
		                starFill + starFill + starEmpty + starEmpty + starEmpty;
		            } else if (Number(result.reviewList[i].star) == 3) {
		              var starImg =
		                starFill + starFill + starFill + starEmpty + starEmpty;
		            } else if (Number(result.reviewList[i].star) == 4) {
		              var starImg =
		                starFill + starFill + starFill + starFill + starEmpty;
		            } else {
		              var starImg =
		                starFill + starFill + starFill + starFill + starFill;
		            }

		            var regdate = new Date(result.reviewList[i].regdate);
		            regdate =
		              regdate.getFullYear() +
		              "." +
		              regdate.getMonth() +
		              "." +
		              regdate.getDate();

		            $("#reviewList").append(
		              "<li class='list-group-item'>" +
		                "<div class='d-flex w-60 justify-content-between'>" +
		                "<div>" +
		                "<div>" +
		                starImg +
		                "</div><p class='fw-bold'>" +
		                result.reviewList[i].comment +
		                "</p></div><div><div><small>" +
		                regdate +
		                "</small></div><div><small>" +
		                result.reviewList[i].uid +
		                "</small></div></div></div>" +
		                "</li>"
		            );
		          }
		        } else {
		          content.html(
		            "<h2 class='text-center mb-4' id='reviewTitle'>리뷰</h2><p class='text-center mt-4'>등록된 리뷰가 없습니다.</p>" +
		              "<div class='row justify-content-center'>" +
		              "<nav class='blog-pagination d-flex'>" +
		              "<ul class='pagination'>"
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
		        prodScriptBtn.addClass("enb-active");
		        reviewBtn.removeClass("enb-active");
		        content.html(
		          "<div class='row justify-content-center'><img src='../upload/" +
		            script +
		            "'></div>"
		        );
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
		    if (!isNaN(amount.val())) {
		      if (uid == '') {
		        if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
		          location.href = "/user/login?redirectUrl=" + location.pathname;
		        }
		        return;
		      }

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
		        	if(confirm('장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?')){
		        		location.href='/cart/view';
		        	} else{
		         	 amount.val(1);
		        	}
		        },
		        error: function () {
		          if (confirm("회원만 가능한 서비스입니다. 로그인 하시겠습니까?")) {
		            location.href = "/user/login";
		          }
		        },
		      });
		    } else {
		      alert("수량은 숫자로 입력해주세요");
		    }
		  });

		  // 총 가격 계산
		  var originPrice = "${vo.price }";
		  var totalPrice = $("#totalPrice");
		  var amountBtn = $(".amount-btn");

		  amountBtn.click(function () {
		    totalPrice.text("총 가격 : " + originPrice * amount.val());
		  });

		  // 관심 목록에 추가
		  var heartArea = $("#heartArea");
		  var isHeart = "${isHeart}";

		  if (uid == "") {
		    heartArea.html(
		      "<input type='button' class='btn enb-whiteBtn heart-btn' value='관심상품 추가'>"
		    );
		  } else {
		    if (isHeart == "true") {
		      heartArea.html(
		        "<input type='button' class='btn enb-whiteBtn heart-btn active' value='관심상품 제거'>"
		      );
		    } else {
		      heartArea.html(
		        "<input type='button' class='btn enb-whiteBtn heart-btn' value='관심상품 추가'>"
		      );
		    }
		  }

		  var heartBtn = $(".heart-btn");

		  heartBtn.click(function () {
		    if (uid == "") {
		      if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
		        location.href = "/user/login?redirectUrl=" + location.pathname;
		      }
		      return;
		    }
		    if (heartBtn.hasClass("active")) {
		      $.ajax({
		        url: "/heart/delProd",
		        type: "post",
		        contentType: "application/json; charset=utf-8",
		        data: JSON.stringify({
		          uid: uid,
		          prodNo: prodNo,
		        }),
		        success: function () {
		          heartBtn.removeClass("active");
		          heartBtn.val("관심상품 추가");
		        },
		      });
		    } else {
		      $.ajax({
		        url: "/heart/addProd",
		        type: "post",
		        contentType: "application/json; charset=utf-8",
		        data: JSON.stringify({
		          uid: uid,
		          prodNo: prodNo,
		        }),
		        success: function () {
		          heartBtn.addClass("active");
		          heartBtn.val("관심상품 제거");
		        },
		      });
		    }
		  });
		});

	</script>
	<script src="https://kit.fontawesome.com/58cff89876.js"
		crossorigin="anonymous"></script>
</body>
</html>