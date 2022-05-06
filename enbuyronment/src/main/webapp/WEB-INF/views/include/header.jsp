<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>enbuyronment</title>
</head>
<body>
 <header>
        <!-- Header Start -->
       <div class="header-area">
            <div class="main-header ">
<!--                 <div class="header-top d-none d-block"> -->
<!--                    <div class="container-fluid"> -->
<!--                        <div class="col-xl-12"> -->
<!--                             <div class="row d-flex justify-content-between align-items-center"> -->
<!--                                 <div class="header-info-left d-flex"> -->
<!--                                 </div> -->
<!--                                 <div class="header-info-right"> -->
<!--                                    <ul>                                           -->
<!-- <!--                                        <li><a href="#">My Page </a></li> -->
<!--                                       <li class="d-none d-block"> <a href="#" class="btn header-btn">로그인</a></li> -->
<!--                                    </ul> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                        </div> -->
<!--                    </div> -->
<!--                 </div> -->
                
               <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-block">
                                    <nav>                                                
                                        <ul id="navigation">
                                                    <img class="logo" href="/" src="/resources/main/img/enbuyronment.png" width="350px" height="50px" />                                                                                                                   
                                            <li><a href="/">메인</a></li>
                                            <li><a>게시판</a>
	                                            <ul class="submenu">
	                                                <li><a href="/board/list">공지사항</a></li>
	                                                <li><a href="/board/faq">FAQ</a></li>
	                                            </ul>
                                            </li>
                                            <li><a href="/product/list">스토어</a></li>
                                            <li><a>관리자</a>
	                                            <ul class="submenu">
	                                                <li><a href="/board/write">글쓰기</a></li>
	                                                <li><a href="/userManagement">회원관리</a></li>
	                                                <li><a href="/product/regist">상품등록</a></li>
	                                                <li><a href="/orderManagement">주문내역</a></li>
	                                            </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div> 
                            <div class="col-xl-5 col-lg-3 col-md-3 col-sm-3 fix-card">
                            
								<ul
									class="header-right f-right d-none d-lg-block d-flex justify-content-between">
<!-- 									<li class="d-none d-xl-block"> -->
<!-- 										<div class="form-box f-right "></div> -->
<!-- 									</li> -->
<!-- 									<li class=" "> -->
<!-- 										<div class="favorit-items"> -->
<!-- 											<i class="far fa-heart"></i> -->
<!-- 										</div> -->
<!-- 									</li> -->
<!-- 									<li> -->
<!-- 										<div class="shopping-card"> -->
<!-- 											<a href="cart.html"><i class="fas fa-shopping-cart"></i></a> -->
<!-- 										</div> -->
										<li><div class="dvlpmode" href="#"><img src="/resources/main/img/icon/dvlpicon.png/" width="40px" height="40px" /></div></li>
<!-- 									</li> -->
									<li class="d-none d-block"><a href="/user/login"
										class="btn header-btn">로그인</a></li>
									<li class="d-none d-block"><a href="/user/join"
										class="btn header-btn">회원가입</a></li>
								</ul>
							</div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
</body>
</html>