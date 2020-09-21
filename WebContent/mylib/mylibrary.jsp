<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${pageContext.request.contextPath}" var="contextPath"/>


<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>    
    
    <title>대여 도서 목록</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<style>
.bt{
	width:230px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
<script type="text/javascript">
	function search(){
		var sDate = document.getElementById('startDate').value;
		
		if(sDate==null||sDate==''){
			alert("날짜를 선택해주세요");
			
		}else{
			document.getElementById('search').submit();
		}
		
	}

</script>

<body>
<jsp:include page="../inc/top.jsp"/>

    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>My Library</h2>
                        <div class="breadcrumb__widget">
                            <span>내 서재</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- Classes Section Begin -->
    <section class="classes spad">
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
					<div class="blog__item__pic">
                    	<img src="img/blog/blog-1.jpg" alt="">
                    </div>
					<div class="row">
					
					<%-- <c:if test="${reslist !=null }">
					<div class="col-lg-12">
	                        <h4>예약 목록</h4>
	                        <table  class="table">
	                        <tr>
	                        </tr>
	                        <c:forEach var="reslist" items="${reslist}">
	                        <tr>
	                        	<td> " ${reslist.title } " 의 대여일 ${reslist.resdate}</td>
	                        </tr>
	                        </c:forEach>
                    		</table>
                    </div>
                    </c:if> --%>
                    
					<div class="col-lg-12">
	                    <div class="section-title normal-title">
	                        <h2>대여 목록</h2>
	                    </div>
                    </div>
                    
                    <c:choose>
                    
	                    <c:when test="${rentlist.size()==0}">
	                    	대여 목록 없음
	                    </c:when>
	                    <c:otherwise>
	                    
		                    <c:forEach var="rentlist" items="${rentlist}">
			                <div class="col-lg-4 form-group">
			                    <div class="classes__item">
			                        <div class="classes__item__pic set-bg" >
		                        	<img src="../bookimg/${rentlist.bookimage}" style="height: 100%">
		                            <span>${rentlist.genre}</span>
		                        </div>
			                        <div class="classes__item__text">
			                            <ul>
			                                <li><span class="icon_calendar"></span> 대여일:<fmt:formatDate value="${rentlist.rentdate}" pattern="yy.MM.dd"/></li>
			                                <li><span class="icon_clock_alt"></span> 반납예정일:<fmt:formatDate value="${rentlist.returndate}" pattern="yy.MM.dd"/></li>
			                            </ul>
			                            <h4 class="bt"><a href="#">${rentlist.title}</a></h4>
			                            <h6>${rentlist.writer} <span>-${rentlist.publisher}</span></h6>
	                            <a href="${contextPath}/BookCon/bookInfo.do?bookNum=${rentlist.booknum}" class="class-btn">상세보기</a>
							
							<c:choose>
								<c:when test="${ rentlist.extension!=1 }">
									<a href="${contextPath}/MyCon/extension.do?bookNum=${rentlist.booknum}&id=${id}" class="class-btn">대여연장</a>
								</c:when> 
								<c:otherwise>
									<a class="class-btn">대여연장불가</a>
								</c:otherwise>
							</c:choose>  


			                    	</div>
			                    </div>
			                </div>
			                </c:forEach>
			                
	                    </c:otherwise>
                    </c:choose>
                    
				</div>
				<div class="col-lg-12">
				</div>
                </div> 
            </div>
        </div>
    </section>
    <!-- Classes Section End -->

    <!-- Upcoming Classes Section Begin -->
    <section class="upcoming-classes top-classes spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 order-lg-1 order-2">
					
				</div>
				<div class="col-lg-9 order-lg-2 order-1">
				
					<div class="row">
					<div class="col-lg-12">
	                    <div class="section-title normal-title">
	                        <h2>대여 내역</h2>
	                    </div>
                    </div>
	                <c:choose>
                    
	                    <c:when test="${rentedlist==null }">
	                    	대여 내역 없음
	                    </c:when>
	                    <c:otherwise>
	                    <div class="col-lg-12 text-right" >
			                    <div class="classes__sidebar">
									<div class="classes__sidebar__item classes__sidebar__item--info" style="margin-bottom: 0;">
									<form action="${contextPath}/MyCon/mylibrary2.do" id="search">
										 <b>기간 검색</b>
					            			<c:choose>
					            			<c:when test="${sDate == null }">	
							                    <input type="text" id="startDate" name="sDate" class="sidebar-btn" placeholder="조회기간" style="width:130px;"/> 
							                    <input type="text" id="endDate" name="eDate" class="sidebar-btn" value="${nowdate}" placeholder="조회기간" style="width:130px;"/>
											</c:when>
											<c:otherwise>
												<input type="text" id="startDate" name="sDate" class="sidebar-btn"  value="${sDate}" placeholder="조회기간" style="width:130px;"/> 
							                    <input type="text" id="endDate" name="eDate" class="sidebar-btn"   value="${eDate}" placeholder="조회기간" style="width:130px;"/>
											</c:otherwise>
											</c:choose>
					                	<button class="sidebar-btn" type="button" onclick="search()"><i class="fa fa-search"></i></button>
				                	</form>
				                	</div>
			                	</div> 
			            </div>   
	                    <table  class="table">
			               	<tr>
								<th>제목</th>
								<th>저자</th>
								<th>대여기간</th>
							</tr>
			                <c:forEach var="rentedlist" items="${rentedlist}">
			               	<tr>
			               		<td>${rentedlist.title}</td>
			               		<td>${rentedlist.writer}</td>
			               		<td><fmt:formatDate value="${rentedlist.rentdate}" pattern="yy.MM.dd"/> ~ <fmt:formatDate value="${rentedlist.r_returndate}" pattern="yy.MM.dd"/></td>
			                </c:forEach>
	                	</table>
	                    </c:otherwise>
                    </c:choose>
				</div>
				<div class="col-lg-12">
	                    <div class="classes__pagination" style="padding:0;">
	                       <c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
		                   <a href="${contextPath }/MyCon/mylibrary.do?nowPage=${i}">${i}</a>
		                   </c:forEach>
                    	</div>
                </div>
				
                </div> 
            </div>
        </div>
    </section>
<jsp:include page="../inc/bottom.jsp"/>
<c:remove var="rentlist"/>
<c:remove var="rentedlist"/>
<c:remove var="sDate"/>
<c:remove var="eDate"/>
<c:remove var="nowdate"/>
<c:remove var="blockSize"/>
<c:remove var="blockFirst"/>
<c:remove var="blockLast"/>
<c:remove var="totalPage"/>
<c:remove var="nowPage"/>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
<script>
    var setSdate, setEdate;
    $("#startDate").datepicker({
        dateFormat: 'yy-mm-dd',
       // minDate: 0,
        maxDate: 0,
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        onSelect: function(selectDate){
        	setSdate = selectDate;
        }

    });
     
    $("#endDate").datepicker({
        dateFormat: 'yy-mm-dd',
        maxDate: 0,
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        onSelect : function(selectDate){
            setEdate = selectDate;
        }
    });
	  </script>
</html>