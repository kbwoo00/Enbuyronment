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
		
		<form method="post">
			<div id="fixNoticeBox"><input type="checkbox" id="fixNotice">공지 상단고정</div>
			<input type="hidden" id="boardStatus" name="status">
			<hr>
			제목 : <input type="text" id="boardTit" name="title" value="${boardDetail.title }"><br>
			내용 : <textarea rows="10" cols="50" id="boardCont" name="content">${boardDetail.content }</textarea>
			<hr>
			<input type="submit" id="updateBtn" value="수정">
		</form>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

</body>

<script type="text/javascript">
	$(document).ready(function() {
		if('${boardDetail.boardName}' == 'notice') {
			$('#board-name').text('공지사항');
			$('#fixNoticeBox').css('display','block');
			
			if(${boardDetail.status} == 0) {
				$('#fixNotice').prop('checked',true);
			}
			
		} else {
			$('#board-name').text('FAQ');
			$('#fixNoticeBox').css('display','none');
		}
		
		$('#updateBtn').click(function() {
			if($('#boardTit').val() == "") {
				alert('제목을 작성해주세요');
				$('#boardTit').focus();
				return false;
			}
			if($('#boardCont').val() == "") {
				alert('내용을 작성해주세요');
				$('#boardCont').focue();
				return false;
			}
			
			if($('#fixNotice').is(':checked')) {
				$('#boardStatus').val(0);
			} else {
				$('#boardStatus').val(1);
			}
		});
	});
</script>
</html>