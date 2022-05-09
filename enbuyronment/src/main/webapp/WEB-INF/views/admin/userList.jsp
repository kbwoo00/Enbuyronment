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
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">이메일</th>
						<th scope="col">연락처</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userList }">
						<tr>
							<td>${user.uid }</td>
							<td>${user.name }</td>
							<td>${user.email }</td>
							<td>${user.phone }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${pageInfo.prev }">
						<li class="page-item"><a class="page-link"
							href="/userManagement?page=${pageInfo.startPage - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
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
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>


	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>


</body>
</html>