<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
  <!--================ confirmation part start =================-->
  <section class="confirmation_part section_padding">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="confirmation_tittle">
          <h2>주문 확인</h2>
          <br><br>
            <span>주문이 완료되었습니다. 감사합니다!</span>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>주문 정보</h4>
            <ul>
              <li>
                <p>주문 번호</p><span>: 60235</span>
              </li>
              <li>
                <p>주문 날짜</p><span>: Oct 03, 2017</span>
              </li>
              <li>
                <p>총 결제 금액</p><span>: USD 2210</span>
              </li>
              <li>
                <p>결제 수단</p><span>: Check payments</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>수령인 정보</h4>
            <ul>
              <li>
                <p>받는 사람</p><span>: 김땡땡</span>
              </li>
              <li>
                <p>휴대폰 번호</p><span>: 01012341234</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>배송 정보</h4>
            <ul>
              <li>
                <p>주소지</p><span>: 11111111</span>
              </li>
              <li>
                <p>상세 주소</p><span>: 222222222222</span>
              </li>
              <li>
                <p>상세 주소2</p><span>: 3333333333</span>
              </li>
              <li>
                <p>우편번호</p><span>: 36952</span>
              </li>
              <li>
                <p>요청 사항</p><span>: 부재시 문앞에 놔주세요.</span>
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
                  <th class="col-7" colspan="2">상품 이름</th>
                  <th class="col-3">개수</th>
                  <th scope="col">가격</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th class="col-7" colspan="2"><span>에코백</span></th>
                  <th class="col-3">x01</th>
                  <th> <span>₩ 2160.00</span></th>
                </tr>
                <tr>
                <th scope="col" colspan="4"></th>
                </tr>
                <tr>
                  <th class="col-7" colspan="3">총 상품가격</th>
                  <th class="col-3"> <span>₩ 2160.00</span></th>
                </tr>
                <tr>
                  <th class="col-7" colspan="3">배송비</th>
                  <th class="col-3"><span>₩ 50.00</span></th>
                </tr>
              </tbody>
              <tfoot>
                <tr>
                  <th class="col-7" colspan="3">총 결제금액</th>
                  <th class="col-3"> <span>₩ 9999.00</span></th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================ confirmation part end =================-->

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

</body>
</html>