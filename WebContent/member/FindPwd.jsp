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
	function Ec() {
		var email1 = document.ff.email.value;
		var emailform = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (email1 == null || email1 == "") {
			window.alert("이메일을 써주세요 . ");
		} else if (!emailform.test(email1)) {
			window.alert("형식에 맞게 써주세요. ");
		} else {
			document.ff.submit();
		}
	}
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
							<a href="../index.jsp">Home</a> <span>로그인</span>
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
					<form action="${contextPath}/member2/emailcheck.do" method="post"
						name="ff">
						<div class="row">
							<div class="col-md-12 form-group">
								<label for="name">이메일</label> <input type="text" name="email"
									class="form-control" placeholder="이메일" />
							</div>
							<div class="col-md-6 form-group">
								<input type="button" class="primary-btn w-100"
									style="border: 0;" onclick="Ec()" value="메일 확인 하기">
							</div>
							<div class="col-md-6 form-group">
								<input type="button" class="primary-btn w-100"
									style="border: 0;" value="돌아가기" onclick="history.go(-2)">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- Footer Section End -->
</body>
</html>