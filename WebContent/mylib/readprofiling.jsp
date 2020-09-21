<%@page import="bookboard.BookVO"%>
<%@page import="bookboard.BookDAO"%>
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
<title>독서 프로파일링</title>

<!-- Google Font -->
</head>
<body>

	<jsp:include page="../inc/top.jsp" />

	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>독서 프로파일링</h2>
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
				<div class="col-lg-3 p-0"></div>
				<div class="col-lg-6 p-0">				
					<div class="about__text">
						<div class="section-title">
							<h2 style="text-align: center;">내가 읽은 도서 장르</h2>
							<p style="text-align: center;">내가 읽은 도서 장르 퍼센트 퍼센트 퍼센트 퍼센트</p>
						</div>					
						<br><br><br>
						<div class="about__bar">
							<div class="about__bar__item">
								<p>프로그래밍언어</p>
								<div id="bar1" class="barfiller">
									<span class="tip"></span> <span class="fill"
										data-percentage="${percentP}"></span>
								</div>
							</div>
							<div class="about__bar__item">
								<p>데이터베이스</p>
								<div id="bar2" class="barfiller">
									<span class="tip"></span> <span class="fill"
										data-percentage="${percentD}"></span>
								</div>
							</div>
							<div class="about__bar__item">
								<p>서버</p>
								<div id="bar3" class="barfiller">
									<span class="tip"></span> <span class="fill"
										data-percentage="${percentS}"></span>
								</div>
							</div>
							<div class="about__bar__item">
								<p>네트워크</p>
								<div id="bar4" class="barfiller">
									<span class="tip"></span> <span class="fill"
										data-percentage="${percentN}"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section End -->
	
	<br><br><br><br><br><br><br><br>	

	<!-- Team Section Begin -->
	<section class="team spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>추천 도서</h2>
						<p>대여 횟수가 가장 많은 책 top3</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="team__slider owl-carousel">
			<c:forEach var="bookVO" items="${list}">
					<div class="col-lg-6">
						<div class="team__item">
							<div class="team__item__pic">
								<img src="../bookimg/${bookVO.bookimage}" style="width:225px; height:308px; padding-right:15px;">
							</div>
							<div class="team__item__text">
								<div class="team__item__title">
									<h4>${bookVO.title}</h4>
									<span>${bookVO.writer}</span>
								</div>
								<p>${bookVO.genre}</p>
								<p>${bookVO.publisher}</p>
							</div>
						</div>
					</div>
			</c:forEach>
			</div>
		</div>		
	</div>			
	</section>
	<!-- Team Section End -->

<c:remove var="list"/>
<c:remove var="percentP"/>
<c:remove var="percentD"/>
<c:remove var="percentS"/>
<c:remove var="percentN"/>
	<!-- Footer Section Begin -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.nice-select.min.js"></script>
	<script src="../js/jquery.barfiller.js"></script>
	<script src="../js/jquery.slicknav.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/main.js"></script>
</body>

</html>