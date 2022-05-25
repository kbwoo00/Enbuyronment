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
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<div class="container">
		<div id="board-name"></div>
		
		제목 : <input type="text" id="boardTit" name="title" value="${boardDetail.title }" readonly><br>
		내용 : <textarea rows="10" cols="50" id="boardCont" name="content" readonly>${boardDetail.content }</textarea>
		<hr>
		<input type="button" value="수정" onclick="location.href='/board/${boardDetail.boardName}/${boardDetail.boardNo }/update';">
		<input type="button" id="deleteBtn" value="삭제">
		
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

</body>

<script type="text/javascript">
	$(document).ready(function() {
		if('${boardDetail.boardName}' == 'notice') {
			$('#board-name').text('공지사항');
		} else {
			$('#board-name').text('FAQ');
		}
		
		$('#deleteBtn').click(function() {
			if(confirm('글을 삭제하시겠습니까?')) {
				location.href="/board/${boardDetail.boardName}/${boardDetail.boardNo }/delete";
			}
		});
	});
</script>
</html>