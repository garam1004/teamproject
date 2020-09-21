<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<!DOCTYPE html>
<html lang="zxx">
<head>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//아이디
		$("#id").keyup(function() {
			var id = $.trim($(this).val());
			$(this).val(id);
			$("#idInfo").load("join_IDCheck.jsp?id=" + id);
		});
		//비밀번호
		var c_pwd = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
		$('#pwd')
				.keyup(
						function() {
							if (!c_pwd.test($("#pwd").val())) {
								$('span[name=c_pwd]').text('');
								$('span[name=c_pwd]')
										.html(
												"<span style='color:red;'><i class='fa fa-remove'>최소 8자리 숫자, 문자, 특수문자 각각 1개 이상 포함</i></span>");
							} else {
								$('span[name=c_pwd]').text('');
								$('span[name=c_pwd]')
										.html(
												"<span style='color:blue;'><i class='fa fa-check'></i></span>");
							}
							$('span[name=c_pwd2]').text('');
						});
		$("#pwd").blur(function() {
			if (!c_pwd.test($("#pwd").val())) {
				$("#pwd").val("");
			}
		});
		//비밀번호 확인
		$('#pwd2')
				.keyup(
						function() {
							if ($('#pwd').val() != $('#pwd2').val()) {
								$('span[name=c_pwd2]').text('');
								$('span[name=c_pwd2]')
										.html(
												"<span style='color:red;'><i class='fa fa-remove'></i></span>");
							} else {
								$('span[name=c_pwd2]').text('');
								$('span[name=c_pwd2]')
										.html(
												"<span style='color:blue;'><i class='fa fa-check'></i></span>");
							}
						});
		$("#pwd2").blur(function() {
			if ($('#pwd').val() != $('#pwd2').val()) {
				$("#pwd2").val("");
			}
		});
		//이름
		var c_name = RegExp(/^[A-Za-z가-힣]{2}/);
		$('#name')
				.keyup(
						function() {
							if (!c_name.test($("#name").val())) {
								$('span[name=c_name]').text('');
								$('span[name=c_name]')
										.html(
												"<span style='color:red;'><i class='fa fa-remove'></i></span>");
							} else {
								$('span[name=c_name]').text('');
								$('span[name=c_name]')
										.html(
												"<span style='color:blue;'><i class='fa fa-check'></i></span>");
							}
						});
		$("#name").blur(function() {
			if (!c_name.test($("#name").val())) {
				$("#name").val("");
			}
		});
		//이메일
		var c_email = RegExp(/^[\w\.-]{1,64}@[\w\.-]{1,252}\.\w{2,4}$/);
		$('#email')
				.keyup(
						function() {
							if (!c_email.test($("#email").val())) {
								$('span[name=c_email]').text('');
								$('span[name=c_email]')
										.html(
												"<span style='color:red;'><i class='fa fa-remove'></i></span>");
							} else {
								$('span[name=c_email]').text('');
								$('span[name=c_email]')
										.html(
												"<span style='color:blue;'><i class='fa fa-check'></i></span>");
							}
						});
		$("#email").blur(function() {
			if (!c_email.test($("#email").val())) {
				$("#email").val("");
			}
		});
		//핸드폰번호
		var c_phone = RegExp(/^(010|011)[-\s]?\d{3,4}[-\s]?\d{4}$/);
		$('#phone')
				.keyup(
						function() {
							if (!c_phone.test($("#phone").val())) {
								$('span[name=c_phone]').text('');
								$('span[name=c_phone]')
										.html(
												"<span style='color:red;'><i class='fa fa-remove'></i></span>");
							} else {
								$('span[name=c_phone]').text('');
								$('span[name=c_phone]')
										.html(
												"<span style='color:blue;'><i class='fa fa-check'></i></span>");
							}
						});
		$("#phone").blur(function() {
			if (!c_phone.test($("#phone").val())) {
				$("#phone").val("");
			}
		});
	});
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
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
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
	function checkForm() {
		if ($("#id").val() == "") {
			alert("아이디를 입력하지 않으셨습니다.");
			$("#id").focus();
			return false;
		} else if ($("#idc").val() != false) {
			alert("아이디 형식이 맞지 않습니다 .");
			$("#id").focus();
			return false;
		} else if ($("#pwd").val() == "") {
			alert("비밀번호를 입력하지 않으셨습니다.");
			$("#pwd").focus();
			return false;
		} else if ($("#pwd2").val() == "") {
			alert("비밀번호 확인을 입력하지 않으셨습니다.");
			$("#pwd2").focus();
			return false;
		} else if ($("#name").val() == "") {
			alert("이름을 입력하지 않으셨습니다.");
			$("#name").focus();
			return false;
		} else if ($("#email").val() == "") {
			alert("메일주소를 입력하지 않으셨습니다.");
			$("#email").focus();
			return false;
		} else if ($("#sample6_postcode").val() == "") {
			alert("주소를 입력하지 않으셨습니다.");
			$("#sample6_postcode").focus();
			return false;
		} else if ($("#sample6_address").val() == "") {
			alert("나머지 주소를 입력하지 않으셨습니다.");
			$("#sample6_address").focus();
			return false;
		} else if ($("#phone").val() == "") {
			alert("휴대폰 번호를 입력하지 않으셨습니다.");
			$("#phone").focus();
			return false;
		} else
			return;
	}
