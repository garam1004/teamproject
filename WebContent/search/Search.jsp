<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="contextPath"/>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>통합 검색</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    
    <script type="text/javascript">
    function check(){		
		if(document.search.key.value == ""){
			
			alert("검색어를 입력하세요.");
			
			document.search.keyWord.focus();
			return;
		}		
		document.search.submit();
	}
    </script>    
    
    <style type="text/css">
    	.thumb_type{
    		float: left;
    		margin-bottom: 1rem;
    		margin-right: 1rem;
    		margin-left:150px;
    	}
    	
    	dl{margin: 0 auto;}
    	dt>a:visited{color: #959595;}
    
    </style>
    
</head>

<body>
   <jsp:include page="../inc/top.jsp"/>

    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>통합 검색</h2>
                        <div class="breadcrumb__widget">
                            <span>Integrated Search</span>
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
              <div class="classes__filter">
                <div class="row">
                    <div class="col-lg-7" ></div>
                    <div class="col-lg-5" >
                        <form action="${contextPath}/NewsCon/search.do"  name="search" method="get">
    							                                          
                            	<input type="text" name="key" placeholder="통합 검색 항목" value="${param.key}">
                                <button class="class__filter__btn" onclick="check()" type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                </div>
         <div class="container">
             <div class="col-lg-16">       
					<c:forEach var="i" items="${list}">
						${i}
					</c:forEach>
             </div>
           </div>  
        </div>
    </section>
    <!-- Classes Section End -->

    
    <!-- Footer Section Begin -->
    <jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- Footer Section End -->

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