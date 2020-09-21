<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="contextPath"/>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>도서관 소개</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">    
</head>
<body>
    <jsp:include page="../inc/top.jsp"/>

    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>도서관 소개</h2>
                        <div class="breadcrumb__widget">                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- About Section Begin -->
    <section class="home-about spad" style="padding-top: 100px">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="home__about__pic">
                        <div class="home__about__pic__item large-item set-bg" data-setbg="../img/library_interior1.jpg"></div>
                        <div class="home__about__pic__item">
                            <div class="home__about__pic__item__inner set-bg" data-setbg="../img/about/about-2.jpg"></div>
                            <div class="home__about__pic__item__inner set-bg" data-setbg="../img/about/about-3.jpg"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="home__about__text" style="padding-top: 0px; margin-top: -24px;">
                        <div class="section-title">
                            <img src="../img/library_logo.JPG" style="width:198px; height:68px; margin-bottom: -20px;">
                        </div>
						<p> 부산 진구 부전동에 위치한 가람 도서관은 
                        	<br>국내 최초 IT 전문 도서관으로서 2002년에 개관한 이후, 
                        	<br>IT에 관심있는 부산 시민들이 이용하고 있습니다.
							<br>우리 도서관은 모든 부산 시민들이 빠르게 발전하는 정보 기술에
							<br>발맞춰 함께 성장할 수 있도록 
							<br>다양한 IT 관련 서적과 컨퍼런스 참여 기회를 제공하고 있습니다.<br>
						</p> 
						<p> Garam Library which is located in Jin-gu, Busan,
							<br>has been visited by many Busan citizens who are 
							<br>interested in information technology
							<br>since it opened in 2002.
							<br>To provide much more newly updated information about IT,
							<br>we do offer many kinds of books and conferences
							<br>about information technology.<br> 
						</p>
						<br>
							<h5 style="color:gray;"><b>시설 현황</b></h5>
						<p> 위치 : 부산시 진구 
                        <br>시설 : 지하 1층, 지상 3층 (각 층에 장애인 화장실 비치되어 있음)
                        <br>부지 : 344㎡ 
                        <br>건축 : 964㎡(292)
                        <br>열람석 : 150석 
                        <br>개관일 : 2002.1.20.</p>                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Section End -->
    <br><br><br><br><br><br><br><br><br>
    
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