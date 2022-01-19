<%@page import="mul.camp.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto) request.getSession().getAttribute("login");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/abc.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <style type="text/css">
    body{
       background-image:url('image/background.jpg');
       background-repeat:no-repeat;
       background-position:cener;
    }
    </style>
    
    <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <script src="https://kit.fontawesome.com/dab690a483.js" crossorigin="anonymous"></script> 
    <!-- Bootstrap core CSS -->
   <!-- <link href="/webjars/bootstrap/4.5.3/css/bootstrap.css" rel="stylesheet"> -->
    
     <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/abc.css" rel="stylesheet" />
    
    <link rel="shortcut icon" type="image/x-icon" href="image/YAZASOO.png">
    
    <script src="js/raphael_min.js" type="text/javascript" charset="utf-8"></script>
   <script src="js/raphael_path_s.korea.js" type="text/javascript" charset="utf-8"></script>
    <title>YAZASOO</title>   
</head>
<script type="text/javascript">
function mainSearch(){
   let searchText = document.getElementById("searchText").value;
   location.href="board.do?choice=title&search="+searchText;
}
function enterkeyE() {
    if (window.event.keyCode == 13) {
    	mainSearch();
    }
}
</script>
<body>  
    <header id="main-header">
        <jsp:include page="./headerMenu.jsp"></jsp:include>    
        <div class="main-word"></div>
        <div align="left">
    <h3 style="font-weight:900;"><span class="main-green">나만의</span> 여행지는<br>어디인가요?</h3>
       <p class="sub-text">가고싶은 곳의 후기를 검색하고 다른사람들과 공유해보세요</p>
    <div>
       <input type="text" class="search-bar" id="searchText" onkeyup="enterkeyE()">
       <a href="#" onclick="mainSearch()"><i class="fas fa-search fa-lg" id="search-icon"></i></a>
    </div>
    </div>
                    
    </header>
    <body>
    
    <aside>
    <!-- 여기부터 반응형 지도 -->
      <div id="canvas">
         <div id="south"></div>
            
         <div id="seoul">
            <h2>서울 인기 관광명소</h2>
            <p class="area_text">코엑스<br>한류스타 거리<br>여의도 한강공원<br>청계천<br>경복궁<br>N서울타워<br>세빛섬<br>롯데월드<br>남산골 한옥마을<br>명동 쇼핑 거리</p>
         </div>
         
         <div id="gygg">
            <h2>경기도 인기 관광명소</h2>
            <p class="area_text">에버랜드<br>헤이리 예술마을<br>아침고요 수목원<br>두물머리<br>한국 민속촌<br>궁평항<br>산정 호수<br>포천 아트밸리<br>벽초지 수목원<br>쁘띠 프랑스</p>
         </div>
         
         <div id="incheon">
            <h2>인천 인기 관광명소</h2>
            <p class="area_text">송도 센트럴 파크<br>인천 대교<br>송월 동화마을<br>G타워<br>인천 대공원<br>자유공원<br>신포 국제시장<br>차이나 타운<br>전등사<br>인천 상륙 작전 기념관</p>
         </div>
         
         <div id="gangwon">
            <h2>강원도 인기 관광명소</h2>
            <p class="area_text">대관령 양떼목장<br>하슬라 아트월드<br>남이섬<br>안반데기<br>오죽헌<br>제이드 가든<br>경포 해변<br>추암 촛대바위<br>장호항<br>속초 해수욕장</p>
         </div>
         
         <div id="chungbuk">
            <h2>충청북도 인기 관광명소</h2>
            <p class="area_text">의림지<br>도담 삼봉<br>법주사<br>청남대<br>고수 동굴<br>수암골<br>상당산성<br>만천하 스카이워크<br>사인암<br>비내섬</p>
         </div>
         
         <div id="chungnam">
            <h2>충청남도 인기 관광명소</h2>
            <p class="area_text">궁남지<br>공산성<br>해미읍성<br>꽃지 해수욕장<br>만리포 해수욕장<br>천리포 수목원<br>무창포 해수욕장<br>아산 지중해 마을<br>삼길포항<br>남당항</p>
         </div>
         
         <div id="daejeon">
            <h2>대전 인기 관광명소</h2>
            <p class="area_text">대전 오월드<br>엑스포 과학공원<br>국립 중앙 과학관<br>한밭 수목원<br>옛터 민속 박물관<br>장태산 자연 휴양림<br>만인산 자연 휴양림<br>뿌리공원<br>유림 공원<br>대동 하늘공원</p>
         </div>
         
         <div id="sejong">
            <h2>세종 인기 관광명소</h2>
            <p class="area_text">세종 호수공원<br>국립 세종 수목원<br>베어트리 파크<br>뒤웅박 고을<br>금강 자연 휴양림<br>고복 저수지<br>세종 중앙공원<br>금강 수변공원<br>조치원 테마거리<br>밀마루 전망대</p>
         </div>
         
         <div id="gwangju">
            <h2>광주 인기 관광명소</h2>
            <p class="area_text">무등산<br>펭귄 마을<br>광주 패밀리랜드<br>광주 사직공원<br>광주호 호수 생태공원<br>우치공원 동물원<br>5.18 기념공원<br>송산 유원지<br>청춘 발산마을<br>국립 광주 박물관</p>
         </div>
         
         <div id="jeonbuk">
            <h2>전라북도 인기 관광명소</h2>
            <p class="area_text">광한루원<br>전주 한옥마을<br>경암동 철길마을<br>전주 동물원<br>채석강<br>덕유산<br>신시도<br>상하농원<br>고창읍성<br>선유도 해수욕장</p>
         </div>
         
         <div id="jeonnam">
            <h2>전라남도 인기 관광명소</h2>
            <p class="area_text">죽녹원<br>오동도<br>대흥사<br>순천만 국가정원<br>메타세콰이어 길<br>낙안읍성 민속마을<br>섬진강 기차마을<br>아쿠아 플라넷 여수<br>보성 녹차밭<br>순천 드라마 세트장</p>
         </div>
               
         <div id="gyeongbuk">
            <h2>경상북도 인기 관광명소</h2>
            <p class="area_text">첨성대<br>동궁과 월지<br>안동 하회마을<br>부석사<br>석굴암<br>황성공원<br>경주월드<br>팔공산 갓바위<br>호미곶 해맞이 광장<br>문경새재 도립공원</p>
         </div>
         
         <div id="gyeongnam">
            <h2>경상남도 인기 관광명소</h2>
            <p class="area_text">동피랑 벽화마을<br>다랭이 마을<br>지리산<br>욕지도<br>진주성<br>몽돌 해수욕장<br>법기 수원지<br>남해 독일마을<br>바람의 언덕<br>이순신 공원</p>
         </div>
         
         <div id="daegu">
            <h2>대구 인기 관광명소</h2>
            <p class="area_text">이월드<br>스파밸리<br>EXCO<br>옥연지 송해공원<br>팔공산 케이블카<br>에코 테마파크 대구숲<br>대구 수목원<br>비슬산 자연 휴양림<br>네이처 파크<br>83타워</p>
         </div>
         
         <div id="busan">
            <h2>부산 인기 관광명소</h2>
            <p class="area_text">광안리 해수욕장<br>태종대<br>해운대 해수욕장<br>다대포 해수욕장<br>송도 해수욕장<br>감천 문화마을<br>더 베이 101<br>씨라이프 부산 아쿠아리움<br>동백섬<br>흰여울 문화마을</p>
         </div>
         
         <div id="ulsan">
            <h2>울산 인기 관광명소</h2>
            <p class="area_text">간절곶<br>가지산<br>대왕암 공원<br>진하 해수욕장<br>울산 대공원<br>태화강 국가정원<br>일산 해수욕장<br>자수정 동굴나라<br>선암 호수공원<br>강동 몽돌해변</p>
         </div>
         
         <div id="jeju">
            <h2>제주도 인기 관광명소</h2>
            <p class="area_text">협재 해수욕장<br>함덕 해수욕장<br>오설록 티 뮤지엄<br>카멜리아 힐<br>대포 주상절리<br>새별오름<br>한라산 둘레길<br>쇠소깍<br>우도<br>비자림</p>
         </div>         
      </div>
   </aside>
    </body>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="./footer.jsp"></jsp:include>
    </body>
    </html>