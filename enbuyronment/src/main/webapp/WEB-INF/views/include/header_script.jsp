<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
		$(document).ready(function() {
			$('#logoutBtn').click(function() {
				$.post('/user/logout', function(msg) {
					alert(msg);
					location.replace('/');
				});
			});

			$('#changeModeBtn').click(function() {
				$.post('/user/changeMode', function(msg) {
					alert(msg);
					location.replace('/');
				});

			});
			
			$('.Privacy-modal').click(function(){
		        $('#Privacy-modal-open').modal('show');
		        // 어드민 아이콘 - z-index로 모달 뒤에 넣긴 했는데
		        // 너무 부각되어 보이면 여기서 숨겨주셔도 되욤
		    });
			
			$('#loginBtn').click(function() {
				location.href='/user/login';
			});
			$('#joinBtn').click(function() {
				location.href='/user/join';
			});
			$('#myPageBtn').click(function() {
				location.href='/mypage/userinfo';
			});

		});
</script>