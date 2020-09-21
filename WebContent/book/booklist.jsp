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
    <script src='https://kit.fontawesome.com/a076d05399.js'></script> 
    <title> Book Collection</title>
</head>
<style>
.bt{
	width:230px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

</style>
<body>
<jsp:include page="../inc/top.jsp"/>
    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>도서 목록</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- Classes Section Begin -->
    <section class="classes spad">
        <div class="container">
            <div class="classes__filter">
                <div class="row">
                    <div class="col-lg-7">
  						<nav class="header__menu">
                            <ul>
			      		 		<li><a href="${contextPath}/BookCon/booklist.do?sort=booknum">신규도서</a></li>
			      				<li><a href="${contextPath}/BookCon/booklist.do?sort=rentcount">인기도서</a></li>
			      				<li><a href="${contextPath}/BookCon/booklist.do?sort=genre">테마도서</a></li>
			      				<li><a href="${contextPath}/BookCon/booklist.do?sort=count(g.num)">추천도서</a></li>
			           	    </ul>
			       	    </nav>
                    </div>
                    <div class="col-lg-5">
                        <form action="${contextPath}/BookCon/booklist.do" method="get">
    							 <select name="searchField">
                                    <option ${(param.searchField == "title")?"selected":""} value="title">제목</option>
                                    <option ${(param.searchField == "writer")?"selected":""} value="writer">글쓴이</option>
									<option ${(param.searchField == "genre")?"selected":""} value="genre">장르</option>
                                </select>                                              
                            	<input type="text" name="search" value="${param.search}">
                                <button class="class__filter__btn" type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="bookVO" items="${list}">
                <div class="col-lg-3 col-md-5">
                    <div class="classes__item classes__item__page">
                        <div class="classes__item__pic set-bg">
                        <img src="../bookimg/${bookVO.bookimage}" style="height: 370px; width:262.5px;">
                            <span>${bookVO.genre}</span>
                        </div>
                        <div class="classes__item__text">
                            <ul>
                                <li><span class="icon_calendar"></span>${bookVO.rentcount}</li>
                   <c:choose>
					<c:when test="${bookVO.check}">
                                <li><a href="" style="pointer-events:none;"><i class='fas fa-heart' style="color:red;"></i></span>${bookVO.good-1}</a></li>
                     </c:when>
					<c:otherwise>
								<li><a href="${contextPath}/BookCon/like.do?bookNum=${bookVO.booknum}&sort=${sort}&nowPage=${nowPage}"><i class='fas fa-heart' style="color:#000000;"></i>${bookVO.good-1}</a></li>
					</c:otherwise>
				   </c:choose>
                            </ul>
                            <h4 class="bt"><a href="${contextPath}/BookCon/bookInfo.do?bookNum=${bookVO.booknum}">${bookVO.title}</a></h4>
                            <h6>${bookVO.writer}<span>-${bookVO.publisher}</span></h6>
                            <a href="${contextPath}/BookCon/bookInfo.do?bookNum=${bookVO.booknum}" class="class-btn">상세보기</a>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <div class="col-lg-12">
                    <div class="classes__pagination">
                    <c:if test="${blockFirst!=1}">
                        <a href="${contextPath}/BookCon/booklist.do?nowPage=${blockFirst-blockSize}&sort=${sort}"><span class="arrow_carrot-left"></span></a>
                    </c:if>
                    <c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
                    <a href="${contextPath }/BookCon/booklist.do?nowPage=${i}&sort=${sort}">${i}</a>
                    </c:forEach>
                    <c:if test="${blockLast!=totalPage}">
                        <a href="${contextPath}/BookCon/booklist.do?nowPage=${blockLast+1}&sort=${sort}"><span class="arrow_carrot-right"></span></a>                    
                    </c:if>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Classes Section End -->

<jsp:include page="../inc/bottom.jsp"/>

<c:remove var="list"/>
</body>

</html>