</script>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Zogin | Template</title>
</head>
<style>
#idc {
	display: none;
}

span {
	color: red;
	font-size: 14px;
}
</style>
<body>
	<jsp:include page="../inc/top.jsp" />
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>도서관 회원가입</h2>
						<div class="breadcrumb__widget">
							<a href="./index.html">Home</a> <span>About Us</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->

	<!-- About Section Begin -->
	<section class="about spad">
		<div class="container">

			<div class="row mb-5 align-items-center">
				<div class="col-md-5 mx-auto">

					<form action="${contextPath}/member2/memjoin.do" method="post"
						onsubmit="return checkForm();" name="f">
						<input type="hidden" name="userimage" value="basic.jpg">
						<div class="row">
							<div class="col-md-12 form-group">
								<label for="InputID">아이디</label> <span id="idInfo"><input type="text" id="idc" value="1"></span>
								<input type="text" class="form-control" id="id" placeholder="아이디" name="id">
							</div>
							<div class="col-md-12 form-group">
								<label for="InputPassword1">비밀번호</label><span name="c_pwd"></span>
								<input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd">
							</div>
							<div class="col-md-12 form-group">
								<label for="InputPassword2">비밀번호 확인</label><span name="c_pwd2"></span>
								<input type="password" class="form-control" id="pwd2" placeholder="비밀번호 확인" name="pwd2">
							</div>
							<div class="col-md-12 form-group">
								<label for="username">이름</label><span name="c_name"></span>
								<input type="text" class="form-control" id="name" placeholder="이름" name="name">
							</div>
							<div class="col-md-12 form-group">
								<label for="InputEmail">이메일 주소</label><span name="c_email"></span>
								<input type="email" class="form-control" id="email" placeholder="이메일 주소" name="email">
							</div>
							<div class="col-md-12 form-group">
								<label>우편 번호</label>
								<table style="width: 100%">
									<tr>
										<td><input type="text" class="form-control"	id="sample6_postcode" placeholder="우편번호" name="address1" readonly="readonly"></td>
										<td><input type="button" class="primary-btn w-100" style="border: 0; height: 100%; padding: 6px 10px 10px;"	onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
									</tr>
									<tr>
										<td><input type="text" class="form-control"	id="sample6_address" placeholder="주소" name="address2" readonly="readonly"></td>
										<td><input type="text" class="form-control"	id="sample6_extraAddress" placeholder="참고항목" name="address3" readonly="readonly"></td>
										<span id="guide" style="color: #999; display: none"></span>
									<tr>
										<td colspan="2"><input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소" name="address4"></td>
									</tr>
								</table>
							</div>
							<div class="col-md-12 form-group">
								<label>휴대폰 번호</label><span name="c_phone"></span>
								<div class="input-group">
									<input type="tel" class="form-control" id="phone" placeholder="- 없이 입력해 주세요" name="phone">
								</div>
							</div>
							<input type="hidden" name="userimage" value="avatar.png">
							<div class="col-md-6 form-group">
								<button type="submit" class="primary-btn w-100" style="border: 0;">회원가입</button>
							</div>
							<div class="col-md-6 form-group">
								<button type="reset" class="primary-btn w-100" style="border: 0;">다시입력</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section End -->
	<!-- Footer Section Begin -->
	<jsp:include page="../inc/bottom.jsp" />
</body>
</html>