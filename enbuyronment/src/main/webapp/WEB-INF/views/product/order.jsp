<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="/WEB-INF/views/include/css.jsp"%>

<style type="text/css">
input {
  width: 100%;
  border: 0;
  border-bottom: 1px solid #86A688;
  outline: 0;
  }
  
.table th {
	vertical-align: middle!important;
}

.total-price {
	padding-right : 25px !important;
	padding-left : 20px !important;
}
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>

</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
<br>
	<div class="row order_body" style="display: flex; justify-content: center;">
		<div class="col-6">
			<div class="order_container">
				<div class="page-wrapper">
					<div class="wrapper">
					
						<!--================주문 상품 =================-->
						<section class="confirmation_part section_padding" style="padding : 0px !important; padding-bottom: 50px !important;">
					      <div class="row">
					        <div class="col-lg-12">
					          <div class="order_details_iner" style="padding: 3rem !important;">
					            <h3 style="font-size:27px;">주문 상품</h3>
					            <table class="table table-borderless text-center">
					              <thead>
					                <tr>
					                  <th class="col-3" style="padding : 0px !important;">상품 이미지</th>
					                  <th class="col-5" style="padding : 0px !important;">상품 이름</th>
					                  <th class="col-2" style="padding : 0px !important;">개수</th>
					                  <th class="col-2" style="padding : 0px !important;">가격</th>
					                </tr>
					              </thead>
					              <tbody>
					              <c:forEach var="order" items="${orderList }" varStatus="status">
					                <tr>
					                  <td class="col-3"><span><img src="../upload/${order.thumb }" width="50" height="50"></span></td>
					                  <td class="col-5"><span>[${order.brandName}] ${order.prodName }</span></td>
					                  <td class="col-2">x${order.amount }</td>
					                  <td class="col-2" id="total-cost${status.index }">${order.price * order.amount }</td>
					                 </tr>
					               </c:forEach>
					              </tbody>
					            </table>
					          </div>
					        </div>
					      </div>
					  </section>
					  <!--================주문 상품 =================-->
					  
					<div class="card card-4">
						<div class="card-body" style="padding: 3rem">
							<h3 class="col row mb-3">주문서</h3>
							<div class="row" style="display: flex; justify-content: center;">
						    	<div class="row justify-content-around">
						          	<div class="col-md-12 row contact_form">
							              <div class="row col-md-12 col-form-label order-input">
								                <label for="name" class="col-sm-2"><i class="fa fa-user"></i>성함</label>
												<div class="col-sm-10">
													<input type="text" id="name" name="name" value="${userInfo.name }" readonly>
								            	</div>
							              </div>
							              
							              <div class="row col-md-12 col-form-label order-input">
								                <label for="name" class="col-sm-2"><i class="fa fa-phone"></i>핸드폰</label>
												<div class="col-sm-10">
													<input type="text" id="phone" name="phone" value="${userInfo.phone }" readonly>
								            	</div>
							              </div>
							              
							              <div class="row col-md-12 col-form-label order-input">
								                <label for="name" class="col-sm-2"><i class="fa fa-envelope"></i>이메일</label>
												<div class="col-sm-10">
													<input type="text" id="email" name="email" value="${userInfo.email }" readonly>
								            	</div>
							              </div>
							              
							              <div class="row col-md-12 col-form-label order-input" style="margin-top: 3rem;">
							                	<label for="name" class="col-md-auto"><i class="fas fa-map-marker"></i>수령인 정보</label>
							                	
												<div class="col-sm-10">
													<input type="text" id="email" class="receiver" name="email" value="${userInfo.name }">
												</div>
												
												<div class="row col-md-12 col-form-label order-input" style="margin-top: 1rem;">
													<label for="name" class="col-sm-2"><i class=""></i></label>
													<div class="col-sm-10">
														<input type="text" id="email" class="receiver-phone" name="email" value="${userInfo.phone }">
													</div>
												</div>
							              </div>
												
										 <c:forEach var="addr" items="${userAddr }">
											<c:if test="${addr.status eq 0 }">
							                	<div class="row col-md-12 col-form-label order-input" style="margin-top: 1rem;">
													<label for="name" class="col-sm-2"><i class="#"></i></label>
													<p class="addrName">${addr.addrName }</p>
									            	<div class="col-sm-4">
											    		<button type="button" id="addrbtn" class="btn enb-loginBtn col align-self-end" style="padding: 1.3rem 1.3rem !important;">배송지 변경</button>
									            	</div>
								            	</div>
								            	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
								            		<label for="name" class="col-sm-2"><i class="#"></i></label>
													<div class="col-sm-10">
														<input type="text" id="adr" name="address" placeholder="우편번호" value="${addr.postcode }" readonly>
									            	</div>
									            </div>
								                <div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
									                <label for="name" class="col-sm-2"><i class="#"></i></label>
													<div class="col-sm-10">
														<input type="text" id="email" class="addr" name="email" placeholder="주소" value="${addr.addr }" readonly>
									            	</div>
								                </div>
								                <div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
									                <label for="name" class="col-sm-2"><i class="#"></i></label>
													<div class="col-sm-10">
														<input type="text" id="email" class="dtaddr" name="email" placeholder="상세주소" value="${addr.dtAddr }" readonly>
									            	</div>
								                </div>
								                <div class="row col-md-12 col-form-label order-input" style="margin-top: 1rem;">
									                <label for="name" class="col-sm-2"><i class="#"></i></label>
													<div class="col-sm-10">
														<input type="text" class="exaddr" placeholder="참고항목" value="${addr.exAddr }" readonly>
									            	</div>
								                </div>
							            	</c:if>
							             </c:forEach>
							              
										<div class="row col-md-12 col-form-label order-input" style="margin-top: 1rem;">
								            <label for="name" class="col-sm-2"><i class="#"></i></label>
							            	<div class="col-sm-3">
												<select id="request" class="select-group col-md-auto" name="request">
													<option value="" disabled="disabled" selected="selected">요청사항을 선택해주세요</option>
													<option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요</option>
													<option value="집 앞에 놔주세요">집 앞에 놔주세요</option>
													<option value="택배함에 넣어주세요">택배함에 넣어주세요</option>
													<option value="직접 배송해주세요">직접 배송해주세요</option>
													<option value="배송전에 꼭 연락해주세요">배송전에 꼭 연락해주세요</option>
													<option value="0">직접입력</option>
												</select>
							            	</div>
											<div class="col-sm-7">
												<input type="text" id="requestFree" name="requestFree" placeholder="직접입력">
							            	</div>
							              </div>
							              <div class="row col-md-12 col-form-label order-input">
								                <label for="name" class="col-sm-2"><i class="fa fa-circle-o-notch" aria-hidden="true"></i>포인트</label>
												<div class="col-md-8">
													<input type="number" id="email" name="email" class="point" value="0">
													<p>잔여 포인트 : ${userInfo.point }p</p>
								            	</div>
								            	<div class="row-cols-lg-auto">
											    	<button type="submit" id="pntbtn" class="btn enb-loginBtn col align-self-end" style="padding: 1.3rem 1.3rem !important;">사용</button>
											    </div>
							                </div>

											<div id="orderPrice" class="total-price col mb-3">
												 <div class="total-price" id="total-price"></div>
												 <div class="total-price" id="ship-price"></div>
												 <div class="total-price" id="used-point"></div>
												 <hr>
												 <div class="total-price" id="order-price"></div>
												 <div class="total-price" id="total-point"></div>
												 <br>
										   		 <button id="paymentBtn" class="order_btn col-6 enb-loginBtn" style="float: none; margin: 0 auto; display: flex; justify-content: center;">결제하기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 모달창 -->
    <div class="row-cols-lg-auto">
    	<div class="modal fade" id="testModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">배송지 목록</h5>
		      </div>
		        
		      <div class="modal-body">
		      	<div class="add-adr">
			      	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
		         		<div class="col-2">
		         			<select class="addrList" style="width:80%">
		         				<c:forEach var="addr" items="${userAddr }">
			         				<option value="${addr.addrName }">${addr.addrName }</option>
		         				</c:forEach>
		         				<option value="new-addr">신규 배송지</option>
		         			</select>
		         		</div>
		         		
		         		<c:forEach var="addr" items="${userAddr }">
		         			<c:if test="${addr.status eq 0 }">
				            	<div class="row col-md-12 col-form-label order-input" style="margin-top: 1rem;">
									<label for="name" class="col-sm-2"><i class="#"></i></label>
									<input type="text" class="addrName2" value="${addr.addrName }" readonly>
					            	<div class="row-cols-lg-auto col align-self-end" id="modalAddrBtn">
										<input type="button" class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									</div>
				            	</div>
				            	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
				            		<label for="name" class="col-sm-2"><i class="#"></i></label>
									<div class="col-sm-10">
										<input type="text" id="sample6_postcode" class="adr2" name="address" placeholder="우편번호" value="${addr.postcode }" readonly>
					            	</div>
					            </div>
				                <div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
					                <label for="name" class="col-sm-2"><i class="#"></i></label>
									<div class="col-sm-10">
										<input type="text" id="sample6_address" class="addr2" name="email" placeholder="주소" value="${addr.addr }" readonly>
					            	</div>
				                </div>
				                <div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
					                <label for="name" class="col-sm-2"><i class="#"></i></label>
									<div class="col-sm-10">
										<input type="text" id="sample6_detailAddress" class="dtaddr2" name="email" placeholder="상세주소" value="${addr.dtAddr }" readonly>
					            	</div>
				                </div>
				                <div class="row col-md-12 col-form-label order-input" style="margin-top: 1rem;">
					                <label for="name" class="col-sm-2"><i class="#"></i></label>
									<div class="col-sm-10">
										<input type="text" id="sample6_extraAddress" class="exaddr2" placeholder="참고항목" value="${addr.exAddr }" readonly>
					            	</div>
				                </div>
			                </c:if>
		                </c:forEach>
					</div>
		      	</div>
		      </div>
		      <div class="modal-footer">
		        <button type="submit" class="btn enb-loginBtn" id="selAddrBtn" style="padding: 1.3rem 1.3rem !important;">배송지 선택</button>
		        <button type="submit" id="closebtn" class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;"> 닫기</button>
		      </div>
		      
		    </div>
		  </div>
		</div>
  	</div>
  	<!-- 모달창 -->

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>
</body>

