<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zxx">
<head>
 <meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="../css/board.css" /> 
<script src='https://kit.fontawesome.com/a076d05399.js'></script> 
<title>희망 도서</title>
<style type="text/css">
#a:hover{
    opacity: 50%;
    }

</style>
</head>
<body>
	<jsp:include page="../inc/top.jsp" />
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>희망 도서</h2>
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
					<div class="col-lg-7"></div>
					<div class="col-lg-5">
						<form action="${contextPath}/HopeCon/hopelist.do" method="post">
							<input type="text" name="search" value="${param.search}">
							<button class="class__filter__btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>	
		<article>
			<table align="center" id="notice">
				<tr>
					<th class="ttitle">책이름</th>
					<th class="twrite">저자</th>
					<th class="tpublisher">출판사</th>
					<th class="tid">글쓴이</th>
					<th class="tgood" style="padding-right: 23px;">좋아요</th>
				</tr>
					<c:forEach var="hopeVO" items="${list}">
				
				<tr>
					<td class="left" style="text-align: left; padding-left: 20px;"  class="ttitle">${hopeVO.title}</td>
					<td class="twrite">${hopeVO.writer}</td>
					<td>${hopeVO.publisher}</td>
					<td>${hopeVO.id}</td>
					
				
				<c:choose>
					<c:when test="${hopeVO.check}">
						<td style="padding-right: 23px;"><a href="" style="pointer-events:none;">
							<i class='fas fa-heart' style="color:red;"></i>${hopeVO.good}</a>
						</td>
					</c:when>
					<c:otherwise>
					   <td style="padding-right: 23px;"><a href="${contextPath}/HopeCon/like.do?num=${hopeVO.num}" id="a">
						    <i class='fas fa-heart' style="color:#000000;"></i>${hopeVO.good}</a>
					   </td>
					</c:otherwise>
				</c:choose>

				</tr>
				</c:forEach>
			</table>
		</article>
		${out}
				<div class="col-lg-3"></div>
				<div class="col-lg-9">
					<c:choose>
						<c:when test="${sessionScope.id!=null}">
								<div id="table_search">
									<input type="button" value="글쓰기" onclick="location.href='${contextPath}/HopeCon/write.do'" class="site-btn">
								</div>	
						</c:when>
					</c:choose>
				</div>
			<br><br>
		<br><br>

		 <jsp:include page="../inc/bottom.jsp" />  
<c:remove var="list"/>
<c:remove var="out"/>
<c:remove var="search"/>
</body>
</html>