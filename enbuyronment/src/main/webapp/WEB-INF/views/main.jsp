<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
</head>
<%@include file="/WEB-INF/views/include/header.jsp" %>

<body>
	<!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="/resources/img/loading.png" alt="loding_logo"> 
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

	<main>
		<!-- slider Area Start -->
        <div class="slider-area ">
            <div class="mainImg-area">
                <div class="mainimg-Box">
                    <a href="#">
                        <img src="/resources/img/enb-mainimg.jpg" alt="mainImg">
                    </a>
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
									<a class="nav-item nav-link active" data-toggle="tab" href="#nav-home" role="tab" aria-selected="true">동구밭</a>
									<a class="nav-item nav-link" data-toggle="tab" href="#nav-profile" role="tab" aria-selected="false">톤28</a>
									<a class="nav-item nav-link" data-toggle="tab" href="#nav-contact" role="tab" aria-selected="false">슈가랩몰</a>
									<a class="nav-item nav-link" data-toggle="tab" href="#nav-last" role="tab" aria-selected="false">자연상점</a>
									<a class="nav-item nav-link" data-toggle="tab" href="#nav-last" role="tab" aria-selected="false">더피커</a>
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
						<div class="row">
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/assets/img/categori/product1.png" style="width:20rem; height:20rem;">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star low-star"></i>
											<i class="far fa-star low-star"></i>
										</div>
										<h4>
											<a href="#">Green Dress with details</a>
										</h4>
										<div class="price">
											<ul>
												<li>$40.00</li>
												<li class="discount">$60.00</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
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

	<script type="text/javascript">
		var msg = '${msg }'
		if (msg == 'success') {
			alert('로그인 되었습니다.');
		}
	</script>
</body>
</html>