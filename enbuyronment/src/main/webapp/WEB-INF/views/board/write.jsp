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
		<form method="post" id="boardForm">
			<select id="selBoard" name="boardName">
				<option value="" selected>게시판을 선택하세요</option>
				<option value="notice">공지사항</option>
				<option value="FAQ">FAQ</option>
			</select>
			<div id="fixNoticeBox"><input type="checkbox" id="fixNotice">공지 상단고정</div>
			<input type="hidden" id="boardStatus" name="status">
			<hr>
			제목 : <input type="text" id="boardTit" name="title"><br>
			내용 : <textarea rows="10" cols="50" id="boardCont" name="content"></textarea>
			<hr>
			<input type="button" id="boardBtn" value="작성">
		</form>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

</body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#selBoard').change(function() {
			if($('#selBoard').val() == 'notice') {
				$('#fixNoticeBox').css('display','block');
			} else {
				$('#fixNotice').prop('checked',false);
				$('#fixNoticeBox').css('display','none');
			}
		});
		
		$('#boardBtn').click(function() {
			if($('#selBoard').val() == "") {
				alert('게시판을 선택해주세요');
				return false;
			}
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
			
			$('#boardForm').submit();
		});
	});
</script>
</html>