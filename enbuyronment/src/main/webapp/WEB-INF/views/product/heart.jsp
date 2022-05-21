<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="/resources/main/image/x-icon"
	href="/resources/main/img/favicon.ico">
<link rel="stylesheet" href="/resources/product/css/cart_style.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<br>
	<br>
	<br>
	<div class="container" style="display: flex; justify-content: center;">
		<div class="page-wrapper" style="width: 80vw;">
			<div class="wrapper">
				<div class="row justify-content-between">
					<h3 class="col-md-auto">관심상품 목록</h3>
					<div class="col-md-auto">
						<a id="delBtn" class="btn header-btn enb-loginBtn mb-2"
						style="color: white; padding: 1.3rem 1.3rem !important;">선택상품
						삭제</a>	
						<a id="delAllBtn" class="btn header-btn enb-loginBtn mb-2"
						style="color: white; padding: 1.3rem 1.3rem !important;">전체 삭제</a>
					</div>
					 
				</div>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col"><input id="ckAll" type="checkbox"></th>
						<th scope="col" class="col-md-2"><div class="row justify-content-center">상품 이미지</div></th>
						<th class="col-md-4" scope="col">
						<div class="row justify-content-center">상품 정보</div>
						</th>
						<th scope="col"><div class="row justify-content-center">금액</div></th>
					</tr>
				</thead>
				<tbody id="tbody">
					 <c:forEach var="heart" items="${heartList }" varStatus="status">
						<tr>
							<td class="align-middle"><input class="check-input"
								type="checkbox" value="${heart.prodNo }"></td>
							<td><a href="/product/${heart.prodNo }">
							 	<img
								style="margin: 0 auto; width: 150px; height: 130px;"
								src="../upload/${heart.thumb }">
								</a>
							</td>
							<td class="align-middle"><a style="color:black;" href="/product/${heart.prodNo }"><span class="productName">${heart.prodName }</span><br>
								 <span class="brandName">[${heart.brandName }]</span></a></td>
							 <td class="align-middle text-center">
								<div class="row mb-3 justify-content-center" id="prodPrice${status.index }">${heart.price } 원</div>
								<div class="row justify-content-center">
									<input type="hidden" id="prodNo${status.index }"
											value="${heart.prodNo }">
									<button class="enb-loginBtn"
										id="toCartBtn${status.index }" type="button"
										name="button" style="border-radius: 5px !important;"> 장바구니 담기 </button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			// 체크박스
			var ckedArr = [];
			delBtn = $('#delBtn');
			delAllBtn = $('#delAllBtn');
			$('#ckAll').click(function() {
				if($('#ckAll').is(':checked')){
					$("input[type=checkbox]").prop("checked", true);
				} else {
					$("input[type=checkbox]").prop("checked", false);
				}
			});
			
			delAllBtn.click(function() {
				if(confirm('모든 상품을 관심목록에서 삭제하시겠습니까?')){
					$(".check-input").each(function() {
						ckedArr.push($(this).val());
					});
					
					$.ajax({
						url : '/heart/delCkedProd',
						type : 'post',
						dataType : "text",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify(ckedArr),
						success : function(result) {
							ckedArr.length = 0;
							location.replace("/heart/view");
						}
					});
				}
			});
			
			delBtn.click(function() {
				if (confirm('선택하신 상품을 관심목록에서 제거하시겠습니까?')) {
					$(".check-input:checked").each(function() {
						ckedArr.push($(this).val());
					});
					
					$.ajax({
						url : '/heart/delCkedProd',
						type : 'post',
						dataType : "text",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify(ckedArr),
						success : function(result) {
							ckedArr.length = 0;
							location.replace("/heart/view");
						}
					});
				}
			});
			
			// 장바구니에 담기
			var heartLength = "${fn:length(heartList) }";
			var uid = "${sessionScope.userId}";
			
			if(heartLength == 0){
				$('#tbody').html("<tr><td colspan='6'><h4 class='text-center'>관심상품이 없습니다.</h4></td></tr>");
			} else{
				for(let i = 0; i < heartLength; i++){
					$('#toCartBtn' + i).click(function() {
						$.ajax({
						      url: "/cart/addProduct",
						      type: "post",
						      contentType: "application/json; charset=utf-8",
						      data: JSON.stringify({
						        uid: uid,
						        prodNo: $('#prodNo' + i).val(),
						        amount: 1,
						      }),
						      success: function () {
						        if(confirm('장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?')){
						        	location.href = '/cart/view';
						        } 
						      },
						      error: function (){
						    	  location.href = '/user/login';
						      }
						    });
					});
					
				}
			}
			
			
		});
	</script>
</body>
</html>
