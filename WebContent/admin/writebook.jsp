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
<title>도서 등록</title>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function readURL(input){
	if(input.files && input.files[0]){
		$("#tdImg").html("<img id='preview' src='#' width=200 height=200 />");
		var reader = new FileReader();
		reader.readAsDataURL(input.files[0]);
		reader.onload = function(ProgressEvent){
			$('#preview').attr('src',ProgressEvent.target.result);
		}
	}			
}
</script>
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
                        <h2>책 등록</h2>
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
  
                        <div class="col-lg-12 col-sm-0">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="img/blog/blog-1.jpg" alt="">
                                </div>
                                
                                
 	
					           		<div class="appointment__text">
					                <div class="row">
					                    <div class="col-lg-12">
					                        <div class="section-title">
					                            <h2>도서 등록 하기</h2>
					                        </div>
					                    </div>
					                </div>
					                <form action="${contextPath}/BookCon/AddBook.do" method="post" class="appointment__form" enctype="multipart/form-data">
					                    <div class="row">
					                        <div class="col-lg-12">
					                            <input type="text" name="title" placeholder="제목">
					                        </div>
					                        <div class="col-lg-6">
					                            <input type="text" name="writer" placeholder="저자">
					                        </div>
					                        <div class="col-lg-6">
					                            <input type="text" name="publisher" placeholder="출판사">
					                        </div>
					                        <div class="col-lg-12">
					                            <select class="class-select" name="genre"> 
					                                <option value="genre1">Programming</option>
					                                <option value="genre2">Database</option>
					                                <option value="genre3">장르3</option>
					                                <option value="genre4">장르4</option>
					                            </select>
					                        </div>
					                        <div class="col-lg-6">
					                            <input type="file"  name="bookimage" onchange="readURL(this);">
					                        </div>
					                        <div class="col-lg-6" id="tdImg"></div>
					                        <div class="col-lg-12 text-center">
					                            <button type="submit">Submit</button>
					                        </div>
					                    </div>
					                </form>
					           		 </div>

                             
                          
                        </div>
                     </div>   
                </div>
            </div>
        </div>
    </section>
<jsp:include page="../inc/bottom.jsp"/>
</body>
</html>

