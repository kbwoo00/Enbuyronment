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
<link rel="stylesheet" href="/resources/board/css/board_style.css">
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<main>
		<div class="container mt-5" style="max-width: 1200px;">
			<div class="row">
				<div id="board-name" style="font-size:30px;"></div>

				<table class="table table-sm mt-1" style="text-align : center;">
					<thead style="background-color:#86a688; color:white;">
						<tr>
							<th style="width:1000px;">제목</th>
							<th style="width:200px;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${fixedNotice }">
							<tr style="background-color:#eeeeee;">
								<th style="text-align: left; padding-left: 20px;">
									<a style="color: black;" class="bTitle" href="/board/notice/${notice.boardNo }">${notice.title }</a>
								</th>
								<th><fmt:formatDate type="date" value="${notice.regdate }"/></th>
							</tr>
						</c:forEach>
						<c:forEach var="board" items="${boardList }">
							<tr>
								<td style="text-align: left; padding-left: 20px;">
									<a style="color: black;" class="bTitle" href="/board/${board.boardName }/${board.boardNo }">${board.title }</a>
								</td>
								<td><fmt:formatDate type="date" value="${board.regdate }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="row col-md-12" style="display:flex; justify-content: center;">
					<nav class="blog-pagination d-flex" aria-label="Page navigation example">
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
		</div>
	</main>
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