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
  width: 98%;
  border: 0;
  border-bottom: 1px solid #86A688;
  outline: 0;
  }

</style>

</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<div class="container mt-5 col-md-12">
		<div id="board-name" style="font-size:30px;"></div>
		<div class="row" style="display:flex; justify-content: center;">
			<div class="col-md-10 mt-4">
				<div class="col-md-12 mb-3" style="padding-left:0px;">
					<input type="text" id="boardTit" name="title" value="${boardDetail.title }" placeholder="제목을 입력하세요" readonly><br>
				</div>
				<textarea rows="10" cols="110" id="boardCont" name="content" placeholder="내용을 입력하세요" readonly>${boardDetail.content }</textarea>
			</div>
		</div>
		<hr>
		<div class="col-md-2" style="display:flex; display-wrap:wrap; float:right;">
			<input class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" type="button" value="수정" onclick="location.href='/board/${boardDetail.boardName}/${boardDetail.boardNo }/update';"> &nbsp;
			<input class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" type="button" id="deleteBtn" value="삭제">
		</div>
		
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