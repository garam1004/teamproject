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
    <title>검색 가이드</title>

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
                        <h2>검색 가이드</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- Pricing Section Begin -->
     <section class="pricing spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title normal-title">
                        <h2>Research Guide</h2>
                        <p>Research Guide에서는 주제별로 유용한 정보를 선별하여 연구에 도움이 되는 서비스를 제공합니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 p-0 col-md-6">
                    <div class="pricing__item set-bg">
                        <h4>DataBase</h4>
                        <div class="pricing__item__price">
                            <h2>DB</h2>
                            <span>데이터베이스</span>
                        </div>
                        <ul>
                            <li>Oracle</li>
                            <li>MySQL</li>
                            <li>Maria DB</li>
                            <li>Mongo DB</li>
                        </ul>
                        <a href="https://www.oracle.com/index.html" class="primary-btn">서비스 바로가기</a>
                    </div>
                </div>
                <div class="col-lg-4 p-0 col-md-6">
                    <div class="pricing__item active set-bg">
                        <h4>Programming Language</h4>
                        <div class="pricing__item__price">
                            <h2>개발</h2>
                            <span>개발분야</span>
                        </div>
                        <ul>
                            <li>JAVA</li>
                            <li>JSP</li>
                            <li>JAVASCRIPT</li>
                            <li>SPRING</li>
                        </ul>
                        <a href="https://docs.oracle.com/javase/8/docs/api/index.html" class="primary-btn">서비스 바로가기</a>
                    </div>
                </div>
                <div class="col-lg-4 p-0 col-md-6">
                    <div class="pricing__item set-bg">
                        <h4>Design</h4>
                        <div class="pricing__item__price">
                            <h2>디자인</h2>
                            <span>디자인 분야</span>
                        </div>
                        <ul>
                            <li>HTML</li>
                            <li>CSS</li>
                            <li>PPT</li>
                            <li>PHOTOSHOP</li>
                        </ul>
                        <a href="https://www.w3schools.com/" class="primary-btn">서비스 바로가기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Pricing Section End -->

    
    
    
    <!-- Appoinment Section End -->

    <!-- Testimonial Section Begin -->
    <section class="testimonial spad">
        <div class="container">
            <div class="testimonial__slider owl-carousel">
                <div class="testimonial__item">
                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-10">
                           
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->

    


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