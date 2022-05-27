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
  border-bottom: 1px solid #485549;
  outline: 0;
  }

</style>

</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<main>
		<div class="container mt-5 col-md-12">
			<div id="board-name" style="font-size:30px;"></div><br>
			<form method="post">
				<div class="col-md-3" style="display:flex; width:300px; padding-left:100px;">
					<div id="fixNoticeBox" style="display:flex;">
						<input type="checkbox" id="fixNotice" style="width:15px;">  공지 상단고정
					</div>
					<input type="hidden" id="boardStatus" name="status">
				</div>
				<div class="row" style="display:flex; justify-content: center;">
					<div class="col-md-10 mt-4">
						<div class="col-md-12 mb-3" style="padding-left:0px;">
							<input type="text" id="boardTit" name="title" value="${boardDetail.title }" placeholder="제목을 입력하세요"><br>
						</div>
						<textarea rows="10" cols="110" id="boardCont" name="content" placeholder="내용을 입력하세요">${boardDetail.content }</textarea>
					</div>
				</div>
				<hr>
				<div class="col-md-2" style="display:flex; display-wrap:wrap; float:right;">
					<input class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" type="submit" id="updateBtn" value="수정"> &nbsp;
					<input class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" type="button" onclick="history.back()" value="취소">
				</div>
			</form>
		</div>
	</main>

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