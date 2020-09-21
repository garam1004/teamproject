<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>열람실 예약</title>
    <style type="text/css">
    	td{height:99px;}
    	.a{color:gray;}
    </style>
</head>

<body>
<jsp:include page="../inc/top.jsp"/>
	<c:if test="${msg!=null && msg!='' }">
		<script type="text/javascript">
			window.alert("${msg}");
		</script>
	</c:if>

	
    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>열람실 예약</h2>

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
				<div class="col-lg-4">
					<div class="classes__sidebar">
						<div class="classes__sidebar__item">
							<h4></h4>
							<div class="classes__sidebar__instructor">
								<div class="classes__sidebar__instructor__pic">
									<img src="../userimage/${memberVO.userimage}" alt="">
								</div>
								<div class="classes__sidebar__instructor__text">
									<div class="classes__sidebar__instructor__title">
										<h4>${memberVO.name}</h4>
										<span>${memberVO.id}</span>
									</div>
									<p>${memberVO.email}<br />
									</p>
									<div class="classes__sidebar__instructor__social"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8" style="margin-top: 30px;">${out}</div>
			</div>

		</div>
	</section>
	<!-- Classes Section End -->
<jsp:include page="../inc/bottom.jsp"/>
</body>

</html>