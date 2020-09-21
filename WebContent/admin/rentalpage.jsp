<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<!DOCTYPE html>

<style type="text/css">
#i:hover {
	color: blue !important;
}
</style>
<html lang="zxx">
<title>IT Academic Conference</title>
<head>
<jsp:include page="../inc/top.jsp" />
</head>
<body>
	<section class="breadcrumb-option set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>대여시스템</h2>
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
						<div class="col-md-12 form-group">
							<div class="classes__filter" style="padding: 40px 20px;">
								<form action="${contextPath}/member2/meminfo.do" method="post">
									<label>ID 검색</label> <input type="text" name="search"
										placeholder="이름 또는 핸드폰번호">
									<button class="class__filter__btn" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</form>
								<form action="${contextPath}/member2/meminfo.do" method="post">
									<c:choose>
										<c:when test="${list==null }">
										</c:when>
										<c:otherwise>
											<table class="table">
												<tr>
													<td>ID</td>
													<td>이름</td>
													<td>핸드폰번호</td>
													<td></td>
													<td></td>
													<c:forEach var="memVO" items="${list}" varStatus="status">
														<tr>
															<td>${memVO.id }</td>
															<td>${memVO.name }</td>
															<td>${memVO.phone }</td>
															<td><a
																href="${contextPath}/BookCon/rentid.do?rentid=${memVO.id}"><i
																	id="i" style="color: lightgray;" class="fa fa-check"></i></a>
															</td>
														</tr>
													</c:forEach>
											</table>
										</c:otherwise>
									</c:choose>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../inc/bottom.jsp" />
</body>
</html>

