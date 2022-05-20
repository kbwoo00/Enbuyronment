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
					                  <th class="col-3" style="padding : 0px !important;">상품 이름</th>
					                  <th class="col-2" style="padding : 0px !important;">개수</th>
					                  <th class="col-2" style="padding : 0px !important;">예상 적립금</th>
					                  <th class="col-2" style="padding : 0px !important;">가격</th>
					                </tr>
					              </thead>
					              <tbody>
					                <tr>
					                  <th class="col-3"><span><img src="/resources/assets/img/T1.jpg" width="100" height="100"></span></th>
					                  <th class="col-3"><span>에코백</span></th>
					                  <th class="col-2">x01</th>
					                  <th class="col-2">100원</th>
					                  <th class="col-2"><span>2160원</span></th>
					                </tr>
					              </tbody>
					            </table>
					          </div>
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
							          	<div class="col-md-12 row contact_form" >
								              <div class="row col-md-12 col-form-label order-input">
									                <label for="name" class="col-sm-2"><i class="fa fa-user"></i>  성함</label>
													<div class="col-sm-10">
														<input type="text" id="name" name="name" placeholder="김땡땡">
									            	</div>
								              </div>
								              
								              <div class="row col-md-12 col-form-label order-input">
									                <label for="name" class="col-sm-2"><i class="fa fa-phone"></i>  핸드폰</label>
													<div class="col-sm-10">
														<input type="text" id="phone" name="phone" placeholder="01012345678">
									            	</div>
								              </div>
								              
								              <div class="row col-md-12 col-form-label order-input">
									                <label for="name" class="col-sm-2"><i class="fa fa-envelope"></i>  이메일</label>
													<div class="col-sm-10">
														<input type="text" id="email" name="email" placeholder="admin@example.com">
									            	</div>
								              </div>
								              
								              <div class="row col-md-12 col-form-label order-input" style="margin-top: 3rem;">
								                	<label for="name" class="col-sm-2"><i class="fas fa-map-marker"></i>  수령인 정보</label>
								                	
													<div class="col-sm-10">
														<input type="text" id="email" name="email" placeholder="수령인 이름">
													</div>
															            	
													<div class="row col-md-12 col-form-label order-input" style="margin-top: 1rem;">
														<label for="name" class="col-sm-2"><i class="#"></i></label>
														<div class="col-sm-10">
															<input type="text" id="email" name="email" placeholder="수령인 연락처">
														</div>
													</div>
													
								                	<div class="row col-md-12 col-form-label order-input" style="margin-top: 1rem;">
														<label for="name" class="col-sm-2"><i class="#"></i></label>
														<div class="col-sm-6">
															<input type="text" id="adr" name="address" placeholder="우편번호">
															<p>배송지 명 : 집</p>
										            	</div>
										            	<div class="col-sm-4">
												    		<button type="submit" id="addrbtn" class="btn enb-loginBtn col align-self-end" style="padding: 1.3rem 1.3rem !important;">주소 변경</button>
										            	</div>
									            	</div>
									            	
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
													         			<input style="width:80%"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
													         		</div>
													         		
													            	<div class="col-sm-7">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
																		<input type="text" id="sample6_postcode" placeholder="우편번호">
													            	</div>
													            	
																	<div class="row-cols-lg-auto col align-self-end">
																		<input type="button" class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
																	</div>
																	
																	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
																		<div class="col-sm-10">
																			<input type="text" id="sample6_address" placeholder="주소">
														            	</div>
													              	</div>
													              	
													              	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
																		<div class="col-sm-10">
																			<input type="text" id="sample6_extraAddress" placeholder="상세주소">
														            	</div>
													              	</div>
													              	
													              	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
																		<div class="col-sm-10">
																			<input type="text" id="sample6_detailAddress" placeholder="상세주소2">
														            	</div>
													              	</div>
																</div>
													      	</div>
													      <hr>
													      
													      	<div class="adr">
														      	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														      		<div class="col-2">
													         			<input style="width:80%"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
													         		</div>
													         		
													            	<div class="col-sm-7">
																		<input type="text" placeholder="우편번호">
													            	</div>
													            	
																	<div class="col align-self-end">
																		<span style="color:#888888"><i class="fa fa-times" style="display : flex; flex-direction: row-reverse;"></i></span>
																	</div>
																	
																	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
																		<div class="col-sm-10">
																			<input type="text" placeholder="주소">
														            	</div>
													              	</div>
													              	
													              	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
														                
																		<div class="col-sm-10">
																			<input type="text" placeholder="상세주소">
														            	</div>
													              	</div>
													              	
													              	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
																		<div class="col-sm-10">
																			<input type="text" placeholder="상세주소2">
														            	</div>
													              	</div>
																</div>
													      	</div>
													      	<hr>
													      	
													      	<div class="adr">
														      	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
													         		<div class="col-2">
													         			<input style="width:80%"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
													         		</div>
													         		
													            	<div class="col-sm-7">
																		<input type="text" placeholder="우편번호">
													            	</div>
													            	
																	<div class="col align-self-end">
																		<span style="color:#888888"><i class="fa fa-times" style="display : flex; flex-direction: row-reverse;"></i></span>
																	</div>
																	
																	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
																		<div class="col-sm-10">
																			<input type="text" placeholder="주소">
														            	</div>
													              	</div>
													              	
													              	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
														                
																		<div class="col-sm-10">
																			<input type="text" placeholder="상세주소">
														            	</div>
													              	</div>
													              	
													              	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
																		<div class="col-sm-10">
																			<input type="text" placeholder="상세주소2">
														            	</div>
													              	</div>
													              	
													              	<div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
														                <label for="name" class="col-sm-2"><i class="#"></i></label>
													              	</div>
																</div>
													      	</div>
													      
													      </div>	
													      <div class="modal-footer">
													        <button type="submit" class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;">배송지 추가</button>
													        <button type="submit" class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;">배송지 선택</button>
													        <button type="submit" id="closebtn" class="btn enb-loginBtn" style="padding: 1.3rem 1.3rem !important;"> 닫기</button>
													      </div>
													    </div>
													  </div>
													</div>
											  	</div>
											  	
								              </div>
								              
								              <div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
									                <label for="name" class="col-sm-2"><i class="#"></i></label>
													<div class="col-sm-10">
														<input type="text" id="email" name="email" placeholder="주소">
									            	</div>
								              </div>
								              
								              <div class="row col-md-12 col-form-label order-input" style="margin-top: 0rem;">
									                <label for="name" class="col-sm-2"><i class="#"></i></label>
													<div class="col-sm-10">
														<input type="text" id="email" name="email" placeholder="상세주소">
									            	</div>
								              </div>

								              <div class="row col-md-12 col-form-label order-input" style="margin-top: 1rem;">
									                <label for="name" class="col-sm-2"><i class="#"></i></label>
													<div class="col-sm-10">
														<input type="text" placeholder="상세주소2">
									            	</div>
								              </div>
								              
											<div class="row col-md-12 col-form-label order-input" style="margin-top: 1rem;">
									            <label for="name" class="col-sm-2"><i class="#"></i></label>
									            	<div class="col-sm-3">
														<select id="request" class="select-group col-md-auto" name="request">
															<option value="" disabled="disabled" selected="selected">요청사항을 선택해주세요.</option>
															<option value="1">부재시 경비실에 맡겨주세요.</option>
															<option value="2">집앞에 놔주세요.</option>
															<option value="3">택배함에 놔주세요.</option>
															<option value="4">집으로 직접 배송해주세요.</option>
															<option value="5">배송전에 꼭 연락해주세요.</option>
															<option value="0">직접입력</option>
														</select>
									            	</div>
													<div class="col-sm-7">
														<input type="text" id="requestFree" name="requestFree" placeholder="직접입력">
									            	</div>
								              </div>
								              <div class="row col-md-12 col-form-label order-input">
									                <label for="name" class="col-sm-2"><i class="fa fa-circle-o-notch" aria-hidden="true"></i>   포인트</label>
													<div class="col-md-8">
														<input type="text" id="email" name="email" placeholder="110p">
														<p>잔여 포인트 : 0p</p>
									            	</div>
									            	<div class="row-cols-lg-auto">
												    	<button type="submit" id="pntbtn" class="btn enb-loginBtn col align-self-end" style="padding: 1.3rem 1.3rem !important;">모두 사용</button>
												   </div>
								              </div>

												<div id="orderPrice" class="total-price col mb-3">
													 <div class="total-price">총 상품금액 : 12,420원</div>
													 <div class="total-price">배송비 : 0원</div>
													 <div class="total-price">할인 금액 : -110원</div>
													 <hr>
													 <div class="total-price">최종결제 금액 : 11,310원</div>
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

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>
</body>

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
	
    
	$('#addrbtn').click(function(){
		$('#testModal').modal('show');
	}); //모달창 오픈
	
	$('#closebtn').click(function(){
		$('#testModal').modal('hide');
	}); // 모달창 닫힘
	
	$(document).ready(function() {
		$("#requestFree").hide();
		
		$("#request").change(function() {
				if($("#request").val() == 0) {
					$("#requestFree").show();
				}  else {
					$("#requestFree").hide();
				}
			});
	}); // 직접입력햇을때 input창 보이게
</script>
</html>

