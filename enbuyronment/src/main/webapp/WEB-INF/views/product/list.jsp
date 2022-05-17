<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="/resources/main/image/x-icon"
	href="/resources/main/img/favicon.ico">
<link rel="stylesheet" href="/resources/product/css/main.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>

<section class="latest-product-area latest-padding">
	<div class="col-md-4">
        <div class="product_sidebar">
            <div class="single_sedebar">
                <input type="text" id="searchKeyword" placeholder="Search keyword">
                <i class="ti-search"></i>
            </div>
            <div class="single_sedebar">
                <div class="select_option">
                    <div class="select_option_list">브랜드<i class="right fa-caret-down fas"></i> </div>
                    <div class="select_option_dropdown">
                    	<p><a class="brandSort" id="on">전체</a></p>
                    	<c:forEach var="brandName" items="${brand }">
                        	<p><a class="brandSort">${brandName }</a></p>
                        	<i class="right fa-caret-down fas"></i>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row product-btn d-flex justify-content-between">
            <div class="properties__button">
                <!--Nav Button  -->
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" role="tab" aria-controls="nav-home" aria-selected="true">All</a>
                        <c:forEach var="cateName" items="${cate }">
	                        <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" role="tab" aria-controls="nav-contact" aria-selected="false">${cateName }</a>
                        </c:forEach>
                    </div>
                </nav>
                <!--End Nav Button  -->
            </div>
            <div class="select-this d-flex">
                <div class="featured">
                    <span>Sort by: </span>
                </div>
                <div class="select-itms">
                    <select name="select" id="select1">
                        <option value="1">최신순</option>
                        <option value="2">별점순</option>
                        <option value="3">높은가격순</option>
                        <option value="4">낮은가격순</option>
                    </select>
                </div>
            </div>
        </div>
        <!-- Nav Card -->
	    <div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			    <div class="row" id="prodBox">
			    </div>
			</div>
		</div>
        <!-- End Nav Card -->
	</div>
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@include file="/WEB-INF/views/include/script.jsp"%>
<%@include file="/WEB-INF/views/include/header_script.jsp"%>

<script type="text/javascript">
if("${msg}" == "registOK") {
	alert('상품 등록 완료');
}
if("${msg}" == "updateOK") {
	alert('상품 수정 완료');
}
if("${msg}" == "deleteOK") {
	alert('상품 삭제 완료');
}

$(document).ready(function() {
	function getProdList(pageNum, brandVal, cateVal, sort, keyword) {
		$.ajax({
			url: '/product/list',
			type: 'post',
			data: {
				'page' : pageNum,
				'brand' : brandVal,
				'cate' : cateVal,
				'sort' : sort,
				'keyword' : keyword
			},
			dataType: 'json',
			success: function(data) {
				if(data.endPage >= pageNum) {
					
					for(var i=0; i<data.prodList.length; i++) {
						$('#prodBox').append("<div class='col-xl-4 col-lg-4 col-md-6'>"+
					              "<div class='single-product mb-60'>"+
					              "<div class='product-img'>"+
					              "<a href='/product/"+data.prodList[i].prodNo+"'>"+
					                  "<img src='../upload/"+data.prodList[i].thumb+"'></div>"+
					              "<div class='product-caption'>"+
					                  "<div class='product-ratting'>"+
					                      "<i class='far fa-star'>"+data.prodList[i].star+"</i></div>"+
					                  "<h4>"+data.prodList[i].brandName+"</h4>"+
					                  "<h4>"+data.prodList[i].prodName+"</h4>"+
					                  "<h4>밑에 가격있음(흰글씨)</h4>"+
					                  "<div class='price'><ul>"+
					                          "<li>$"+data.prodList[i].price+"</li>"+
					                      "</ul></div></div></div></div>"
					     );
					}
				}
			}
		});
	}
	
	//페이지 첫 로딩 시
	getProdList(1, '전체', 'All', 1, '');
	
	//스크롤 시
	var page = 1;
	
	$(window).scroll(function() {
	    if($(window).scrollTop() == $(document).height() - $(window).height()) {
	      ++page;
	      getProdList(page, $('#on').text(), $("a[aria-selected='true']").text(), $('#select1').val(), $('#searchKeyword').val());
	    }
	});
	
	//브랜드 선택 시
	$(".brandSort").click(function() {
		$(".brandSort").attr('id','off');
		$(this).attr('id','on');
		$('.select_option_list').html($(this).text());
		
		$('#prodBox').empty();
		getProdList(1, $('#on').text(), $("a[aria-selected='true']").text(), $('#select1').val(), $('#searchKeyword').val());
		page = 1;
	});
	
	//용도 선택 시
	$('.nav-link').click(function() {
		$('#prodBox').empty();
		getProdList(1, $('#on').text(), $(this).text(), $('#select1').val(), $('#searchKeyword').val());
		page = 1;
	});
	
	//정렬 선택 시
	$('#select1').change(function() {
		$('#prodBox').empty();
		getProdList(1, $('#on').text(), $("a[aria-selected='true']").text(), $('#select1').val(), $('#searchKeyword').val());
		page = 1;
	});
	
	//검색 시
	$('.ti-search').click(function() {
		$('#prodBox').empty();
		getProdList(1, $('#on').text(), $("a[aria-selected='true']").text(), $('#select1').val(), $('#searchKeyword').val());
		page = 1;
	});
	
});
</script>
</body>
</html>