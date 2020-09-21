<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Zogin | Template</title>
<script type="text/javascript">
	function checkPwd2() {
		var pwd1 = document.getElementById("pwd").value;
		var pwd2 = document.getElementById("pwd2").value;
		var checkSpan = document.getElementById("checkPwd2");
		if (pwd2 != "") {
			if (pwd2 == pwd1) {
				alert("로그인 화면으로 이동합니다.");
				document.ff.submit();
			}
		}
	}
</script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
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
	});
</script>
</head>
<body>
	<jsp:include page="../inc/top.jsp" />
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>Login</h2>
						<div class="breadcrumb__widget">
							<a href="../index.html">Home</a> <span>로그인</span>
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
					<form action="${contextPath}/member2/pwddd.do" method="post"
						name="ff">
						<div class="row">
							<div class="col-md-12 form-group">
								<label for="name">이메일</label> <input type="text" name="email"
									class="form-control" placeholder="이메일" readonly="readonly"
									value="${email}" />
							</div>
							<div class="col-md-12 form-group">
								<label for="InputPassword1">비밀번호</label><span name="c_pwd"></span>
								<input type="password" class="form-control" id="pwd"
									placeholder="비밀번호" name="pwd">
							</div>
							<div class="col-md-12 form-group">
								<label for="InputPassword2">비밀번호 확인</label><span name="c_pwd2"></span>
								<input type="password" class="form-control" id="pwd2"
									placeholder="비밀번호 확인" name="pwd2">
							</div>
							<div class="col-md-6 form-group">
								<input type="button" class="primary-btn w-100"
									style="border: 0;" value="비밀번호 변경" onclick="checkPwd2()">
							</div>
							<div class="col-md-6 form-group">
								<input type="button" class="primary-btn w-100"
									style="border: 0;" value="돌아가기" onclick="history.go(-4)">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section End -->
	<!-- Footer Section Begin -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- Footer Section End -->
</body>
</html>