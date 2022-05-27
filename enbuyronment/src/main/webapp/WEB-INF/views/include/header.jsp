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
							<div class="main-menu f-right d-lg-block" style="width: 100%;">
								<nav>
									<ul id="navigation" class="enb-mainNav">
										<li><a href="/board/notice">공지사항</a></li>
										<li><a href="/product/list">스토어</a></li>
										<li><a href="/board/FAQ">FAQ</a></li>
										<li><a href="/mypage/userinfo">마이 페이지</a></li>
										<!-- js 컨트롤 -->
										<c:if test="${sessionScope.mode eq 'adminMode' }">
											<li><a>관리자</a>
												<ul class="submenu enb-submenu">
													<li><a href="/board/write">글쓰기</a></li>
													<li><a href="/userManagement">상품등록</a></li>
													<li><a href="/product/regist">주문내역</a></li>
													<li><a href="/orderManagement">회원관리</a></li>
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
										<li class="d-lg-block"><a href="/user/login"
											" class="btn header-btn enb-loginBtn"
											style="padding: 1.3rem 1.3rem !important;">로그인</a></li>
										<li class="d-lg-block"><a href="/user/join"
											class="btn header-btn enb-loginBtn"
											style="padding: 1.3rem 1.3rem !important;">회원가입</a></li>
									</c:when>
									<c:otherwise>
										<li class="d-xl-block">
											<div class="favorit-items">
												<a href="/heart/view"><i class="far fa-heart"></i></a>
											</div>
										</li>
										<li>
											<div class="shopping-card">
												<a href="/cart/view"><i class="fas fa-shopping-cart"></i></a>
											</div>
										</li>
										<li class="d-lg-block"><a href="#" id="logoutBtn"
											class="btn header-btn enb-loginBtn"
											style="padding: 1.3rem 1.3rem !important;">로그아웃</a></li>
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
