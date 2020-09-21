<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<!DOCTYPE html>
<html lang="zxx">
<title>IT Academic Conference</title>
<head>
<jsp:include page="../inc/top.jsp" />

	<c:if test="${msg!=null && msg!='' }">
		<script type="text/javascript">
			window.alert("${msg}");
		</script>
	</c:if>
	
</head>
<body>
	<section class="breadcrumb-option set-bg" data-setbg="">
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
						<h3>대여자 : ${sessionScope.rentid}</h3>
						<div class="col-md-12 form-group">
							<div class="classes__filter" style="padding: 40px 20px;">
								<form action="${contextPath}/BookCon/booklist2.do" method="get">
									<select name="searchField">
										<option ${(param.searchField == "title")?"selected":""}
											value="title">제목</option>
										<option ${(param.searchField == "writer")?"selected":""}
											value="writer">글쓴이</option>
										<option ${(param.searchField == "genre")?"selected":""}
											value="genre">장르</option>
									</select> <input type="text" name="search" value="${param.search}">
									<button class="class__filter__btn" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</form>
								<table class="table">
									<tr align="center">
										<td>번호</td>
										<td>제목</td>
										<td>출판사</td>
										<td>저자</td>
										<td>대여자</td>
										<td>예약일</td>
										<td>대여일</td>
										<td>반납일</td>
										<td>반납(버튼)</td>
									</tr>
									<c:forEach var="bookVO" items="${list}" varStatus="status">
										<tr>
											<td>${bookVO.booknum}</td>
											<td>${bookVO.title}</td>
											<td>${bookVO.publisher}</td>
											<td>${bookVO.writer}</td>
											<td>${bookVO.id}</td>
											<td><fmt:formatDate value="${bookVO.resdate}"
													pattern="yy.MM.dd" /></td>
											<td><fmt:formatDate value="${bookVO.rentdate}"
													pattern="yy.MM.dd" /></td>
											<td><fmt:formatDate value="${bookVO.returndate}"
													pattern="yy.MM.dd" /></td>
											<c:choose>
												<c:when test="${bookVO.id==rentid}">
													<c:choose>
														<c:when test="${bookVO.resdate==null }">
															<%--아이디와 대여자가 같을때(대여중이거나 예약중일때) 예약일이 없으면 대여 중 이므로 반납 --%>
															<td><a
																href="${contextPath }/BookCon/bookReturn.do?bookNum=${bookVO.booknum}&nowPage=${nowPage}"
																style="color: red;"> 반납</a></td>
														</c:when>
														<c:otherwise>
															<%--예약일이 있으면 예약중 이므로  대여 --%>
															<td><a
																href="${contextPath }/BookCon/bookRent.do?bookNum=${bookVO.booknum}&nowPage=${nowPage}&rentdate=${bookVO.rentdate}"
																style="color: green;"> 대여</a></td>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:when test="${bookVO.id!=rentid}">
													<%--아이디와 대여자가 같지 않을때 대여중이 아니거나 다른사람이 대여하고 있음 --%>
													<c:choose>
														<c:when
															test="${bookVO.rentdate==null && bookVO.resdate ==null }">
															<%-- 대여일과 예약일 없으면 대여가능--%>
															<td><a
																href="${contextPath }/BookCon/bookRent.do?bookNum=${bookVO.booknum}&nowPage=${nowPage}&rentdate=${bookVO.rentdate}"
																style="color: green;"> 대여</a></td>
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when
																	test="${bookVO.rentdate!=null && bookVO.resdate==null}">
																	<td><a style="color: gray;"> 대여 중 </a></td>
																</c:when>
																<c:when
																	test="${bookVO.resdate!=null && bookVO.rentdate==null}">
																	<td><a style="color: gray;"> 예약 중 </a></td>
																</c:when>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</c:when>
											</c:choose>
										</tr>
									</c:forEach>
								</table>
								<div class="classes__pagination">
									<c:if test="${blockFirst!=1}">
										<a
											href="${contextPath}/BookCon/booklist2.do?nowPage=${blockFirst-blockSize}"><span
											class="arrow_carrot-left"></span></a>
									</c:if>
									<c:forEach var="i" begin="${blockFirst}" end="${blockLast}"
										step="1">
										<a href="${contextPath }/BookCon/booklist2.do?nowPage=${i}">${i}</a>
									</c:forEach>
									<c:if test="${blockLast!=totalPage}">
										<a
											href="${contextPath}/BookCon/booklist2.do?nowPage=${blockLast+1}"><span
											class="arrow_carrot-right"></span></a>
									</c:if>
								</div>
							</div>
						</div>
						<div class="col-lg-12"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../inc/bottom.jsp" />
</body>
</html>

