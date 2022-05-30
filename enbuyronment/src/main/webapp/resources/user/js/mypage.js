$(document).ready(function() {
	$('.mypage-menu').each(function(i, item) {
		if (location.pathname.indexOf($(item).attr('href')) == 0) {
			$(item).attr('class', 'mypage-menu-active');
		}
	});
});