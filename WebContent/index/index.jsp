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
    <title>도서관 메인페이지</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<style type="text/css">
.bt{
	width:230px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body>

 <jsp:include page="../inc/top.jsp"/>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__sliders owl-carousel">
            <div class="hero__items set-bg" data-setbg="../img/library_interior1.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="hero__text">
                                
                                <h2>Welcome to <br> Garam Library</h2>
                                <a href="../libnews/introduction.jsp" class="primary-btn">Learn MORE</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="../img/cornell.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="hero__text">                            
                                <h2>Welcome to <br> Garam Library</h2>
                                <a href="../libnews/introduction.jsp" class="primary-btn">Learn MORE</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
	<br><br><br>
	
	
    <!-- Chooseus Section Begin -->
    <section class="chooseus spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>추천 도서 / 신간 도서 / 인기 도서</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="services__list">
                <div class="row">
<c:forEach var="bookVO" items="${RecList}">
                    <div class="col-xl-2 col-md-4 col-sm-6">
                        <div class="services__item" style="margin:0 0 0 0">
                            <img src="../bookimg/${bookVO.bookimage}" style="width:225px; height:308px; padding-right:15px;">
                            <h5>추천 도서</h5>
                            <p class="bt"><b>${bookVO.title}</b></p>
                            <p>${bookVO.writer}</p>
                        </div>
                  	</div>
</c:forEach>                       
                    
                    
<c:forEach var="bookVO" items="${NewList}">
                    <div class="col-xl-2 col-md-4 col-sm-6">
                        <div class="services__item" style="margin:0 0 0 0">
                            <img src="../bookimg/${bookVO.bookimage}" style="width:225px; height:308px; padding-right:15px;">
                            <h5>신간 도서</h5>
                            <p class="bt"><b>${bookVO.title}</b></p>
                            <p>${bookVO.writer}</p>
                        </div>
                  	</div>
</c:forEach>  

<c:forEach var="bookVO" items="${PopList}">
                    <div class="col-xl-2 col-md-4 col-sm-6">
                        <div class="services__item" style="margin:0 0 0 0">
                            <img src="../bookimg/${bookVO.bookimage}" style="width:225px; height:308px; padding-right:15px;">
                            <h5>인기 도서</h5>
                            <p class="bt"><b>${bookVO.title}</b></p>
                            <p>${bookVO.writer}</p>
                        </div>
                  	</div>
</c:forEach>        
                </div>
            </div>
        </div>
    </section>
    <!-- Chooseus Section End -->    



<jsp:include page="../inc/bottom.jsp"/>
</body>

</html>