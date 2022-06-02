<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="/resources/main/image/x-icon"
	href="/resources/main/img/favicon.ico">
<link rel="stylesheet" href="/resources/product/css/order_style.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
<main>
  <!--================ confirmation part start =================-->
  <section class="confirmation_part section_padding" style="padding: 100px 0px !important;">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="confirmation_tittle">
            <span>주문이 완료되었습니다. 감사합니다!</span>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>주문 정보</h4>
            <ul>
              <li>
                <p>주문 번호</p><span>: ${orderInfo.orderNo }</span>
              </li>
              <li>
                <p>주문 날짜</p><span>: 
                	<fmt:formatDate value="${orderInfo.orderDate }" dateStyle="medium"/></span>
              </li>
              <li>
                <p>수령인</p><span>: ${orderInfo.receiver }</span>
               </li>
               <li>
                <p>수령인 연락처</p><span>: ${orderInfo.phone }</span>
              </li>
            </ul>
          </div>
        </div>
        
      <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>배송 정보</h4>
            <ul>
              <li style="padding-left: 30% !important;">
                <p>우편번호</p><span>: ${orderInfo.postcode }</span>
              </li>
              <li style="padding-left: 30% !important;">
                <p>주소</p><span>: ${orderInfo.addr }</span>
              </li>
              <li style="padding-left: 30% !important;">
                <p></p><span>&nbsp;${orderInfo.exAddr }&nbsp;${orderInfo.dtAddr }</span>
              </li>
              <li style="padding-left: 30% !important;">
                <p>요청 사항</p><span>: ${orderInfo.request }</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-lg-12">
          <div class="order_details_iner">
            <h3>결제 내역</h3>
            <table class="table table-borderless align-middle">
              <thead>
                <tr>
                  <th class="col-8 text-center">상품 이름</th>
                  <th class="col-2 text-center">개수</th>
                  <th class="col-2 text-center">가격</th>
                </tr>
              </thead>
              <tbody>
                 <c:forEach var="orderProd" items="${orderProdList }" varStatus="status">
                   <tr>
                     <th class="col-8"><span>[${orderProd.brandName }] ${orderProd.prodName }</span></th>
                     <th class="col-2 text-center">${orderProd.amount }</th>
                     <th class="col-2 text-center"><span class="price${status.index }">${orderProd.price*orderProd.amount }</span></th>
                   </tr>
                 </c:forEach>
                <tr>
                	<th scope="col" colspan="3"></th>
                </tr>
                <tr>
                	<th scope="col" colspan="3"></th>
                </tr>
                <tr>
                   <th class="col text-right" colspan="3" style="padding: 1rem !important;">총 상품가격 : <span class="totalPrice"></span></th>
                </tr>
                <tr>
                  <th class="col text-right" colspan="3" style="padding: 1rem !important;">배송비 : <span class="totalShipcost"></span></th>
                </tr>
                <tr>
                  <th class="col text-right" colspan="3" style="padding: 1rem !important;">사용 포인트 : <span>${orderInfo.pointDown }p</span></th>
                </tr>
              </tbody>
              <tfoot>
                <tr>
                  <th class="col text-right" colspan="3" style="padding: 1rem !important;">총 결제금액 : <span class="orderPrice"></span></th>
                </tr>
                <tr>
                  <th class="col text-right" colspan="3" style="padding: 1rem !important;">총 적립 포인트 : <span>${orderInfo.pointUp }p</span></th>
                </tr>
              </tfoot>
            </table>
          </div>
          <input type="button" class="col-md-6 mt-5 btn enb-loginBtn" id="toDetailOrder" value="주문 상세보기">
        </div>
      </div>
    </div>
  </section>
  <!--================ confirmation part end =================-->
	</main>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		var totalPrice = 0;
		const orderNo = "${orderInfo.orderNo }";
		
		for(var i=0; i<${orderProdList.size()}; i++) {
			totalPrice += Number($('.price'+i).text());
		}
		
		$('.totalPrice').text(totalPrice.toLocaleString()+'원');
		
		if(totalPrice < 20000) {
			$('.totalShipcost').text('2,000원');
			$('.orderPrice').text((totalPrice + 2000 - ${orderInfo.pointDown}).toLocaleString()+'원');
			
		} else {
			$('.totalShipcost').text(0+'원');
			$('.orderPrice').text((totalPrice - ${orderInfo.pointDown}).toLocaleString()+'원');
		}
		
		$('#toDetailOrder').click(function() {
			location.replace('/mypage/order/' + orderNo);
		});
	});
</script>

</html>