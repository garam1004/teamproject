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
<title>IT Academic Conference</title>
<head>
</head>
<body>
<jsp:include page="../inc/top.jsp"/>
</head>
<body>
    <section class="breadcrumb-option set-bg" data-setbg="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>게시판이름</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
 <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 order-lg-1 order-2">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__categories">
                            <h4>Categories</h4>
                            <ul>
								<li><a href="writebook.jsp">책 등록</a></li>
								<li><a href="${contextPath}/HopeCon/adminhope.do">희망도서 신청 내역</a></li>
								<li><a href="rentalpage.jsp">대여시스템</a></li>    
								<li><a href="${contextPath}/ReadRoomCont/adminres.do">열람실 예약리스트</a></li>                      
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
									<table border="1">
										<tr align="center">
											<td width="300px">제목</td>
											<td width="100px">출판사</td>
											<td width="100px">저자</td>
											<td width="50px">글쓴이</td>
											<td width="50px">좋아요</td>                 
										</tr>
								<c:forEach var="hopeVO" items="${list}">		
										<tr align="center">
											<td width="300px">${hopeVO.title}</td>
											<td width="100px">${hopeVO.publisher}</td>
											<td width="100px">${hopeVO.writer}</td>
											<td width="50px">${hopeVO.id}</td>
											<td width="50px">${hopeVO.good}</td>                 
										</tr>
								</c:forEach>
									</table>  
									${out}                            
                                </div>
                            </div>
                        </div>
                     </div>   
                </div>
            </div>
        </div>
    </section>
    <c:remove var="list"/>
    <c:remove var="out"/>
<jsp:include page="../inc/bottom.jsp"/>
</body>
</html>

