<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
	<script type="text/javascript">
	
		function res(){
			var startDate = document.getElementById('startDate').value;
		
			if(startDate==null||startDate==''){
				window.alert("날짜를 선택해주세요");
			}else{
				document.getElementById('res').submit();
			}
		}

	</script>
    <title>도서 상세보기</title>
</head>
<body>
<jsp:include page="../inc/top.jsp"/>

    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>도서 상세 보기 </h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br><br><br>
    <!-- Breadcrumb End -->

    <!-- Classes Section Begin -->
	<section class="classes-details spad">
		<div class="container">
		<div class="row mb-10 align-items-center">
		<div class="col-md-10 mx-auto" >
			<div class="row">

				<div class="col-lg-4">
					<div class="classes__details">
						<div class="classes__details__large">
							<img src="../bookimg/${bookVO.bookimage}" style="max-width:100%;">
						</div>
					</div>
				</div>
				<div class="col-lg-3">
				<ul style="list-style:none;">
					<ul class="classes__details__widget" style="list-style:none; margin-left:10%;">
							<li><i class='fas fa-book-open'></i> <b>책 제목</b><br> ${bookVO.title}</li><br>
							<li><i class='fas fa-book-open'></i> <b>저자명</b><br>  ${bookVO.writer}</li><br>
							<li><i class='fas fa-book-open'></i> <b>출판일</b><br>  ${bookVO.publishdate}</li><br>
							<li><i class='fas fa-book-open'></i> <b>출판사</b><br>  ${bookVO.publisher}</li><br>
							<li><i class='fas fa-book-open'></i> <b>장르 </b> ${bookVO.genre}</li>
					</ul>
				</ul>			


				</div>
				<div  class="col-lg-5">
					<div class="classes__sidebar">
						<div class="classes__sidebar__item classes__sidebar__item--info">
							<br>
							<h4>도서 대출 예약 신청</h4>
							<form action="${contextPath}/BookCon/bookRe.do" id="res">
								<input type="hidden" name="bookNum" value="${bookVO.booknum}">
								<input type="hidden" name="id" value="${id}">
						
						<c:choose>
						<c:when test="${bookVO.resdate==null && id!=null && bookVO.rentdate==null}">
								<input type="text" id="startDate" name="startDate" class="sidebar-btn" placeholder="예약일" style="width:130px;"/> 
								<input type="text" id="endDate" name="endDate" class="sidebar-btn" placeholder="반납일" style="width:130px;"/>
								<input type="button" value="예약" class="sidebar-btn" onclick="res()"/>
						</c:when>
						<c:when test="${id==null}">
							<input type="text" class="sidebar-btn" placeholder="로그인이 필요합니다" disabled="disabled"/>						
						</c:when>
						<c:otherwise>
							<input type="text" class="sidebar-btn" placeholder="예약 불가능" disabled="disabled"/>
						</c:otherwise>
						</c:choose>
							</form>
						</div>
							도서 대출 상태 : 
						<c:choose>
						<c:when test="${bookVO.resdate==null && bookVO.rentdate == null}">
							<i class='far fa-circle' style="color:blue;"></i>
						</c:when>
						
						<c:otherwise>
							<i class='fa fa-remove' style="color:red;"></i>
						</c:otherwise>
						</c:choose>
							
						<br><br><br>
							<input type="button" onclick="history.back()" class="site-btn" value="목록" style="float: right;">
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
	</section>
<jsp:include page="../inc/bottom.jsp"/>
</body>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script>
    var rangeDate = 6; // set limit day
    var setSdate, setEdate;
    $("#startDate").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0,
        maxDate: 7,
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        onSelect: function(selectDate){
            var stxt = selectDate.split("-");
                stxt[1] = stxt[1] - 1;
            var sdate = new Date(stxt[0], stxt[1], stxt[2]);
            var edate = new Date(stxt[0], stxt[1], stxt[2]);
                edate.setDate(sdate.getDate() + rangeDate);
            
                
            $("#endDate").datepicker('setDate',edate);
            $("#endDate").datepicker('option', {
                minDate: selectDate,
                beforeShow : function () {
                    $("#endDate").datepicker( "option", "maxDate", edate );
                    setSdate = selectDate;
                    console.log(setSdate)
            }});
            //to 설정

        }
        //from 선택되었을 때
    });
     
    $("#endDate").datepicker({
        dateFormat: 'yy-mm-dd',
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        onSelect : function(selectDate){
            setEdate = selectDate;
            console.log(setEdate)
        }
    });
	  </script>
	
</html>