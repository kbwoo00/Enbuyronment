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
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">
<!-- Custom CSS -->
<link rel="stylesheet" href="/resources/assets/css/enb-style.css">
<%@include file="/WEB-INF/views/include/css.jsp" %>
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
					<img src="/resources/assets/img/enbuyronment.png">
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
	
		<!-- Category Area Start-->
		<section class="category-area section-padding30">
			<div class="container-fluid">
				<!-- Section Tittle -->
				<div class="row">
					<div class="col-md-12">
						<div class="section-tittle text-center mb-85">
							<h2>Shop by Category</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-4 col-lg-6">
						<div class="single-category mb-30">
							<div class="category-img">
								<img src="/resources/main/img/categori/cat1.jpg">
								<div class="category-caption">
									<h2>Owmen`s</h2>
									<span class="best"><a href="#">Best New Deals</a></span> <span
										class="collection">New Collection</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-lg-6">
						<div class="single-category mb-30">
							<div class="category-img text-center">
								<img src="/resources/main/img/categori/cat2.jpg">
								<div class="category-caption">
									<span class="collection">Discount!</span>
									<h2>Winter Cloth</h2>
									<p>New Collection</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-lg-6">
						<div class="single-category mb-30">
							<div class="category-img">
								<img src="/resources/main/img/categori/cat3.jpg">
								<div class="category-caption">
									<h2>Man`s Cloth</h2>
									<span class="best"><a href="#">Best New Deals</a></span> <span
										class="collection">New Collection</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Category Area End-->
		
		
		
		<!-- Latest Products Start -->
		<section class="latest-product-area padding-bottom">
			<div class="container">
				<div
					class="row product-btn d-flex justify-content-end align-items-end">
					<!-- Section Tittle -->
					<div class="col-xl-4 col-lg-5 col-md-5">
						<div class="section-tittle mb-30">
							<h2>Latest Products</h2>
						</div>
					</div>
					<div class="col-xl-8 col-lg-7 col-md-7">
						<div class="properties__button f-right">
							<!--Nav Button  -->
							<nav>
								<div class="nav nav-tabs" id="nav-tab" role="tablist">
									<a class="nav-item nav-link active" id="nav-home-tab"
										data-toggle="tab" href="#nav-home" role="tab"
										aria-controls="nav-home" aria-selected="true">All</a> <a
										class="nav-item nav-link" id="nav-profile-tab"
										data-toggle="tab" href="#nav-profile" role="tab"
										aria-controls="nav-profile" aria-selected="false">New</a> <a
										class="nav-item nav-link" id="nav-contact-tab"
										data-toggle="tab" href="#nav-contact" role="tab"
										aria-controls="nav-contact" aria-selected="false">Featured</a>
									<a class="nav-item nav-link" id="nav-last-tab"
										data-toggle="tab" href="#nav-last" role="tab"
										aria-controls="nav-contact" aria-selected="false">Offer</a>
								</div>
							</nav>
							<!--End Nav Button  -->
						</div>
					</div>
				</div>
				<!-- Nav Card -->
				<div class="tab-content" id="nav-tabContent">
					<!-- card one -->
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="row">
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product1.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product2.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product3.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product4.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product5.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product6.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
					<!-- Card two -->
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<div class="row">
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product4.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product5.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product6.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="img/categori/product2.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="img/categori/product3.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="img/categori/product1.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
					<!-- Card three -->
					<div class="tab-pane fade" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab">
						<div class="row">
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="img/categori/product2.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product3.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product1.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product4.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product6.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product5.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
					<!-- card foure -->
					<div class="tab-pane fade" id="nav-last" role="tabpanel"
						aria-labelledby="nav-last-tab">
						<div class="row">
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product1.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product2.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product3.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product4.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product5.png">
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
							<div class="col-xl-4 col-lg-4 col-md-6">
								<div class="single-product mb-60">
									<div class="product-img">
										<img src="/resources/main/img/categori/product6.png">
										<div class="new-product">
											<span>New</span>
										</div>
									</div>
									<div class="product-caption">
										<div class="product-ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star low-star"></i>
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
		<!-- Best Product Start -->
		<div class="best-product-area lf-padding">
			<div class="product-wrapper bg-height"
				style="background-image: url(img/ categori/ card.png ')">
				<div class="container position-relative">
					<div class="row justify-content-between align-items-end">
						<div class="product-man position-absolute  d-none d-lg-block">
							<img src="/resources/main/img/categori/card-man.png">
						</div>
						<div class="col-xl-2 col-lg-2 col-md-2 d-none d-block">
							<div class="vertical-text">
								<span>Manz</span>
							</div>
						</div>
						<div class="col-xl-8 col-lg-8">
							<div class="best-product-caption">
								<h2>
									Find The Best Product<br> from Our Shop
								</h2>
								<p>Designers who are interesten creating state ofthe.</p>
								<a href="#" class="black-btn">Shop Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Shape -->
			<div class="shape bounce-animate d-none d-md-block">
				<img src="/resources/main/img/categori/card-shape.png">
			</div>
		</div>
		<!-- Best Product End-->
		<!-- Best Collection Start -->
		<div class="best-collection-area section-padding2">
			<div class="container">
				<div class="row d-flex justify-content-between align-items-end">
					<!-- Left content -->
					<div class="col-xl-4 col-lg-4 col-md-6">
						<div class="best-left-cap">
							<h2>Best Collection of This Month</h2>
							<p>Designers who are interesten crea.</p>
							<a href="#" class="btn shop1-btn">Shop Now</a>
						</div>
						<div class="best-left-img mb-30 d-none d-sm-block">
							<img src="/resources/main/img/collection/collection1.png">
						</div>
					</div>
					<!-- Mid Img -->
					<div class="col-xl-2 col-lg-2 d-none d-lg-block">
						<div class="best-mid-img mb-30 ">
							<img src="/resources/main/img/collection/collection2.png">
						</div>
					</div>
					<!-- Riht Caption -->
					<div class="col-xl-4 col-lg-6 col-md-6">
						<div class="best-right-cap ">
							<div class="best-single mb-30">
								<div class="single-cap">
									<h4>
										Menz Winter<br> Jacket
									</h4>
								</div>
								<div class="single-img">
									<img src="/resources/main/img/collection/collection3.png">
								</div>
							</div>
						</div>
						<div class="best-right-cap">
							<div class="best-single mb-30">
								<div class="single-cap active">
									<h4>
										Menz Winter<br>Jacket
									</h4>
								</div>
								<div class="single-img">
									<img src="/resources/main/img/collection/collection4.png">
								</div>
							</div>
						</div>
						<div class="best-right-cap">
							<div class="best-single mb-30">
								<div class="single-cap">
									<h4>
										Menz Winter<br> Jacket
									</h4>
								</div>
								<div class="single-img">
									<img src="/resources/main/img/collection/collection5.png">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Best Collection End -->
		<!-- Latest Offers Start -->
		<div class="latest-wrapper lf-padding">
			<div class="latest-area latest-height d-flex align-items-center"
				data-background="img/collection/latest-offer.png">
				<div class="container">
					<div class="row d-flex align-items-center">
						<div class="col-xl-5 col-lg-5 col-md-6 offset-xl-1 offset-lg-1">
							<div class="latest-caption">
								<h2>
									Get Our<br>Latest Offers News
								</h2>
								<p>Subscribe news latter</p>
							</div>
						</div>
						<div class="col-xl-5 col-lg-5 col-md-6 ">
							<div class="latest-subscribe">
								<form action="#">
									<input type="email" placeholder="Your email here">
									<button>Shop Now</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- man Shape -->
				<div class="man-shape">
					<img src="/resources/main/img/collection/latest-man.png">
				</div>
			</div>
		</div>
		<!-- Latest Offers End -->
		<!-- Shop Method Start-->
		<div class="shop-method-area section-padding30">
			<div class="container">
				<div class="row d-flex justify-content-between">
					<div class="col-xl-3 col-lg-3 col-md-6">
						<div class="single-method mb-40">
							<i class="ti-package"></i>
							<h6>Free Shipping Method</h6>
							<p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-6">
						<div class="single-method mb-40">
							<i class="ti-unlock"></i>
							<h6>Secure Payment System</h6>
							<p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-6">
						<div class="single-method mb-40">
							<i class="ti-reload"></i>
							<h6>Secure Payment System</h6>
							<p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Shop Method End-->
		<!-- Gallery Start-->
		<div class="gallery-wrapper lf-padding">
			<div class="gallery-area">
				<div class="container-fluid">
					<div class="row">
						<div class="gallery-items">
							<img src="/resources/main/img/gallery/gallery1.jpg">
						</div>
						<div class="gallery-items">
							<img src="/resources/main/img/gallery/gallery2.jpg">
						</div>
						<div class="gallery-items">
							<img src="/resources/main/img/gallery/gallery3.jpg">
						</div>
						<div class="gallery-items">
							<img src="/resources/main/img/gallery/gallery4.jpg">
						</div>
						<div class="gallery-items">
							<img src="/resources/main/img/gallery/gallery5.jpg">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Gallery End-->

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