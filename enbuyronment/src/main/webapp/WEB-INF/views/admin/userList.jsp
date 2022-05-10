<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<div class="container">
		<h3>TO DO : 회원삭제 버튼 넣기</h3>
		<h3 class="mt-5">유저정보</h3>
		<div class="table-responsive mb-5">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">
							<div class="form-check justify-content-center">
								<input class="form-check-input" type="checkbox"
									id="ckAll"> <label class="form-check-label"> 선택 / 선택 해제 </label>
							</div>
						</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">이메일</th>
						<th scope="col">연락처</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userList }">
						<tr>
							<td class="col-md-2"><div
									class="form-check justify-content-center">
									<input class="form-check-input" type="checkbox"
										value="${user.uid }" id="flexCheckDefault">
								</div></td>
							<td>${user.uid }</td>
							<td>${user.name }</td>
							<td>${user.email }</td>
							<td>${user.phone }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button id="deleteBtn" type="button" class="btn">선택된 회원 삭제</button>
		</div>

		<div class="row justify-content-center">
			<nav class="blog-pagination d-flex"
				aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${pageInfo.prev }">
						<li class="page-item"><a class="page-link"
							href="/userManagement?page=${pageInfo.startPage - 1}"
							aria-label="Previous"> <i class="ti-angle-left"></i>
						</a></li>
					</c:if>
					<c:forEach begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }" var="i">
						<c:choose>
							<c:when test="${i == presentPage }">
								<li class="page-item active"><a class="page-link "
									href="/userManagement?page=${i }">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link active"
									href="/userManagement?page=${i }">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageInfo.next && pageInfo.endPage > 0  }">
						<li class="page-item"><a class="page-link"
							href="/userManagement?page=${pageInfo.endPage + 1}"
							aria-label="Next"> <i class="ti-angle-right"></i>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>


	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

	<script type="text/javascript">
		var ckedArr = [];

		$(document).ready(function() {
			// 전체 체크 박스 선택, 해제
			$('#ckAll').click(function() {
				if($('#ckAll').is(':checked')){
					$("input[type=checkbox]").prop("checked", true);
				} else {
					$("input[type=checkbox]").prop("checked", false);
				}
			});
			
			// 체크박스에 선택된 유저 데이터 삭제
			$('#deleteBtn').click(function() {
				if(confirm('정말 삭제하시겠습니까?')){
					$(".form-check-input:checked").each(function() {
						ckedArr.push($(this).val());
					});
					
					$.ajax({
						url : '/userManagement/delete',
						type : 'post',
						contentType : 'application/json',
						data : JSON.stringify(ckedArr),
						async: false,
						success : function(msg) {
							alert('삭제되었습니다.');
							location.replace(location.href);
						}
					});
				}
			});

		});
	</script>

</body>
</html>