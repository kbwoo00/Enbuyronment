<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/board/css/board_style.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>

<style>
input {
  width: 100%;
  border: 0;
  border-bottom: 1px solid #485549;
  outline: 0;
}
textarea {
  width: 100%;
  border: 0;
}
#boardTit {
  font-weight: 600;
  padding-bottom: 20px;
}
</style>

</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<main>
		<div class="container mt-5 col-md-12">
			<div id="board-name" style="font-size:30px;">QnA</div>
			<div class="row" style="display:flex; justify-content: center;">
				<div class="col-md-10 mt-4">
					<div class="col-md-12 mb-3" style="padding-left:0px;">
						<input type="text" id="boardTit" name="title" value="${boardDetail.title }" readonly><br>
					</div>
					<textarea id="boardCont" style="min-height:300px;" readonly>${boardDetail.content }</textarea>
				</div>
			</div>
			<hr>
			<div class="col-md-2" style="display:flex; display-wrap:wrap; float:right;">
				<c:choose>
					<c:when test="${sessionScope.userId eq boardDetail.uid }">
						<input class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" type="button" value="수정" onclick="location.href='/board/QnA/${boardDetail.boardNo }/update';"> &nbsp;
						<input class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" type="button" id="deleteBtn" value="삭제">
					</c:when>
					<c:when test="${sessionScope.userId eq 'admin' }">
						<input class="btn enb-loginBtn" id="ansBtn" style="padding: 1.3rem 1.3rem !important;" type="button" value="답변하기">
					</c:when>
				</c:choose>
			</div>
		</div>
	</main>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#deleteBtn').click(function() {
			if(confirm('글을 삭제하시겠습니까?')) {
				location.href="/board/QnA/${boardDetail.boardNo}/delete";
			}
		});
		
		$('#ansBtn').click(function() {
			var reRef = ${boardDetail.boardNo};
			
			$.ajax({
				url: '/board/checkAns',
				type: 'post',
				data: JSON.stringify({
					'reRef' : reRef
				}),
				contentType : "application/json; charset=utf-8",
				dataType: 'text',
				success: function(data) {
					if(data == 'YES') {
						location.href="/board/writeQnA?boardNo="+reRef;
					} else {
						alert('이미 답변이 완료된 글입니다');
						return false;
					}
				}
			});
		});
	});
</script>
</html>