<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<!DOCTYPE html>
<html lang="zxx">
<head>
<!--이미지 미리보기 / ajax -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	 -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<!-- 다음 주소 -->
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 이미지 css -->
<style type="text/css">
.img_regi {
	text-align: center;
	padding: 6em 0 4em 0;
}

.img_regi {
	border-radius: 100%;
	display: inline-block;
	padding: 0.5em;
	border: solid 1px rgba(255, 255, 255, 0.25);
	background-color: rgba(255, 255, 255, 0.075);
}

.img_regi img {
	border-radius: 100%;
	display: block;
	width: 10em;
	height: 10em;
}

.img_regi input[type="file"] {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	filter: alpha(opacity = 0);
	opacity: 0;
	cursor: pointer;
	z-index: 5;
}

.img_regi {
	position: relative;
	display: inline-block;
}

.img_regi input[type="file"] {
	position: absolute;
}
</style>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이 페이지</title>
</head>
<body>
	<jsp:include page="../inc/top.jsp" />
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>개인 정보 관리</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->
	<!-- About Section Begin -->
	<section class="about spad">
		<div class="container">
		
		           <div class="row">
                <div class="col-lg-3 order-lg-1 order-2">
					<div class="blog__sidebar">
						<div class="blog__sidebar__categories">
							<h4>Categories</h4>
							<ul>
								<li><a href="${contextPath}/member2/user.do">개인정보관리</a></li>
                        <li><a href="${contextPath}/MyCon/mylibrary.do">내 서재</a></li>
                        <li><a href="${contextPath}/notice/list.do">개인 공지사항</a></li>
                        <li><a href="../BookCon/bookProf.do">독서 프로파일링</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-2 lg-auto order-lg-2 order-3">
				</div>
				<div class="col-lg-7 order-lg-3 order-1">
			<div class="row mb-5">
				<div class="col-md-5 ">
					<form action="${contextPath}/member2/edit.do" method="post"
						onsubmit="return checkForm();" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-12 form-group text-center">
								<div class="img_regi">
									<div class="ph">
										<img id="ph" src="../userimage/${VO.userimage}" alt="" />
									</div>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<label for="InputID">아이디 : ${VO.id }</label>
							</div>
							<div class="col-md-12 form-group">
								<label for="username">이름 : ${VO.name }</label>
							</div>
							<div class="col-md-12 form-group">
								<label for="InputEmail">이메일 주소 : ${VO.email }</label>
							</div>
							<div class="col-md-12 form-group">
								<label>주소 : (${VO.address1 }) ${VO.address2 }
									${VO.address3 } ${VO.address4 } </label>
							</div>
							<div class="col-md-12 form-group">
								<label for="username">휴대폰 번호 : ${VO.phone }</label>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" class="primary-btn w-100"
									style="border: 0;">수정하기</button>
							</div>	
						</div>
					</form>
				</div>

			</div>
		</div>
		</div>
		</div>
		<c:remove var="VO" />
	</section>
	<!-- About Section End -->
	<!-- Footer Section Begin -->
	<jsp:include page="../inc/bottom.jsp" />
</body>
</html>