<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/board/css/board_style.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<div class="container">
		<div id="board-name"></div>
		
		<table border="1">
			<tr>
				<td>제목</td><td>글쓴이</td><td>작성일</td>
			</tr>
			<c:forEach var="notice" items="${fixedNotice }">
				<tr style="color:red;">
					<td><a href="/board/notice/${notice.boardNo }">${notice.title }</a>
					</td><td>관리자</td>
					<td><fmt:formatDate type="date" value="${notice.regdate }"/></td>
				</tr>
			</c:forEach>
			<c:forEach var="board" items="${boardList }">
				<tr>
					<td><a href="/board/${board.boardName }/${board.boardNo }">${board.title }</a></td>
					<td>관리자</td>
					<td><fmt:formatDate type="date" value="${board.regdate }"/></td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="row justify-content-center">
			<nav class="blog-pagination d-flex"
				aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${pageInfo.prev }">
						<li class="page-item"><a class="page-link"
							href="/board/${boardName }?page=${pageInfo.startPage - 1}"
							aria-label="Previous"> <i class="ti-angle-left"></i>
						</a></li>
					</c:if>
					<c:forEach begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }" var="i">
						<c:choose>
							<c:when test="${i == presentPage }">
								<li class="page-item active"><a class="page-link "
									href="/board/${boardName }?page=${i }">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link active"
									href="/board/${boardName }?page=${i }">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageInfo.next && pageInfo.endPage > 0  }">
						<li class="page-item"><a class="page-link"
							href="/board/${boardName }?page=${pageInfo.endPage + 1}"
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

</body>

<script type="text/javascript">
	if('${msg}' == 'writeOK') {
		alert('글 작성 완료');
	}
	if('${msg}' == 'updateOK') {
		alert('글 수정 완료');
	}
	if('${msg}' == 'deleteOK') {
		alert('글 삭제 완료');
	}
	
	$(document).ready(function() {
		if('${boardName}' == 'notice') {
			$('#board-name').text('공지사항');
		} else {
			$('#board-name').text('FAQ');
		}
	});
</script>
</html>