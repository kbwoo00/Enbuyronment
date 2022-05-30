<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>enbuyronment</title>
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/admin/css/userOrderList_style.css">
<body>
	<main>
		<div class="container mt-5" style="max-width: 1400px;">
			<div class="row" style="max-width: 1400px; padding:0rem!important; border: 1px solid rgba(0,0,0,.125); border-radius: 5px; margin-bottom: 2rem;">
				<h3 class= "userOrder-title">&nbsp; 유저 주문내역 확인</h3>
				<form action="/orderManagement" method="post" style="width:100%;">
					<table class="order-searchTable">
						<tr>
							<td style="text-align: center; width: 180px; font-size: 1.1rem;">주문번호</td>
							<td colspan="4">
								<input class="order-input" type="number" name="orderNo" id="orderNo" placeholder="주문번호" style="width: 60%;">
								<input class="search-btn" type="button" id="searchOrderNo" value="검색" style="margin-left: 10px;">
							</td>
						</tr>
						<tr>
							<td style="text-align: center; width: 180px; font-size: 1.1rem;">상세정보</td>
							<td>
								<input class="order-input" type="text" name="uid" id="uid" placeholder="아이디" style="width: 200px;">
							</td>
							<td>
								<input class="order-input" type="date" name="date1" id="date1" style="width: 180px;">
								~
								<input class="order-input" type="date" name="date2" id="date2" style="width: 180px;">
							</td>
							<td style="display: flex; justify-content: space-between; align-items: center; line-height: 43px;">
								<input type="radio" name="status" id="status" value="0" checked>전체
								<input type="radio" name="status" value="배송 준비" style="margin-left: 5px;">배송 준비
								<input type="radio" name="status" value="배송 중" style="margin-left: 5px;">배송 중
								<input type="radio" name="status" value="배송 완료" style="margin-left: 5px;">배송 완료
								<input type="radio" name="status" value="주문 취소" style="margin-left: 5px;">주문 취소
							</td>
							<td>
								<input type="submit" class="search-btn" id="searchOrder" value="검색">
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="row">
				<div class="container mb-3" style="max-width: 1400px; padding: 0 !important;">
					<select class="addrList">
						<option value="0">주문상태를 선택하세요</option>
						<option value="배송 준비">배송 준비</option>
				      	<option value="배송 중">배송 중</option>
				      	<option value="배송 완료">배송 완료</option>
				      	<option value="주문 취소">주문 취소</option>
				    </select>
					<input type="button" id="statusChange" class="btn header-btn enb-loginBtn"
							style="padding: 1.3rem 1.3rem !important; margin-left: 10px;" value="주문상태 변경">
				</div>
						
				<table class="table table-sm" style="text-align : center; vertical-align : middle;">
					<thead>
						<tr style="background:#e5ede6b0;">
							<th class="align-middle" rowspan="3" style="width:50px;"><input id="ckAll" type="checkbox"></th>
							<th class="align-middle" rowspan="3" style="width:550px;">주문번호 및 배송지</th>
							<th class="align-middle"  style="width:150px;">구매자</th>
							<th class="align-middle"  style="width:150px;">주문품목수</th>
							<th class="align-middle"  rowspan="3" style="width:300px;">운송장번호</th>
							<th class="align-middle"  rowspan="3" style="width:150px;">주문상태</th>
						</tr>
						<tr style="background:#e5ede6b0;">
							<th class="align-middle" >수령인</th>
							<th class="align-middle" >주문금액</th>
						</tr>
						<tr style="background:#e5ede6b0;">
							<th class="align-middle" >수령인 연락처</th>
							<th class="align-middle" >주문날짜</th>
						</tr>
					</thead>
					<tbody class="orderListBox">
						<c:choose>
							<c:when test="${userOrderList.get(0).orderNo eq null }">
								<tr><td colspan="6" style="line-height:100px;">주문내역이 존재하지 않습니다.</td></tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="list" items="${userOrderList }" varStatus="status">
									<tr> 
										<td class="align-middle" rowspan="3">
											<input class="check-input${status.index }" type="checkbox" value="${list.orderNo }">
										</td>
										<td class="align-middle"  rowspan="3">
											<b>${list.orderNo }</b><br>
											(${list.postcode }) ${list.addr }<br>
											${list.exAddr } ${list.dtAddr }
										</td>
										<td class="align-middle">${list.uid }</td>
										<td class="align-middle">${userOrderProdCnt.get(status.index) }건</td>
										<td class="align-middle" rowspan="3" id="trackNoDiv${status.index }">
											<c:choose>
												<c:when test="${list.trackNo ne null }">
													${list.trackNo }
												</c:when>
												<c:when test="${list.status eq '배송 중' }">
													<input class="trackNo-input" type='number' id="inputTrackNo" name='trackNo'>
													<input class="trackNo-inputBtn" type='button' id='trackNoBtn' name="${status.index }" value='입력'>
												</c:when>
												<c:otherwise>
													-
												</c:otherwise>
											</c:choose>
										</td>
										<td class="align-middle" rowspan="3" id="shipStatusDiv${status.index }">${list.status }</td>
									</tr>
									<tr >
										<td class="align-middle">${list.receiver }</td>
										<td class="align-middle" >${list.totalPrice }원</td>
									</tr>
									<tr>
										<td class="align-middle">${list.phone }</td>
										<td class="align-middle">
											<fmt:formatDate type="date" value="${list.orderDate }"/>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<div class="row justify-content-center">
				<nav class="blog-pagination d-flex" aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${pageInfo.prev }">
							<li class="page-item">
								<a class="page-link" href="/orderManagement?page=${pageInfo.startPage - 1}" aria-label="Previous">
									<i class="ti-angle-left"></i>
								</a>
							</li>
						</c:if>
						<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
							<c:choose>
								<c:when test="${i == presentPage }">
									<li class="page-item active">
										<a class="page-link " href="/orderManagement?page=${i }">${i }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link active" href="/orderManagement?page=${i }">${i }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageInfo.next && pageInfo.endPage > 0  }">
							<li class="page-item">
								<a class="page-link" href="/orderManagement?page=${pageInfo.endPage + 1}" aria-label="Next">
									<i class="ti-angle-right"></i>
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</main>
	
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>
</body>

