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
				<div id="board-name" style="font-size:30px;">QnA</div>

				<table class="table table-sm mt-1" style="text-align : center;">
					<thead style="background-color:#86a688; color:white;">
						<tr>
							<th style="width:800px;">제목</th>
							<th style="width:200px;">작성자</th>
							<th style="width:200px;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="qna" items="${boardList }">
							<c:choose>
								<c:when test="${qna.status eq 1 }">
									<tr>
										<td style="text-align: left; padding-left: 20px;">
											<a style="color: black;" class="bTitle" href="/board/QnA/${qna.boardNo }">
												${qna.title }
											</a>
										</td>
										<td class="writer">${qna.writer }</td>
										<td><fmt:formatDate type="date" value="${qna.regdate }"/></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td style="text-align: left; padding-left: 20px;">
											<a style="color: black;" class="bTitle" href="/board/QnA/${qna.boardNo }">
												&nbsp;&nbsp; ↳ ${qna.title }
											</a>
										</td>
										<td>관리자</td>
										<td><fmt:formatDate type="date" value="${qna.regdate }"/></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
				
				<c:if test="${sessionScope.userId ne null and sessionScope.userId ne 'admin'}">
					<div class="col-md-2" style="display:flex; display-wrap:wrap; float:right;">
						<input class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" type="button" value="문의하기" onclick="location.href='/board/writeQnA';">
					</div>
				</c:if>

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
		 function maskingName(strName)  {
			  if (strName.length > 2) {
			    var originName = strName.split('');
			    originName.forEach(function(name, i) {
			      if (i === 0 || i === originName.length - 1) return;
			      originName[i] = '*';
			    });
			    var joinName = originName.join();
			    return joinName.replace(/,/g, '');
			  } else {
			    var pattern = /.$/; // 정규식
			    return strName.replace(pattern, '*');
			  }
			};
			console.log('ㅌㅌ');
		
		$('.writer').each(function (index, item) {
			$(item).text(maskingName($(item).text()));
		});
		
	});
</script>
</html>