<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>정보 검색 가이드</title>

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
</head>
<body>
    <jsp:include page="../inc/top.jsp"/>

    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>정보 검색 가이드</h2>
                        <div class="breadcrumb__widget">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- Faq Begin -->
    <div class="faq spad">
        <div class="container">
            <div class="row d-flex justify-content-center" style="margin-top: 30px;">
                <div class="col-lg-10">
                    <div class="faq__accordion">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseOne">
                                        <span>도서(단행본) 검색</span>
                                    </a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                    	<ul>
                                        <li>도서관 홈페이지 – 소장자료 검색에서 원하는 자료의 서명, 저자 등을 입력하여 검색하고, 소장처 및 도서상태(대출가능 여부)를 확인한 후 소장처를 방문하여 대출할 수 있습니다.</li>
                                       
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseTwo">
                                        <span>도서(전자도서) 검색</span>
                                    </a>
                                </div>
                                <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                    <ul>
                                            <li>도서관 홈페이지 – 국내 전자도서 통합검색에서 원하는 자료의 서명, 저자 등을 입력하여 검색한 후 「대출하기」버튼을 클릭하면 전자도서를 대출합니다. 그리고 내 서재 메뉴로 이동하여 「책읽기」버튼을 클릭하면 뷰어 설치(업체별 최초 1회) 후 전자도서를 열람할 수 있습니다.</li>
                                            
                                   </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseThree">
                                        <span> 전자저널(학술지) 검색</span>
                                    </a>
                                </div>
                                <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                       <ul>
                                       		<li>원하는 자료가 학술지에 수록된 논문이나 기사일 경우 먼저 도서관 홈페이지 – 전자저널 검색에서 우리 대학이 구독하는 전자저널인지 확인합니다. 전자저널로 구독 중인 저널은 원하는 논문명을 검색하여 원문을 다운로드 할 수 있습니다.</li>
											
										</ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseFour">
                                        <span>  전자자료(E-Resource) 검색</span>
                                    </a>
                                </div>
                                <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                      	<ul>
                                      		<li>도서관 홈페이지 – E-Resource에서 우리 대학이 구독 중인 전자자료를 이용할 수 있습니다. 전자잡지, 외국어, 자격증, IT 관련 자료를 제공합니다.</li>
                                      		
										</ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseFive">
                                        <span>  주제 분야 관련 키워드 추출</span>
                                    </a>
                                </div>
                                <div id="collapseFive" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                      	<ul>
                                      		<li>도서관 홈페이지 – 통합검색에서 본인이 알고 있는 주제 분야 관련 키워드로 검색하면 연관검색/교차검색 서비스를 통해 입력한
                                      			키워드의 동의어, 관련어, 외국어 대역어를 제공합니다. 제공된 키워드로 재검색을 하면 확장된 검색결과를 얻을 수 있습니다.
                                      		</li>
                                      		<li>주제에 대한 배경지식을 쌓고 정확한 개념 정의 및 관련 키워드 추출을 위해 참고정보원을 활용합니다. 아래의 참고정보원에서 
                                      			사전, 법률/법령, 연감, 특허/규격, 지도, 통계 등 다양한 유형의 자료를 얻을 수 있습니다.
											</li>
										</ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseSix">
                                        <span>  자료 유형별 검색</span>
                                    </a>
                                </div>
                                <div id="collapseSix" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                      	<ul>
                                      		<li>단행본 : 우리 대학 소장자료를 먼저 검색 후 원하는 자료가 없을 시, RISS를 통해 국내·외 대학도서관 소장자료를 이용할 수 있습니다.<br/>
												① 방송대 도서관 소장자료 검색 : 우리 대학이 보유한 소장자료 검색<br/>
												② RISS(한국교육학술정보원) : 국내 대학도서관 및 일본, 중국대학 소장 자료를 검색할 수 있으며, 필요한 경우 복사/대출신청을 통해 자료 이용 가능<br/>
												③ 학술지 논문 : 우리 대학이 구독 중인 국내·외 학술DB를 검색하여 원문을 다운로드하거나 RISS의 타 기관 문헌복사신청을 통해 이용 가능합니다.<br/></li>                                      		
										</ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseSeven">
                                        <span>  원하는 자료가 우리 도서관에 없는 경우</span>
                                    </a>
                                </div>
                                <div id="collapseSeven" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                      	<ul>
                                      		<li>필요로 하는 자료를 우리 대학이 소장하지 않은 경우 희망도서 신청과 RISS 상호대차 신청을 통해 자료를 제공받을 수 있습니다.</li>                                      		
										</ul>
                                    </div>
                                </div>
                            </div>                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Faq End -->

    


    <!-- Footer Section Begin -->
    <jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/jquery.barfiller.js"></script>
    <script src="../js/jquery.slicknav.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/main.js"></script>
</body>

</html>