<script>
	$(document).ready(function() {
		var ckedArr = [];
		
		//체크박스 선택
		$('#ckAll').click(function() {
			if($('#ckAll').is(':checked')){
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});
		
		//주문번호 검색
		$('#searchOrderNo').click(function() {
			if($('#orderNo').val() == "") {
				location.href="/orderManagement";
				
			} else {
				location.href="/orderManagement?orderNo="+$('#orderNo').val();
			}
		});
		
		//주문 상세검색
		$('#searchOrder').click(function() {
			if(($('#date1').val()=="" && $('#date2').val()!="") || ($('#date1').val()!="" && $('#date2').val()=="")) {
				alert('날짜 형식이 맞지 않습니다');
				return false;
			}
			
			if($('#uid').val()=="" && $('#date1').val()=="" && $('#status').val()=="0") {
				location.href="/orderManagement";
			}
		});
		
		//주문상태변경
		$('#statusChange').click(function() {
			if($('.addrList').val() == 0) {
				alert('상태를 선택해주세요');
				return false;
			}
			
			if(confirm('선택한 주문의 상태를 변경하시겠습니까?')) {
				ckedArr.push($('.addrList').val());
				
				for(var i=0; i<${userOrderList.size()}; i++) {
					if($('.check-input'+i).is(':checked')) {
						ckedArr.push($('.check-input'+i).val());
					}
				}
				
				$.ajax({
					url: '/changeStatus',
					type: 'post',
					data: JSON.stringify(ckedArr),
					contentType : "application/json; charset=utf-8",
					success: function() {
						ckedArr.length = 0;
						location.reload();
					}
				});
			}
		});
		
 		//운송장번호 입력
		$('input[id^=trackNoBtn]').click(function() {
				var idx = $(this).attr('name');
				var trackNo = $(this).prev().val();
				
				if(trackNo == "") {
					alert('운송장번호를 입력해주세요');
					return false;
				}
				
			if(confirm('해당 번호로 입력하시겠습니까?')) {
				$.ajax({
					url: '/inputTrackNo',
					type: 'post',
					data: JSON.stringify({
						'orderNo' : $('.check-input'+idx).val(),
						'trackNo' : trackNo
					}),
					contentType : "application/json; charset=utf-8",
					success: function() {
						$('#trackNoDiv'+idx).html(trackNo);
					}
				});
			}
		});
	});
</script>
</html>