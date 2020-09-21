<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="contextPath"/>
    <link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu">
        <div class="offcanvas__logo">
			<a href="${contextPath}/BookCon/main.do"><img src="../img/library_logo.JPG" style="width:198px; height:68px;"></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__widget">
            <ul>
                <li>CALL US: + 1 800-567-8990</li>
                <li>WRITE US: OFFICE@EXAMPLE.COM</li>
                <li>OPENING TIMES: MON - FRI: 9:00 - 19:00</li>
            </ul>
        </div>    
        <div class="offcanvas__widget">
			<c:choose>
				<c:when test="${empty id}">
				<tr><td> <a href="../member/login.jsp" class="primary-btn">Login</a> </td>
                    <td><a href="../member/join.jsp" class="primary-btn">JOIN US</a></td></tr>
				</c:when>
				<c:otherwise>
        		${sessionScope.name}님 안녕하세요 | 
        			<c:if test="${id.contains('admin')}">
        				<a href="../admin/writebook.jsp">admin page</a> |
        			</c:if>
        		<a href="${contextPath}/member2/memlogout.do">로그아웃</a>
				</c:otherwise>
			</c:choose>
        </div>
        <nav class="header__menu">
            <ul class="mobile-menu">
                <li class="active"><a href="${contextPath}/BookCon/main.do">Home</a></li>
                <li><a href="../libnews/introduction.jsp">도서관소식</a>
                   <ul class="dropdown">
                        <li><a href="../libnews/introduction.jsp">도서관 소개</a></li>
                        <li><a href="../NewsCon/confer.do">IT 컨퍼런스 일정</a></li>
                	 	<li><a href="../libnews/contact.jsp">Contact Us</a></li>
                    </ul>
                </li>
                <li><a href="../search/Search.jsp">자료검색</a>
                   <ul class="dropdown">
                        <li><a href="../search/Search.jsp">통합검색</a></li>
                        <li><a href="../NewsCon/news.do">IT관련 뉴스</a></li>
                    </ul>
                </li>
                <li><a href="../research/research_guide">연구지원</a>
  					  <ul class="dropdown">
           			 	<li><a href="../research/research_guide.jsp">검색 가이드</a></li>
             			<li><a href="../research/information_retrieval.jsp">정보 검색 가이드</a></li>
             			<li><a href="../research/information_of_study.jsp">연구정보 서비스</a></li>
   						<c:if test="${not empty sessionScope.id}">
            			<li><a href="../ReadRoomCont/roomlist.do">열람실</a></li>
   						</c:if>
                 		</ul>
                </li>
                <li><a href="../BookCon/booklist.do?sort=booknum">Collection</a>
                    <ul class="dropdown">
                        <li><a href="../BookCon/booklist.do?sort=booknum">신규도서</a></li>
                        <li><a href="../BookCon/booklist.do?sort=rentcount">인기도서</a></li>
                        <li><a href="../BookCon/booklist.do?sort=genre">테마도서</a></li>
                        <li><a href="${contextPath}/BookCon/booklist.do?sort=count(g.num)">추천도서</a></li>
                        <li><a href="../HopeCon/hopelist.do">희망도서</a></li>
                    </ul>                
                </li>
           		<c:if test="${not empty sessionScope.id}">
                <li><a href="${contextPath}/member2/user.do">My Library</a>
                    <ul class="dropdown">
	                        <li><a href="${contextPath}/member2/user.do">개인 정보 관리</a></li>
	                        <li><a href="${contextPath}/MyCon/mylibrary.do">내 서재</a></li>
	                        <li><a href="${contextPath}/notice/list.do">개인 공지사항</a></li>
	                        <li><a href="../BookCon/bookProf.do">독서 프로파일링</a></li> 
                    </ul>                
                </li>
                </c:if>	 
            </ul>
        </nav>
     
    </div>
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="header__logo">
                           <a href="${contextPath}/BookCon/main.do"><img src="../img/library_logo.JPG" style="width:198px; height:68px;"></a>
                        </div>
                    </div>
                  
               <div class="col-lg-9 col-md-9">
                         <div class="header__top__widget">
			<c:choose>
				<c:when test="${empty id}">
				<tr><td> <a href="../member/login.jsp" class="primary-btn">Login</a> </td>
                    <td><a href="../member/join.jsp" class="primary-btn">JOIN US</a></td></tr>
				</c:when>
				<c:otherwise>
				<img src="../userimage/${userimage}" style="width: 2em ; height: 2em"/>
        		${sessionScope.name}님 안녕하세요 | 
        			<c:if test="${id.contains('admin')}">
        				<a href="../admin/writebook.jsp">admin page</a> |
        			</c:if>
        		<a href="${contextPath}/member2/memlogout.do">로그아웃</a>
				</c:otherwise>
			</c:choose>
                </div>   
              	</div>
               </div>
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        <div class="header__nav">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <nav class="header__menu">
                            <ul>
			      		 		<li class="active"><a href="${contextPath}/BookCon/main.do">Home</a></li>
			      				<li><a href="../libnews/introduction.jsp">도서관소식</a>
			                  	 <ul class="dropdown">
			                        <li><a href="../libnews/introduction.jsp">도서관 소개</a></li>
			                        <li><a href="../NewsCon/confer.do">IT 컨퍼런스 일정</a></li>
			                	 	<li><a href="../libnews/contact.jsp">Contact Us</a></li>
			                    </ul>
			                </li>
			                <li><a href="../search/Search.jsp">자료검색</a>
			                   <ul class="dropdown">
			                        <li><a href="../search/Search.jsp">통합검색</a></li>
                     			    <li><a href="../NewsCon/news.do">IT관련 뉴스</a></li>
			                    </ul>
			                </li>
			                <li><a href="../research/research_guide.jsp">연구지원</a>
                  			  <ul class="dropdown">
                      			 	<li><a href="../research/research_guide.jsp">검색 가이드</a></li>
                        			<li><a href="../research/information_retrieval.jsp">정보 검색 가이드</a></li>
                        			<li><a href="../research/information_of_study.jsp">연구정보 서비스</a></li>
              						<c:if test="${not empty sessionScope.id}">
			            			<li><a href="../ReadRoomCont/roomlist.do">열람실</a></li>
			   						</c:if>
                    		</ul>
			                </li>
		                <li><a href="../BookCon/booklist.do?sort=booknum">Collection</a>
		                    <ul class="dropdown">
		                        <li><a href="../BookCon/booklist.do?sort=booknum">신규도서</a></li>
		                        <li><a href="../BookCon/booklist.do?sort=rentcount">인기도서</a></li>
		                        <li><a href="../BookCon/booklist.do?sort=genre">테마도서</a></li>
		                        <li><a href="${contextPath}/BookCon/booklist.do?sort=count(g.num)">추천도서</a></li>
		                        <li><a href="../HopeCon/hopelist.do">희망도서</a></li>
		                    </ul>                
		                </li>
			                <c:if test="${not empty sessionScope.id}">
			                <li><a href="${contextPath}/member2/user.do">My Library</a>
			                    <ul class="dropdown">
			                        <li><a href="${contextPath}/member2/user.do">개인 정보 관리</a></li>
			                        <li><a href="${contextPath}/MyCon/mylibrary.do">내 서재</a></li>
			                        <li><a href="${contextPath}/notice/list.do">개인 공지사항</a></li>
			                        <li><a href="../BookCon/bookProf.do">독서 프로파일링</a></li>                        
			                    </ul>                
			                </li>
			                </c:if>
			            </ul>
			        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>