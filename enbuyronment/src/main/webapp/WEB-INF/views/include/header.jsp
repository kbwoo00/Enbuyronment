<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header>
	<!-- Header Start -->
	<div class="header-area">
		<div class="main-header ">
			<div class="header-bottom  header-sticky">
				<div class="container-fluid"
					style="background-color: #fff; height: 4rem;">
					<div class="row align-items-center" style="height: 60px;">
						<!-- Logo -->
						<div class="main-logobox">
							<div class="logo">
								<a href="/"><img src="/resources/img/enbuyronment.png"
									alt="mainLogo"></a>
							</div>
						</div>
						<div class="main-menubox">
							<!-- Main-menu -->
							<div class="main-menu d-lg-block" style="width: 100%;">
								<nav>
									<ul id="navigation" class="enb-mainNav">
										<li><a>게시판</a>
											<ul class="submenu enb-submenu">
													<li><a href="/board/notice">공지사항</a></li>
													<li><a href="/board/FAQ">FAQ</a></li>
													<li><a href="/board/QnA">상품문의</a></li>
											</ul>
										</li>
										<li><a href="/product/list">스토어</a></li>
										<!-- js 컨트롤 -->
										<c:if test="${sessionScope.mode eq 'adminMode' }">
											<li><a>관리자</a>
												<ul class="submenu enb-submenu">
													<li><a href="/board/write">글쓰기</a></li>
													<li><a href="/userManagement">회원관리</a></li>
													<li><a href="/product/regist">상품등록</a></li>
													<li><a href="/orderManagement">주문내역</a></li>
												</ul></li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>
						<div class="main-userbox">
							<ul
								class="header-right f-right d-lg-block d-flex justify-content-between main-userbox-liControl">
								<c:choose>
									<c:when test="${empty sessionScope.userId}">
										<li class="d-lg-block">
											<input type="button" id="loginBtn" class="btn header-btn enb-loginBtn"
													style="padding: 1.3rem 1.3rem !important;" value="로그인">
										</li>
										<li class="d-lg-block">
											<input type="button" class="btn header-btn enb-loginBtn" id="joinBtn"
													style="padding: 1.3rem 1.3rem !important;" value="회원가입">
										</li>
									</c:when>
									<c:otherwise>
										<li class="d-xl-block" style="width:240px; font-size: 0.9em; padding-right: 20px; text-align: right;">
											${sessionScope.userId }님
										</li>
										<li>
											<div class="favorit-items" style="width:70px;">
												<a href="/heart/view"><i class="far fa-heart"></i></a>
											</div>
										</li>
										<li>
											<div class="shopping-card" style="width:70px;">
												<a href="/cart/view"><i class="fas fa-shopping-cart"></i></a>
											</div>
										</li>
										<li class="d-lg-block">
											<input type="button" id="myPageBtn" class="btn header-btn enb-whiteBtn"
													style="padding: 1.3rem 1.3rem !important;" value="마이페이지">
										</li>
										<li class="d-lg-block">
											<input type="button" id="logoutBtn" class="btn header-btn enb-loginBtn"
													style="padding: 1.3rem 1.3rem !important;" value="로그아웃">
										</li>
									</c:otherwise>
								</c:choose>

							</ul>
						</div>
						<!-- Mobile Menu -->
						<!-- <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
</header>
<c:if test="${sessionScope.userId eq 'admin'}">
	<div id="changeModeBtn" class="admin-Mode-Icon">
	  <img src="/resources/img/admin-icon2.png" alt="adminIcon">
	</div>
</c:if>
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
