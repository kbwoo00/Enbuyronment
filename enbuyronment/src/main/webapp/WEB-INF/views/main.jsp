<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">
<%@include file="/WEB-INF/views/include/css.jsp" %>
<style type="text/css">
	.product-img {
		width: 300px;
		height: 300px;
		position: relative;
	}
	
	.product-img img {
		width: 100%;
		height: 100%;
		position: absolute;
		top: 0;
		left: 0;
	}
	
	 #slider {
        width: 100%;
        height: 100%;
        overflow: hidden;
        white-space: nowrap;
        box-sizing: border-box;
      }
      #slider > li {
        width: 100%;
        height: 100%;

        position: relative;
        display: inline-block;
        overflow: hidden;
        font-size: 15px;
        font-size: initial;
        line-height: normal;
        transition: all 0.5s cubic-bezier(0.4, 1.3, 0.65, 1); /* Slide css animation */
        background-size: cover;
        vertical-align: top;
        box-sizing: border-box;
        white-space: normal;
      }
     
</style>
</head>
<%@include file="/WEB-INF/views/include/header.jsp" %>

<body>
	<main>
		<!-- slider Area Start -->
        <div class="slider-area ">
            <div class="mainImg-area">
                <div class="mainimg-Box">
                	<div class="owl-nav">
                        <ul id="slider">
					      <li>
					          <img src="/resources/img/enb-mainimg.jpg" alt="mainImg">
					      </li>
					      <li>
					          <img src="/resources/img/enb-mainimg2.jpg" alt="mainImg">
					      </li>
					      <li>
					        <img src="/resources/img/enb-mainimg3.jpg" alt="mainImg">
					      </li>
					    </ul>
                	</div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
	
		<!-- Latest Products Start -->
		<section class="latest-product-area" style="width:97vw !important;">
			<div class="container" style="margin-top:8rem; text-align:center;">
				<div class="row product-btn d-flex justify-content-end align-items-end" style="margin-bottom:43px !important;">
					<!-- Section Tittle -->
					<div class="col-xl-4 col-lg-5 col-md-5">
						<div class="mb-30" style="text-align:left; padding-left:2rem;">
							<h2>New Products</h2>
						</div>
					</div>
					<div class="col-xl-8 col-lg-7 col-md-7">
						<div class="properties__button f-right">
							<!--Nav Button  -->
							<nav>
								<div class="nav nav-tabs" id="nav-tab" role="tablist">
									<c:forEach var="brandName" items="${brand }">
										<a class="nav-item nav-link" data-toggle="tab" href="" role="tab" aria-selected="false">${brandName }</a>
			                        </c:forEach>
								</div>
							</nav>
							<!--End Nav Button  -->
						</div>
					</div>
				</div>
				<!-- Nav Card -->
				<div class="tab-content" id="nav-tabContent">
					<!-- card one -->
					<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="row" id="mainProd"></div>
					</div>
				</div>
				<!-- End Nav Card -->
			</div>
		</section>
		<!-- Latest Products End -->
	</main>
   
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>
</body>

<script src="https://kit.fontawesome.com/58cff89876.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	var msg = '${msg }'
	if (msg == 'success') {
		alert('로그인 되었습니다.');
	}
	
	$(document).ready(function() {
		$('.nav-item').first().addClass('active');
		$('.nav-item').first().attr('aria-selected','true');
		
		function listCall(brandVal) {
			$('#mainProd').empty();
			
			$.ajax({
				url: '/mainProd',
				type: 'post',
				data: {
					'brand' : brandVal
				},
				dataType: 'json',
				success: function(data) {
					$.each(data, function(index,item) {
						if(item.star == null) {
							item.star = 0;
						}
						
						$('#mainProd').append("<div class='col-xl-4 col-lg-4 col-md-9 justify-content-center' style='display:flex;'>"+
							             "<div class='single-product mb-6'>"+
							             "<a href='/product/"+item.prodNo+"'>"+
									        "<div class='product-img'><img class='img-thumbnail' src='../upload/"+item.thumb+"'></div>"+
									        "<div class='product-caption'>"+
									            "<div class='product-ratting'>"+
									                "<i class='fa-solid fa-star'></i><i class='far'>"+item.star+"</i></div>"+
									            "<h6>["+item.brandName+"] "+item.prodName+"</h6>"+
									            "<h6>"+item.price.toLocaleString()+"원</h6><div><div><div>");
						
					});
				}
			});
		}
		
		//페이지 로딩 시
		listCall('동구밭');
		
		//브랜드 클릭 시
		$('.nav-link').click(function() {
			listCall($(this).text());
		});
	});
	
	
	 // 메인 슬라이드
    const slideDelay = 5000;

    const dynamicSlider = document.getElementById("slider");

    var curSlide = 0;
    window.setInterval(()=>{
      curSlide++;
      if (curSlide === dynamicSlider.childElementCount) {
        curSlide = 0;
      }

      // Actual slide
      dynamicSlider.firstElementChild.style.setProperty("margin-left", "-" + curSlide + "00%");
    }, slideDelay);

</script>
</html>