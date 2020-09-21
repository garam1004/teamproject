<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="psize" value="3"/>
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>개인 공지 사항</title>

<style type="text/css">
#a:hover{
    opacity: 50%;
}
.bt{
	width:230px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>

<script type="text/javascript">
$(function() {
	$("#btn").click(function() {
		var number = $('#notice tr').length-1;
		$.getJSON("${contextPath}/notice/morelist.do",{number:number},function(data){
			$.each(data, function(index,item){
				$("table").append("<tr><td>" + item.id + "</td>" +
									"<td>" + item.comment + "</td>" +
									"<td>" + item.insertdate + "</td></tr>");
			});
		});
	});
});
</script>
</head>
<body>
	<jsp:include page="../inc/top.jsp" />
	<!-- Breadcrumb Begin -->
	
	<section class="breadcrumb-option set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>개인 공지 사항</h2>
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
            <div class="col-lg-3 order-lg-1 order-2">
					<div class="blog__sidebar">
						<div class="blog__sidebar__categories">
							<h4>Categories</h4>
							<ul>
								<li><a href="${contextPath}/member2/user.do">개인정보관리</a></li>
		                        <li><a href="${contextPath}/MyCon/mylibrary.do">내 서재</a></li>
		                        <li><a href="${contextPath}/notice/list.do">개인 공지사항</a></li>
		                        <li><a href="../BookCon/bookProf.do">독서 프로파일링</a></li>
							</ul>
						</div>
					</div>
				</div>
			<div class="col-lg-9 order-lg-2 order-1">
            	<div class="col-lg-12">
                    <div class="section-title normal-title">
                        <h2>개인 공지 사항</h2>
                    </div>
                </div>
                <div class = "row">
                <div class="col-lg-4 p-0 col-md-6">
                    <div class="pricing__item set-bg" >
                        <h4>대여중 / <font style="color:blue">예약중</font></h4>
                        <div class="pricing__item__price">
                            <h2>${BVO.size()}권</h2>
                        </div>
                        <ul>
                        <c:if test="${BVO !=null && BVO !=''}">
                           <c:forEach var="noticeMap" items="${BVO}" varStatus="status">
								<c:if test="${noticeMap.resdate ==null }">
									<li class="bt">
										&nbsp;&nbsp; ${noticeMap.title}
									</li>
								</c:if>
								<c:if test="${noticeMap.resdate !=null }">
									<li>
										<font style="color:blue">${noticeMap.title} 예약중</font>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
						  
						
                        </ul>
                        <a href="${contextPath}/MyCon/mylibrary.do" class="primary-btn">내서재 바로가기</a>
                    </div>
                </div>
                
                
                <div class="col-lg-4 p-0 col-md-6">
                    <div class="pricing__item active set-bg" >     
                    
                    
                        
                        <h4>반납 예약 안내</h4>
                        <div class="pricing__item__price">
                            <h2>반납일</h2>
                        </div>
                        <ul>
                            <c:forEach var="noticeMap" items="${BVO}" varStatus="status">
								
								<c:if test="${noticeMap.resdate ==null }">
									<li>
										${noticeMap.returndate} 
									</li>
								</c:if>
								<c:if test="${noticeMap.resdate !=null }">
									<li>
										<font style="color:blue">${noticeMap.resdate} 예약일입니다. </font>
									</li>
								</c:if>
							
							</c:forEach>
                        </ul>
                        <a href="${contextPath}/MyCon/mylibrary.do" class="primary-btn">내서재 바로가기</a>
                    </div>
                </div>
                <div class="col-lg-4 p-0 col-md-6">
                    <div class="pricing__item set-bg" >
                        <h4>잔여일</h4>
                        <div class="pricing__item__price">
                            <h2>잔여일</h2>
                        </div>
                        
						 <jsp:useBean id="toDay" class="java.util.Date" />
						 <fmt:parseNumber value="${toDay.time / (1000*60*60*24)}" integerOnly="true" var="toDay"/>
						 
                        <ul>
                             <c:forEach var="noticeMap" items="${BVO}" varStatus="status">
                            
								<li>
								
                        <fmt:parseDate value="${noticeMap.returndate}" var="returndate" pattern="yyyy-MM-dd"/>
                        
						<fmt:parseNumber value="${returndate.time / (1000*60*60*24)}" integerOnly="true" var="returndate"/>
						
						<fmt:parseDate value="${noticeMap.resdate}" var="resdate" pattern="yyyy-MM-dd"/>
                        
						<fmt:parseNumber value="${resdate.time / (1000*60*60*24)}" integerOnly="true" var="resdate"/>
						
						<c:if test="${noticeMap.resdate ==null }">
									<li>
										<c:if test="${returndate - toDay <= 0}">
							
							<font style="color:red">${toDay -returndate -1}일 지났습니다.</font>	
						</c:if>
						<c:if test="${returndate - toDay >= 0}">
							${returndate - toDay}일
							
						</c:if>
									</li>
								</c:if>
								<c:if test="${noticeMap.resdate !=null }">
									<li>
										<font style="color:blue">${resdate - toDay +1 }일 남았습니다 </font>
									</li>
								</c:if>
						
						
									
								</li>
				
							</c:forEach>
                        </ul>
                        <a href="${contextPath}/MyCon/mylibrary.do" class="primary-btn">연장하러 가기</a>
                    </div>
                </div>
                </div>
                    <div class="col-lg-12">
		<article>
			<div align="center">최근활동내역</div>
			<table align="center" id="notice" style="width:100%;">
				<tr>
					<th class="tid" style="width:20%;">id</th>
					<th class="tnotice" style="width:55%;">공지사항</th>
					<th class="tdate" style="width:25%;">날짜</th>
				</tr>
				<c:forEach var="VO" items="${list}">
				<tr>
					<td>${VO.id}</td>
					<td>${VO.comment}</td>
					<td><fmt:formatDate value="${VO.insertdate}" pattern="yy.MM.dd HH:mm"/></td>
				</tr>
				</c:forEach>
				</table>
				<input type="button" class="primary-btn w-100" value="더보기" id="btn">
			<br><br><br><br><br><br><br><br><br><br><br>
		</article>
		</div>
            </div>
            </div>
        </div>
    </section>
    
    
    
    <!-- Pricing Section End -->
 
		 <jsp:include page="../inc/bottom.jsp" />  
</body>
</html>

