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

			})

		});
</script>