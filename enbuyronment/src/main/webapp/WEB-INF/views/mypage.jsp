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
<link rel="stylesheet" href="/resources/product/css/main.css">
<%@include file="/WEB-INF/views/include/css.jsp" %>

<style>

/* ================== 주문/배송조회 박스 시작 ==================== */
.shippingStatusContainer{
  padding: 21px 16px;
  background-color: white;
  margin-bottom: 10px;
}

/* 주문/배송조회 타이틀 */
.shippingStatusContainer .title{
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 15px;
}

/* 장바구니 결제완료 배송중 구매확정 [로우] */
.shippingStatusContainer .status{
  display: flex;
  justify-content: space-between;
  margin-bottom: 21px;
}
/* 장바구니 결제완료 배송중 구매확정 [아이템]  */
.shippingStatusContainer .item{
  display: flex;
}

.shippingStatusContainer .number{
  font-size: 31px;
  font-weight: 500;
  text-align: center;
}
.shippingStatusContainer .text{
  font-size: 12px;
  font-weight: normal;
  color: #c2c2c2;
  text-align: center;
}
.shippingStatusContainer .icon{
  display: flex;
  align-items: center;
  padding: 20px;
  width: 16px;
  height: 16px;
}

</style>

</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>

<div class="mypage" style="display:flex; flex-wrap:wrap;">
	<div class="mypage-sidebar">
		<div class="mypage_sidebar">
			<div class="single_sedebar">
				<div class="select_option">
					<div class="select_option_dropdown" style="width:80% !important;">
						<p><a class="mypage-menu" href="">회원정보 조회 및 수정</a></p>
						<p><a class="mypage-menu" href="">찜 목록</a></p>
						<p><a class="mypage-menu" href="">주문 내역</a></p>
						<p><a class="mypage-menu" href="">나의 리뷰 관리</a></p>
						<p><a class="mypage-menu" href="">회원 탈퇴</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="mypage-content">
		<div class="wrapper-right">
			<div class="sub-title">
				<h3>마이페이지</h3>
			</div>
			<div class="user-info">
			<br><br>
				<p style="text-align: center;">OOO님, 환영합니다!</p>
				<br>
				<ul class="nav nav-fill">
				  <li class="nav-item">
				    <a class="nav-link active" style="color:black;" href="#">주문 내역</a>
				  </li>
				  <li>
				  	<p style="padding-top:5px">/</p>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" style="color:black;" href="#">잔여 포인트 0P</a>
				  </li>
				  <li>
				  	<p style="padding-top:5px">/</p>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" style="color:black;" href="#">뭐엿지?</a>
				  </li>
				  <li>
				  	<p style="padding-top:5px">/</p>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" style="color:black;" href="#">??????</a>
				  </li>
				</ul>
			</div>
			
			<div class="shippingStatusContainer" style="text-align:max-width: 900px;">
				<div class="title">
			      주문/배송조회
			    </div>
			    <div class="status">
					<div class="item">
				        <div>
							<div class="number">6</div>
							<div class="text">장바구니</div>
						</div>
					</div>
					  
					<div class="icon"> > </div>
					
					<div class="item">
						<div>
							<div class="number">0</div>
							<div class="text">결제완료</div>
						</div>
					</div>
					 
					<div class="icon"> > </div>
					
					<div class="item">
						<div>
							<div class="number">1</div>
							<div class="text">배송중</div>
			        	</div>
					</div>
					  
					<div class="icon"> > </div>
					
					<div class="item">
						<div>
							<div class="number">3</div>
							<div class="text">구매확정</div>
				        </div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@include file="/WEB-INF/views/include/script.jsp"%>
<%@include file="/WEB-INF/views/include/header_script.jsp"%>

</body>
</html>