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
					<div class="row">
						<div class="col-md-6 form-group">
							<input type="button" class="primary-btn w-100" style="border: 0;"
								value="아이디찾기"
								onclick="location.href='${contextPath}/member2/fid.do'">
						</div>
						<div class="col-md-6 form-group">
							<input type="button" class="primary-btn w-100" style="border: 0;"
								value="비밀번호 찾기"
								onclick="location.href='${contextPath}/member2/fpwd.do'">
						</div>
					</div>
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