<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

  
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contact US</title>    
</head>
<style>
html, body {width:100%;height:100%;margin:0;padding:0;} 
.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn1 {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn1:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn1:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
</style>
<body>
<jsp:include page="../inc/top.jsp"/>


    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>Contact Us</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="contact__widget__item">
                        <span class="icon_phone"></span>
                        <h4>연락처</h4>
                        <p>070-0909-0808</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="contact__widget__item">
                        <span class="icon_pin_alt"></span>
                        <h4>도서관 위치</h4>
                        <p>부산 부산진구 동천로 109<br> 삼한골든게이트 5층</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="contact__widget__item">
                        <span class="icon_clock_alt"></span>
                        <h4>운영 시간</h4>
                        <p> Mon - Fri: 09:00am - 06:00pm <br>
 							Sat - Sun: 10:00am - 06:00pm
 						</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="contact__widget__item">
                        <span class="icon_mail_alt"></span>
                        <h4>이메일</h4>
                        <p>ansqkdtkdn1@gmail.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
   <div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
    
    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    </div>
</div>
    <!-- Map End -->

    <!-- Leave Comment Begin -->
    <div class="leave-comment comment-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="leave__comment__text">
                        <h2>Contact Us</h2>
                        <form action="${contextPath}/mailSend.do" method="post">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <input type="text" placeholder="Name*" name="subject">
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <input type="text" placeholder="Email*" name="sender">
                                </div>
                                <div class="col-lg-12 text-center">
                                    <textarea placeholder="Your Comment" name="content"></textarea>
                                    <button type="submit" class="site-btn">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Leave Comment End -->
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c8973416cde3628db7e88c25ca84c45"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.158581, 129.062083), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


var markerPosition  = new kakao.maps.LatLng(35.158581, 129.062083); 

var marker = new kakao.maps.Marker({
    position: markerPosition
});

marker.setMap(map);

var iwContent = '<div style="padding:5px;">가람 도서관 5F  <br><a href="https://map.kakao.com/link/map/가람 도서관,35.158581, 129.062083" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/가람 도서관,35.158581, 129.062083" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(35.158581, 129.062083); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

    
// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn1';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn1';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}
</script>
<jsp:include page="../inc/bottom.jsp"/>
</body>

</html>