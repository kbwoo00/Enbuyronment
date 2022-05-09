<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h3>유저정보</h3>
	<ul>
		<c:forEach var="user" items="${userList }">
			<li>${user.uid }</li>
		</c:forEach>
	</ul>
	<h3>TO DO : 회원삭제 버튼 넣기</h3>

	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${pageInfo.prev }">
				<li class="page-item"><a class="page-link" href="/userManagement?page=${pageInfo.startPage - 1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }"
				var="i">
				<li class="page-item"><a class="page-link"href="/userManagement?page=${i }">${i }</a></li>
			</c:forEach>
			<c:if test="${pageInfo.next && pageInfo.endPage > 0  }">
				<li class="page-item"><a class="page-link" href="/userManagement?page=${pageInfo.endPage + 1}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
</body>
</html>