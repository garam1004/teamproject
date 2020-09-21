<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <section class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__about">
                    	<i class='fas fa-seedling' style='font-size:40px;color:green'></i>
                    	<a style="color:#ececec; font-size:30px; font-weight:bold; pointer-events:none;">가람도서관</a>
                        <!-- <img src="../img/footer-logo.png" alt=""> -->
                        <ul>
                            <li><i class="fa fa-clock-o"></i> Mon - Fri: 09:00am - 06:00pm</li>
                            <li><i class="fa fa-clock-o"></i> Sat - Sun: 10:00am - 06:00pm</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h5>도서관 소식</h5>
                   <ul class="dropdown">
                        <li><a href="../libnews/introduction.jsp">도서관 소개</a></li>
                        <li><a href="../NewsCon/confer.do">학술회 일정</a></li>
                	 	<li><a href="../libnews/contact.jsp">contact us</a></li>
                    </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h5>연구지원</h5>
                    <ul class="dropdown">
                        <li><a href="../research/research_guide.jsp">Research Guide</a></li>
                        <li><a href="../research/information_retrieval.jsp">정보 검색 가이드</a></li>
                        <li><a href="../research/information_of_study.jsp">연구정보 서비스</a></li>
                <c:if test="${not empty sessionScope.id}">
			            <li><a href="../ReadRoomCont/roomlist.do">열람실</a></li>
			    </c:if>		
                    </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h5>Contact Us</h5>
                        <ul class="footer-address">
                            <li><i class="fa fa-phone"></i>070-0909-0808</li>
                            <li><i class="fa fa-envelope"></i>ansqkdtkdn1@gmail.com</li>
                            <li><i class="fa fa-location-arrow"></i>부산 부산진구 동천로 109 삼한골드게이트 5층</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer__copyright">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="footer__copyright__text">
                            <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/jquery.barfiller.js"></script>
    <script src="../js/jquery.slicknav.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/main.js"></script>