<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    
    //모달창
	$('#addrbtn').click(function(){
		$('#testModal').modal('show');
	});
	
	$('#closebtn').click(function(){
		$('#testModal').modal('hide');
	});
	
	
	//요청사항
	$(document).ready(function() {
		$("#requestFree").hide();
		
		$("#request").change(function() {
				if($("#request").val() == 0) {
					$("#requestFree").val("");
					$("#requestFree").show();
					
				}  else {
					$("#requestFree").val($("#request").val());
					$("#requestFree").hide();
				}
			});
	});
	
    
    //금액 및 포인트 정보
    var totalPrice = 0;
    var orderPrice = null;
	
    for(var i=0; i<${orderList.size()}; i++) {
    	totalPrice += Number($('#total-cost'+i).text());
    }
    $('#total-price').text('총 상품금액 : '+totalPrice+'원');
    $('#used-point').text('사용 포인트 : 0p');
    
    if(totalPrice < 20000) {
    	orderPrice = (totalPrice + 2000 - $('.point').val());
    	
    	$('#ship-price').text('배송비 : 2,000원');
	    $('#order-price').text('최종결제 금액 : '+orderPrice+'원');
	    $('#total-point').text('적립 포인트 : '+Math.floor((totalPrice - $('.point').val())/100)+'p');
	    
    } else {
    	orderPrice = (totalPrice - $('.point').val());
    	
    	$('#ship-price').text('배송비 : 0원');
    	$('#order-price').text('최종결제 금액 : '+orderPrice+'원');
    	$('#total-point').text('적립 포인트 : '+Math.floor((totalPrice - $('.point').val())/100)+'p');
    }
    
    //배송지 목록 변경
    $('.addrList').change(function() {
    	if($('.addrList').val() == 'new-addr') {
    		$('#modalAddrBtn').css('display','block');
    		$('.exaddr2').removeAttr('readonly');
    		$('.addrName2').removeAttr('readonly');
    		
    		$('.addrName2').val('');
			$('.adr2').val('');
			$('.addr2').val('');
			$('.dtaddr2').val('');
			$('.exaddr2').val('');
			
    	} else {
    		$('#modalAddrBtn').css('display','none');
    		$('.exaddr2').attr('readonly','readonly');
    		$('.addrName2').attr('readonly','readonly');
    		
	    	$.ajax({
	    		url: '/order/getAddr',
	    		type: 'post',
	    		data: JSON.stringify({
	    			'addrName' : $('.addrList').val()
	    		}),
	    		contentType: 'application/json; charset=utf-8',
	    		success: function(result) {
	    			$('.addrName2').val(result.addrName);
	    			$('.adr2').val(result.postcode);
	    			$('.addr2').val(result.addr);
	    			$('.dtaddr2').val(result.dtAddr);
	    			$('.exaddr2').val(result.exAddr);
	    		}
	    	});
    	}
    });
    
    //배송지 선택
    $('#selAddrBtn').click(function() {
    	$('.addrName').text($('.addrName2').val());
		$('#adr').val($('.adr2').val());
		$('.addr').val($('.addr2').val());
		$('.dtaddr').val($('.dtaddr2').val());
		$('.exaddr').val($('.exaddr2').val());
		
		$('#testModal').modal('hide');
    });
    
    
    //포인트 사용
    $('#pntbtn').click(function() {
    	$('.point').next().text('잔여 포인트 : '+(${userInfo.point} - $('.point').val())+'p');
    	$('#used-point').text('사용 포인트 : '+$('.point').val()+'p');
		
		if(totalPrice < 20000) {
		    orderPrice = totalPrice + 2000 - $('.point').val();
	    } else {
	    	orderPrice = totalPrice - $('.point').val();
	    }
    	
   	    $('#order-price').text('최종결제 금액 : '+orderPrice+'원');
   	 	$('#total-point').text('적립 포인트 : '+Math.floor((totalPrice - $('.point').val())/100)+'p');
    });
    
    
    //결제하기
	$('#paymentBtn').click(function() {
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp87815658");
		
	      // IMP.request_pay(param, callback) 결제창 호출
	      IMP.request_pay({ // param
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: Date.now() + "" + Math.floor(Math.random()*1000),    //주문번호
	          name: "${orderList.get(0).prodName} 외",    //상품명
	          amount: orderPrice,    //가격
	          buyer_email: "${userInfo.email}",
	          buyer_name: "${userInfo.name}",
	          buyer_tel: "${userInfo.phone}",
	          buyer_addr: $('.addr').val() + " " + $('.exaddr').val() + " " + $('.dtaddr').val(),
	          buyer_postcode: $('#adr').val()
	          
	      }, function (rsp) { // callback
	    	  if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	    		  alert("결제가 완료되었습니다!");
    	          
	      		  var data = {
	      			  'orderNo' : rsp.merchant_uid,
  	                  'pointDown' : $('.point').val(),
  	                  'pointUp' : Math.floor((totalPrice - $('.point').val())/100),
  	                  'addrName' : $('.addrName').text(),
  	                  'postcode' : $('#adr').val(),
  	                  'addr' : $('.addr').val(),
  	                  'dtAddr' : $('.dtaddr').val(),
  	                  'exAddr' : $('.exaddr').val(),
  	                  'receiver' : $('.receiver').val(),
  	                  'phone' : $('.receiver-phone').val(),
  	                  'request' : $("#requestFree").val(),
	      		  };
	      		  
    	     	  $.ajax({
    	              url: "/order/postOrder",
    	              type : 'post',
					  dataType : "text",
					  contentType : "application/json; charset=utf-8",
    	              data: JSON.stringify(data),
    	              success: function(result) {
    	            	  location.href="/order/"+rsp.merchant_uid;
    	              }
    	          });
    	     	  
    	      } else {
    	        alert("결제에 실패하였습니다. " +  rsp.error_msg);
    	      }
	      });
	});
</script>
</html>

