<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <link rel="stylesheet" href="css/reset.css">
	<link rel="icon" href="/img/favicon/favicon.png">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="/css/index.css"/>
</head>
<body>
<div id="indexWrap">
            <div id="header">
                <div id="logo">
                    <img src="/img/logo_1.png"/>
                </div>
                <div id="loginWrap">
                   <c:choose>
                   	<c:when test="${loginUser==null }">
                    <div id="logoutBox">
                        <a href="/login"><div class="head_btn">로그인</div></a>
                        <a href="/join"><div class="head_btn">회원가입</div></a>
                    </div>                   	
                   	</c:when>
                   	<c:otherwise>
	                    <div id="loginBox">
                        	<a href="/mypage/${loginUser.id}">
	                    	<c:choose>
                			<c:when test="${loginUser.img==null }">
                        	<div id="profileBox">${loginUser.name.substring(0,1) }</div>
                        	</c:when>
                    		<c:otherwise>
                        	<img id="profileImg" src="/img/profile/thumbnail/${loginUser.img }" title="마이페이지로 가기" alt="${loginUser.id }"/>
                        	</c:otherwise>
                			</c:choose>
                        	</a>
                        	<form action="/session" method="POST" id="logoutForm">
                        	<input type="hidden" name="_method" value="DELETE" />
                        	<button id="logoutBtn" title="로그아웃"><i class="fas fa-door-open"></i></button>
                    		</form>
                    	</div>
                   	</c:otherwise>
                   </c:choose>
                </div>
                <ul id="menuWrap">
                    <li class="nav_menu"><a href="/items">제품</a></li>
                    <li class="nav_menu"><a href="/reviews">리뷰</a></li>
                    <li class="nav_menu"><a href="/events">이벤트</a></li>
                    <li class="nav_menu"><a href="/search/items">
                        <div id="searchBtn"><span>뷰티 정보 찾아보기</span>
                             <i class="fas fa-search"></i></div></a></li>
                </ul>
            </div><!--//header  end-->

           <div id="bannerWrap">
              <div id="bannerBox">
               <img id="oneBannerImg" src="/img/innisfree1.jpg" alt="배너이미지1" class="img_transition banner_on"/><!--
            --><img id="tweBannerImg" src="/img/innisfree2.jpg" alt="배너이미지2" class="img_transition"/><!--
            --><img id="threeBannerImg" src="/img/innisfree3.jpg" alt="배너이미지3" class="img_transition"/><!--
            --><img id="fourBannerImg" src="/img/innisfree4.jpg" alt="배너이미지4" class="img_transition"/><!--
            --><img id="fiveBannerImg" src="/img/oliceyoung.jpg" alt="배너이미지5" class="img_transition"/>
               </div><!--//bannerBox end-->
           </div><!--//bannerWrap end-->
</div><!--// indexWrap end-->

<script src="js/jquery.js"></script>
<script>
    var windowWidth = 0;
    var windowHeight = 0;
    resizeAll();
    $(window).resize(function () {
        console.log("리사이즈중");
        resizeAll();
    });
    var pos = 0;
    var num=1;
    setInterval(moveBanner,5000);
    function resizeAll() {

        windowWidth =$(window).width();
        windowHeight =$(window).height();

        $('#indexWrap').css({
            "width":windowWidth,
            "height":windowHeight
        });


        $('#bannerWrap').css({
            "width":windowWidth,
            "height":windowHeight
        });

        $('#bannerBox').css({
            "width": windowWidth,
            "height":(windowHeight * 5)
        });

        $("#bannerBox img").css({
            "width":windowWidth,
            "height":windowHeight
        })

        $("#header").css({
            "width":windowWidth
        })
    } // resizeAll() end

    function moveBanner() {
        pos -=windowHeight;
        num++;

        console.log("pos ::"+pos);
        console.log("(pos*5) ::"+(windowHeight*4));

        if(pos<-(windowHeight*4)){
            pos=0;
            num=1;
            console.log("초기화");
        }
        $('.banner_on').removeClass('banner_on');
        $('.img_transition:nth-child('+num+')').addClass('banner_on');

        $('#bannerBox').css('transform','translateY('+pos+'px)');
    };
</script>
</body>
</html>