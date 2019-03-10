<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="css/tui-date-picker.css">
    <link rel="stylesheet" href="/css/template.css">
 <style>
        /* 맑음 서비스 색상 #BBDEFA #283593 */
        body *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        /* 이벤트 관리자만 볼 수 있는 글 정보 영역 */
        .event_top_info{
            width:100%;
            height:115px;
            /*background-color: yellow;*/
            margin:30PX 0 10px;
            position: relative;
            border-bottom:5px solid #283593;
        }
        /* 이벤트 관리 버튼 */
        .event_btn{
            width:150px;
            height:30px;
            position: absolute;
            bottom:5px;
            border:none;
            background-color: #BBDEFA;
            font-size:20px;
            cursor: pointer;
        }
        .event_btn:hover{
            background-color:#283593;
            color:#fff;
        }
        .update_btn{
            right:250px;
        }
        .delete_btn{
            right:50px;
        }
        /* 이벤트 제목 */
        .event_title{
            width:800px;
            height:45px;
            margin:auto;
            line-height: 45px;
            font-size: 30px;
            text-align: center;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        /* 이벤트 게시글 작성일 */
        .event_regdate{
            width:1150px;
            height:30px;
            margin:auto;
            line-height: 30px;
            font-size: 20px;
            text-align: right;
            color:#717171;
        }
        /* 이벤트 적용기간 */
        .event_date{
            width:800px;
            height:40px;
            margin:auto;
            line-height: 40px;
            font-size: 30px;
            text-align: center;
        }
        /* 이벤트 등록된 사진 표시 박스 */
        .event_detail{
            width:100%;
            /* border-top:5px solid #283593; */
        }
        /* 이벤트 관리자 관련 정보 */
        .event_admin_info{
            min-width:100px;
            height:100px;
            /*background-color: lightpink;*/
            position: fixed;
            top:400px;
            right:50px;
        }
        /* 브랜드 로고 클릭시 정보 확인 가능 */
        .brand_logo{
            width:100px;
            height:100px;
            background-color: #fff;
            position: absolute;
            top:0;
            right:0;
            cursor: pointer;
        }
        /* 브랜드 로고 표시 */
        .brand_logo>img{
            width:100%;
            height:100%;
            object-fit: contain;
        }
        /* 브랜드 이름, 담당자 이메일 */
        .brand_name, .email_info{
            min-width:700px;
            height:50px;
            position: absolute;
            right:100px;
            background-color: transparent;
            text-shadow: 0 0 20px #000;
            color:#fff;
            font-size:35px;
            line-height: 50px;
            text-align: right;
            padding:0 20px;
        }
        .brand_name{
            top:0;
        }
        .email_info{
            bottom:0;
        }
        .display_none{
            display: none;
        }
        /* 이벤트 등록된 이미지 요소 크기 */
        .img_box{
            width:100%;
            height:100%;
            /* display: inline-block;
            margin: auto; */
        }
        /* 이미지 사이즈 */
        .img_box>img{
            width:100%;
            height:100%;
            object-fit: contain;
        }
        
        .brand_name,.email_info{
        	cursor: pointer;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<c:if test="${loginUser.no==event.userNo }"> 
<div class="event_top_info">
    <div class="event_title">${event.title }</div>
    <div class="event_regdate">${event.regdate }</div>
    <div class="event_date">${event.startDate } ~ ${event.endDate }</div>
    <button class="event_btn update_btn" onclick="location.href='/event/update'" type="button">수정</button>
    <form action="/event/delete" method="POST">
    <input type="hidden" name="_method" value="DELETE"/>
    <input type="hidden" name="eventNo" value="${event.no }"/>
    <input type="hidden" name="eventId" value="${loginUser.id }"/>
    	<button class="event_btn delete_btn" type="submit">삭제</button>
	</form>
</div>
</c:if>
<div class="event_detail">
	<div class="event_admin_info">
        <div class="brand_logo "><img src="/img/profile/thumbnail/${event.img }" alt=""/></div>
        <div class="brand_name display_none">${event.brand }</div>
        <div class="email_info display_none">${event.email }</div>
    </div>
</div>

<c:forEach items="${event.eventImgs}" var="eventImg">
    <div class="img_box">
	<img class="event_img_main" src="/img/event/thumbnail/${eventImg.img }" alt=""/>
    </div>
</c:forEach>

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>

    //클릭시 해당 브랜드 정보 확인
    $(".event_admin_info").mouseenter(function () {
        $(".brand_name").fadeIn(500);
        $(".email_info").fadeIn(500);
    });
    $(".event_admin_info").mouseleave(function () {
        $(".brand_name").fadeOut(500);
        $(".email_info").fadeOut(500);
    });
    
    $('.event_admin_info').on('click',function(){
    	alert("${event.email } 가 복사되었습니다.");
    })
</script>
</body>
</html>