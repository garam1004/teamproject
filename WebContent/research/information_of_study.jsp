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
    <title>연구 정보 서비스</title>

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
                        <h2>연구 정보 서비스</h2>
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
                                        <span>주요 서비스</span>
                                    </a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                    	<ul>
                                        <li>국내 대학도서관 소장자료 복사/대출</li>
                                        <li>국내 석박사 학위논문 원문서비스, 복사/대출</li>
                                            <li>국내 학술지논문 원문서비스, 복사/대출</li>
                                            <li>해외 전자저널(국가라이선스 28종 등)</li>
                                            <li>외국학술지지원센터(FRIC)</li>
                                            <li>고등교육 교수학습자료 공동활용 체제(KOCW) 서비스</li>
                                            <li>학술관계분석서비스(SAM, Scholar Relation Analysis Map)</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseTwo">
                                        <span>대학 도서관 지원 서비스</span>
                                    </a>
                                </div>
                                <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                    <ul>
                                            <li>종합목록(Union Catalog)</li>
                                            <li>상호대차(Inter-Library Loan, ILL)</li>
                                            <li>dCollection(디지털 학술정보 유통 체계)</li>
                                   </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseThree">
                                        <span> 기타 서비스</span>
                                    </a>
                                </div>
                                <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                       <ul>
                                       		<li>해외 대학 및 학술기관과의 연계를 통한, 글로벌 학술정보 유통망 구축</li>
											<li>일본 대학의 소장자료 검색 및 자료신청 가능</li>
											<li>유럽권자료 검색 및 자료복사서비스 - 프랑스국립도서관(Bibliothèque Nationale de France, BNF) 및 스페인국립도서관(Biblioteca Nacional de España, BNE) 소장자료 중 디지털화가 가능한 단행본, 학술지, 보고서, 팜플렛, 포스터, 이미지, 지도, 신문기사 등</li>
											<li>Westlaw International & Westlaw Next - 미국 연방과 주 판례 및 법령 등의 모든 법률자료와 리뷰, 학술지, 논문, 전문서적, 사전, 보고서, 서식서 제공 / 영국, 호주, 캐나다, EU, 홍콩, 한국, 국제기구 등의 법률 및 판례 정보 제공 / 한국법령(법제처), 대법원 및 고등법원 판결, 헌법재판소, 공정 거래위원회, 한국 소재 대학 발행 저널 등 한국 컨텐츠(영문) 독점 제공</li>
										</ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseFour">
                                        <span>  연혁</span>
                                    </a>
                                </div>
                                <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                      	<ul>
                                      		<li>1998년 5월, 학술연구정보서비스(RISS) 개통</li>
                                      		<li>1999년 4월, 교육부 산하 한국교육학술정보원(KERIS) 설립. EBS 부설 멀티미디어교육지원센터(KMEC)와 기관 통합</li>
                                      		<li>2000년 1월, 국가학술연구 DB 구축(학술지논문 / 학위논문 원문 구축) 시작</li>
                                      		<li>2001년 5월, "교육학술종합정보센터" 지정</li>
                                      		<li>2002년 11월, 일본 대학도서관 종합목록 (NACSIS-CAT) 데이터 베이스 연계</li>
                                      		<li>2003년 11월, 전국 4년제 대학 공동활용체제 가입 (100% 참여)</li>
                                      		<li>2004년 1월, 디지털 학술정보유통시스템(dCollection) 보급 시작</li>
                                      		<li>2005년 7월, ISO 9001:2000 국제품질경영시스템(QMS) 인증 획득</li>
                                      		<li>2006년 12월, 해외 대학용 RISS International 서비스 시작</li>
                                      		<li>2007년 5월, RISS 이용자 100만명 돌파[3]</li>
                                      		<li>2008년 11월, 고등교육 이러닝 서비스(KOCW) 시작</li>
                                      		<li>2010년 10월, 이용자 참여형 RISS 2.0 서비스 제공[4]</li>
                                      		<li>2010년 6월, 7개 외국학술지워넨터 소장정보 데이터 베이스 구축 완료</li>
                                      		<li>2010년 7월, 고등교육 이러닝 서비스 아이폰 애플리케이션 출시[5]</li>
                                      		<li>2011년 8월, RISS 모바일웹 서비스 정식 오픈[6]</li>
                                      		<li>2012년, KERIS와 전국대학간 학술정보 공유․활용 체제 구축(100% 참여, 699개 대학 및 기관)</li>
                                      		<li>2012년 4월, 대학공개강의 KOCW, 매일경제신문 주관, ⌜2012 모바일 브랜드 대상⌟ 수상(공공부문)</li>
                                      		<li>2013년, 학술정보 공개․개방을 위한 링크드 오픈 데이터(LOD) 시범 발행</li>
                                      		<li>2013년, 대학공개강의 KOCW, (디지털조선일보), <앱어워드코리아 2013>‘올해의 앱’공공부문 대상 수상</li>
                                      		<li>2014년, 학술정보 디지털화 및 온라인 제출․수집 시스템(dCollection) 통합운영</li>
                                      		<li>2015년, 이용자 중심 차세대 학술연구정보서비스(RISS) 개편 및 해외 전자정보 대학라이선스 DB 보급 확대(24종)</li>
                                      		<li>2016년, 이용현황 분석 및 참고문헌 구축을 통한 논문 저자 간 관계망 시각화 플랫폼 구축</li>
                                      		<li>2017년 12월, 학술연구정보서비스 RISS, 제10회 대한민국소셜미디어대상 수상(준정부기관부문)</li>
                                      		<li>2018년 5월, 학술연구정보서비스 RISS, 2018년 대한민국고객만족브랜드대상 수상(학술연구부문)</li>
                                      		<li>2019년 12월, 이용자 맞춤형 RISS 서비스 개편	</li>
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