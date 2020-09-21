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
    <title>희망도서 글쓰기</title>
    <script src="https://cdn.ckeditor.com/ckeditor5/19.1.1/classic/ckeditor.js"></script>
<style type="text/css">
.ck-editor__editable{min-height: 500px}
.hope_book_title {color:white;}
.appointment__text{margin: 70px 0;}
</style>
</head>

<body>
<jsp:include page="../inc/top.jsp"/>
    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2 style="color: #ffffff;">희망 도서 게시판</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- Classes Section Begin -->
    <section class="classes-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-1">
                </div>
                <div class="col-lg-11">
				<div class="appointment__text">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h4 class="hope_book_title">책제목, 저자명, 출판사명을 반드시 작성한 후 등록 버튼을 눌려주세요.
                            </h4>
                        </div>
                    </div>
                </div>
                <form action="${contextPath}/HopeCon/insert.do" class="appointment__form" method="post">
                    <div class="row">  
                    	<input type="hidden" name="id" value="${sessionScope.id}"/>              	
                        <div class="col-lg-12">
                            <input type="text" name="title" placeholder="책제목">
                        </div>
                        <div class="col-lg-6">
                            <input type="text" name="writer" placeholder="저자">
                        </div>
                        <div class="col-lg-6">
                            <input type="text" name="publisher" placeholder="출판사">
                        </div>
                        <div class="col-lg-12 text-center">
                            <button type="submit">등록</button>
                        </div>
                    </div>
                </form>
            	</div>
                </div>
            </div>
        </div>
    </section>
    <!-- Classes Section End -->

<jsp:include page="../inc/bottom.jsp"/>
</body>
</html>
