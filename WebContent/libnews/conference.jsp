<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="contextPath"/>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> IT Conference/Seminar</title>
</head>
<body>
<jsp:include page="../inc/top.jsp"/>
    <!-- Breadcrumb Begin -->
    
<style>
.col-lg-14{
margin: 0 auto;}

.thumb
{position: relative;
height: 147px;
overflow: hidden;
padding-left: 20px;
float: left;}

dt{
font-size: 17px;
font-weight: bold;
padding: 0px 15px 0px 230px;}

dd{
padding: 0px 0px 0px 230px;
margin: 0px;
color: gray;
padding-bottom: 10px;
}


img{width: 200px;
height: 150px;}

.blog__item{
border: 1px solid #ddd;
margin-top: 50px;
pointer-events:none;}

.blog__item__pic{
margin-bottom: -20px;}

#seminar_1 {border:gray solid thin; margin: 15px 0;}

</style>
</head>
<body>    
    
    <section class="breadcrumb-option set-bg" data-setbg="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2><big>IT</big> 컨퍼런스 일정</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->   
    

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 order-lg-1 order-2">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__categories">
                            <h4>Categories</h4>
                            <ul>
		                        <li><a href="../libnews/introduction.jsp">도서관 소개</a></li>
		                        <li><a href="../NewsCon/confer.do">IT 컨퍼런스 일정</a></li>
		                	 	<li><a href="../libnews/contact.jsp">Contact Us</a></li>                            
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 order-lg-2 order-1">
                    <div class="row">
                        <div class="col-lg-14 col-sm-0">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="img/blog/blog-1.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
	<div class="seminar" >	
	
		<div class="seminar_1" >
					<c:forEach var="i" items="${list}">
				${i}<br>
			</c:forEach>

		</div>
		<div class="clear"></div>	
	</div>                               
                                </div>
                            </div>
                        </div>
                     </div>   
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

<jsp:include page="../inc/bottom.jsp"/>
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.barfiller.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>

