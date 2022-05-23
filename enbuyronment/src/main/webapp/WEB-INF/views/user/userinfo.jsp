<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>enbuyronment</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/assets/img/favicon.ico">
<%@include file="/WEB-INF/views/include/css.jsp"%>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<!-- Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="/resources/img/loading.png" alt="loding_logo">
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->

	<!-- sidebar include조각으로 넣어주기 -->
	<div class="container mt-5">
		<div class="row justify-content-between">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h3>회원 정보 조회 / 수정</h3>
				<form class="form mt-3" action="/mypage/modUser" method="post"
					onsubmit="return check()">
					<div class="row g-3">
						<div class="col-md-8 mb-3">
							<label for="staticEmail" class="form-label">아이디</label>
							<div class="input-group">
								<input type="text" readonly class="form-control"
									id="staticEmail" name="uid" value="${userInfo.uid }">
							</div>
						</div>
						<div class="col-md-8 mb-3">
							<label for="staticEmail" class="form-label">이메일</label>
							<div class="input-group">
								<input type="text" class="form-control" id="email" name="email"
									readonly="readonly" value="${userInfo.email }">
								<div class="justify-content-end">
									<input type="button" id="emailUpdateBtn" value="이메일 변경"
										class="form-control" />
								</div>
							</div>
						</div>
						<div class='col-md-8 mb-3'>
							<input type="button" class="form-control mb-3"
								id="emailCheckBtn" value="인증번호 보내기" readonly="readonly">
							<div class='input-group'>
								<input type='text' class='form-control' id='certifyNum'  
									placeholder='이메일로 보낸 인증번호를 입력해주세요' readonly="readonly" required="required">
								<div class='justify-content-end'>
									<input type='button' class='form-control' id='numCheckBtn'
										value='인증 번호 확인' readonly="readonly">
								</div>
							</div>
						</div>

						<div class="col-md-8 mb-3">
							<label for="inputPassword" class="form-label">현재 비밀번호</label>
							<div class="input-group">
								<input type="password" class="form-control" id="pass"
									name="pass" required="required">
								<div class="justify-content-end">
									<input type="button" id="updatePassBtn" value="비밀번호 변경"
										class="form-control"/>
								</div>
							</div>
						</div>
						<div class='col-md-8 mb-3'>
							<label class='form-label'>새 비밀번호</label>
							<div class='input-group'>
								<input type='password' class='form-control' id='newPass' name="newPass"
								placeholder='8 ~ 16자 영문, 숫자, 특수문자 조합' readonly="readonly" required="required">
							</div>
						</div>
						<div class='col-md-8 mb-3'>
							<label class='form-label'>새 비밀번호 확인</label>
							<div class='input-group'>
								<input type='password' class='form-control' id='newPassConfirm' readonly="readonly" required="required">
							</div>
						</div>

						<div class="col-md-8 mb-3">
							<label for="inputPassword" class="form-label">이름</label>
							<div class="input-group">
								<input type="text" class="form-control" id="name" name="name"
									value="${userInfo.name }">
							</div>
						</div>
						<div class="col-md-8 mb-3">
							<label for="inputPassword" class="form-label">연락처</label>
							<div class="input-group">
								<input type="tel" class="form-control" id="phone" name="phone"
									value="${userInfo.phone }">
							</div>
						</div>
						<div class="col-md-8 mb-3">
							<label class="form-label fs-5 fw-bold">주소(기본 배송지)</label>
							<div class="input-group">
								<input type="text" class="form-control" id="postcode"
									placeholder="우편번호" readonly required> <input
									type="button" id="updateAddress" class="form-control"
									onclick="execDaumPostcode()" value="기본 배송지 변경" />
							</div>
						</div>
						<div class="col-md-8 mb-3">
							<input type="text" class="form-control" id="address" value=""
								placeholder="주소" required readonly>
						</div>
						<div class="col-md-5 mb-3">
							<input type="text" class="form-control" id="detailAddress"
								value="" placeholder="상세주소" required readonly>
						</div>
						<div class="col-md-3">
							<input type="text" id="extraAddress" class="form-control"
								placeholder="기타항목" readonly>
						</div>

						<div class="col-md-8 mt-5 mb-3">
							<div class="input-group">
								<input type="submit" class="form-control btn enb-loginBtn"
									value="변경사항 적용하기">
							</div>
						</div>

					</div>
				</form>
			</div>
		</div>

	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<%@include file="/WEB-INF/views/include/script.jsp"%>
	<%@include file="/WEB-INF/views/include/header_script.jsp"%>

	<!-- 다음 우편주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
		
	</script>
	<script type="text/javascript">
	function execDaumPostcode() {
		  new daum.Postcode({
		    oncomplete: function (data) {
		      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		      var addr = ""; // 주소 변수
		      var extraAddr = ""; // 참고항목 변수

		      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		      if (data.userSelectedType === "R") {
		        // 사용자가 도로명 주소를 선택했을 경우
		        addr = data.roadAddress;
		      } else {
		        // 사용자가 지번 주소를 선택했을 경우(J)
		        addr = data.jibunAddress;
		      }

		      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		      if (data.userSelectedType === "R") {
		        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		        if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
		          extraAddr += data.bname;
		        }
		        // 건물명이 있고, 공동주택일 경우 추가한다.
		        if (data.buildingName !== "" && data.apartment === "Y") {
		          extraAddr +=
		            extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
		        }
		        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		        if (extraAddr !== "") {
		          extraAddr = " (" + extraAddr + ")";
		        }
		        // 조합된 참고항목을 해당 필드에 넣는다.
		        document.getElementById("extraAddress").value = extraAddr;
		      } else {
		        document.getElementById("extraAddress").value = "";
		      }

		      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		      document.getElementById("postcode").value = data.zonecode;
		      document.getElementById("address").value = addr;
		      // 커서를 상세주소 필드로 이동한다.
		      document.getElementById("detailAddress").focus();
		    },
		  }).open();
		}
	</script>
	<!-- 다음 우편주소 API -->
	<script type="text/javascript">
	let newPassCheck = false;
	let newEmailcheck = true;
	let certiNum;
	
	const passRegExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	const phoneRegExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
	const emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	const updatePassBtn = $("#updatePassBtn");
   	const passUpdateArea = $("#passUpdateArea");
	const newPass = $('#newPass');
	const newPassConfirm = $('#newPassConfirm');
	const emailCheckBtn = $('#emailCheckBtn');
	const emailCertifyArea = $("#emailCertifyArea");
	const emailUpdateBtn = $("#emailUpdateBtn");
	const emailInput = $("#emailInput");
	const certifyNum = $("#certifyNum");
	const numCheckBtn = $("#numCheckBtn");
	const email = $('#email');
	const phone = $('#phone');
	// 유효성 검증
	function check() {
		// 이메일 검증
		if (!newEmailcheck) {
			alert("이메일을 인증해주세요.");
			email.focus();
			return false;
		}
		
		// 새로운 비밀번호 검증
		if(newPassCheck){
			if (!passRegExp.test(newPass.val())) {
				alert("비밀번호는 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합해야 합니다.");
				newPass.focus();
				return false;
			}
			if (newPass.val() != newPassConfirm.val()) {
				alert("비밀번호가 일치하지 않습니다.");
				newPass.focus();
				return false;
			}
		}
		
		// 휴대폰 번호 검증
		if (!phoneRegExp.test(phone.val())) {
			alert("휴대폰 번호의 형식이 올바르지 않습니다.");
			phone.focus();
			return false;
		}
		
		return true;
	}
	
	$(document).ready(function () {
		let resMsg = "${msg }";
		if( resMsg == "fail"){
			alert('비밀번호가 틀렸습니다.');
		} else if( resMsg == "success"){
			alert('회원 정보가 수정되었습니다.');
		}
		
		  // 비밀번호 변경 버튼 클릭시
		  updatePassBtn.click(function () {
			  newPassCheck = true;
			  newPass.prop("readonly", false);
			  newPassConfirm.prop("readonly", false);
		  });

		  emailUpdateBtn.click(function () {
			  if(email.attr('readonly')){
				  newEmailcheck = false;
				  email.prop("readonly", false);
				  emailCheckBtn.prop("readonly", false);
				  certifyNum.prop("readonly", false);
				  numCheckBtn.prop("readonly", false);
			  } else {
				  newEmailcheck = true;
				  email.prop("readonly", true);
				  certifyNum.prop("readonly", true);
				  numCheckBtn.prop("readonly", true);
				  emailCheckBtn.prop("readonly", true);
			  }
		  });
		
		  // 이메일에 인증번호 보내기
		  emailCheckBtn.click(function() {
			  if (emailRegExp.test(email.val())) {
				  $.ajax({
					  url : '/user/checkEmail',
					  type : 'post',
					  contentType : "application/text; charset=utf-8",
					  data : email.val(),
					  success : function(msg) {
						  if (msg == '인증실패') {
							  alert('인증에 실패했습니다. 이메일을 다시 입력해주세요');
						  } 
						  else {
							  certiNum = msg;
							  email.attr("readonly", true);
							  alert('인증번호를 발급하였습니다. 이메일을 확인해주세요');
						  }
					  }
				  });
			  } else {
				  alert('이메일 형식이 올바르지 않습니다.');
			  }
		  });

		  // 인증번호 확인
		  numCheckBtn.click(function() {
			  if (certiNum == $('#certifyNum').val()) {
				  newEmailcheck = true;
				  $('#certifyNum').attr("readonly", true);
				  emailCheckBtn.prop("readonly", true);
				  emailUpdateBtn.prop("readonly", true);
				  alert('정상적으로 인증되었습니다. 나머지 정보를 입력해주세요');
			  } else {
				  alert('인증번호가 틀렸습니다. 다시 입력해주세요');
			  }
		  });

		  
	});
	</script>

</body>
</html>