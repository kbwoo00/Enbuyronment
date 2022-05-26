<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>enbuyronment</title>
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
	<div class="container  mt-5 col-md-12">
		<form method="post" id="boardForm">
			<select id="selBoard" name="boardName">
				<option value="" selected>게시판을 선택하세요</option>
				<option value="notice">공지사항</option>
				<option value="FAQ">FAQ</option>
			</select>
			<div id="fixNoticeBox"><input type="checkbox" id="fixNotice">공지 상단고정</div>
			<input type="hidden" id="boardStatus" name="status"><br><br>
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
				<input class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" type="button" id="boardBtn" value="작성">
			</div>
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