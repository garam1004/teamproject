<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<c:set value="null" var="R" />
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Zogin | Template</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">

<script type="text/javascript">
	function checkAuthNum() {
		var checkNum = document.getElementById("authNum").value;
		var authNum = ${authNum};
		if (!checkNum) {
			alert("인증번호를 입력하십시오.");
			return;
		} else {
			if (checkNum == authNum) {
				alert("성공적으로 인증되었습니다.");
				document.ff.submit();
			} else {
				alert("인증번호가 잘못되었습니다.");
				return;
			}
		}
	}
</script>
</head>
<body>
	<jsp:include page="../inc/top.jsp" />
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg"
		data-setbg="../img/breadcrumb.jpg">
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
					<form action="#" method="post">
						<div class="row">

							<div class="col-md-12 form-group">
								<label for="name">이메일</label> <input type="text" name="email"
									class="form-control" placeholder="이메일" readonly="readonly"
									value="${email}" />

								<c:if test="${check==0}">
									 은 존재 하지 않습니다.;
								</c:if>
								<c:if test="${check==1}">
							</div>
						</div>
					</form>
					<form class="form-signin" name="ff"
						action="${contextPath}/member2/pwdd.do">
						<div class="text-center mt-5 mb-4">
							<h1 class="h3 mb-3">이메일 인증</h1>
							<p>${email}로인증메일이 발송되었습니다.</p>
						</div>
						<input type="hidden" name="email" value="${email}" />
						<div class="form-label-group mt-4">
							<input type="text" id="authNum" name="authNum"
								class="form-control" placeholder="인증번호 입력란"> <label
								for="inputEmail">인증번호를 입력하세요.</label>
						</div>
						<div class="mt-3">
							<input type="button" class="btn btn-lg btn-primary btn-block"
								onclick="checkAuthNum()" value="인증번호 확인">
						</div>
						<p class="mt-5 mb-3 text-muted text-center">© 2020 Library</p>
					</form>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<jsp:include page="../inc/bottom.jsp"/>
	<!-- Footer Section End -->
</body>

</html>