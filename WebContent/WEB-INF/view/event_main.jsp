<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Event 메인 페이지</title>
    <link rel="stylesheet" href="/css/paging.css">
   	<c:import url="/WEB-INF/template/link.jsp"></c:import>
   	    <link rel="stylesheet" href="/css/template.css">
    <style>
        /* 맑음 서비스 색상 #BBDEFA #283593 */
        body *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        .event_main_wrap{
            width:1200px;
            min-height: 100px;
            margin: auto;
            text-align: center;
        }
        .events_top{
            width:100%;
            height:200px;
            padding-top:10px;
            position: relative;
            border-bottom:1px solid #424242;
        }
        /* 페이지 제목 */
        .event_main_title{
            font-size: 50px;
            margin:20px 0;
        }
        /* 이벤트 정렬 방법 버튼 영역 - 진행중인이벤트 / 종료된이벤트 */
        .events_type{
            width:700px;
            height:70px;
            margin: auto;
            line-height: 70px;
        }
        /* 이벤트 정렬 방법 버튼 클릭 용 라벨 */
        .events_type>label{
            width:150px;
            height:50px;
            display: inline-block;
            background-color: #fff;
            line-height: 50px;
            margin-left:20px;
            margin-right:20px;
            cursor:pointer;
        }
        .events_type>label:hover{
            background-color: #BBDEFA;
        }
        /* 이벤트 정렬 방법 라디오 버튼 숨기기 */
        .events_type>input{
            display: none;
        }
        /* 클릭된 상태 */
        .events_type>input:checked+label{
            background-color: #283593;
            color:#fff;
        }
        
        /* 이벤트 등록 버튼*/
        .event_add_btn{
            display: block;
            position: absolute;
            top:130px;
            right:30px;
            text-decoration: none;
            width:100px;
            height:30px;
            font-size:20px;
            line-height: 30px;
            background-color: transparent;
            border-bottom:3px solid #BBDEFA;
            color:#000;
            cursor: pointer;
        }
        .event_add_btn:hover{
            border-color:#283593;
        }
        /* 이벤트들 최신순 정렬 */
        #regdateBtn{
           
            left:100px;
            
        }
        #regdateBtn:hover, #enddateBtn:hover{
            background-color: #283593;
            color: #fff;
        }
        /* 이벤트들 종료예정순 정렬 */
        #enddateBtn{
      
            left:250px;
            
        }

        .events_wrap{
            width:1150px;
            min-height: 100px;
            text-align: left;
            padding:50px 25px;
        }
        /* 이벤트 카드 */
        .event_card{
            width:500px;
            height:300px;
            background-color: #BBDEFA;
            display: inline-block;
            margin-left:50px;
            margin-bottom:50px;
            position: relative;
        }
        /* 디데이 */
        .event_dday{
            display: block;
            position: absolute;
            width:80px;
            height:30px;
            top:15px;
            left:-15px;
            background-color: red;
            color:#fff;
            text-align: center;
            line-height: 30px;
            /*display: none;*/
        }
        .event_dday::before{
            content: "";
            position: absolute;
            bottom:-15px;
            left:0;
            border-right:15px solid darkred;
            border-bottom:15px solid transparent;
        }
        /* 이벤트 썸네일 */
        .event_thumbnail{
            width:100%;
            height:220px;
            display: block;
        }
        .event_title{
            width:100%;
            height:23px;
            /*background-color: yellow;*/
            display: block;
            line-height: 20px;
            text-indent: 10px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .event_brandname{
            width:98%;
            height:30px;
            /*background-color: green;*/
            display: block;
            line-height: 30px;
            text-align: right;
        }
        .event_date{
            width:98%;
            height:30px;
            /*background-color: skyblue;*/
            display: block;
            line-height: 30px;
            text-align: right;
        }
        .events_paging_wrap{
            width:1200px;
            height:100px;
            
        }
        .dateBtn{
       		width:100px;
            height:30px;
       		background-color: #fff; 
            border:none;
            position: absolute;
            bottom:10px;
            cursor: pointer;
            outline:none;
            }
 	
 		.button_click{	
        	background-color: #283593;
            color: #fff;
        	}
        	.event_card_link{
        		text-decoration: none;
        		
        	}
        
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<div class="event_main_wrap ">
    <div class="events_top ">
        <h2 class="event_main_title">EVENT</h2>
        <div class="events_type ">
            <input id="startingEvent" type="radio" name="eventsType" value="starting" checked/>
            <label for="startingEvent">진행중인 이벤트</label>
            <input id="endEvent" type="radio" name="eventsType" value="end"/>
            <label for="endEvent">종료된 이벤트</label>
        </div>
        <c:if test="${loginUser.type.equals('C')}">
        <a href="/event/write" class="event_add_btn">등록</a>
        </c:if>
        <button class="dateBtn button_click" id="regdateBtn" >최신순</button>
        <button class="dateBtn" id="enddateBtn" >종료예정순</button>
    </div>
    <div class="events_wrap ">
    
    </div>
    <div class="events_paging_wrap ">
		<%-- ${paginate } --%>
    </div>
</div>
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script type="text/template" id="eventList">
	<@ _.each(eventList,function(events){ @>
    	<a href="/event/<@=events.no@>" class="event_card_link">
<div class="event_card">
        <@if(events.dDay<=10&&events.dDay>0){ @>
            <span class="event_dday">D - <@=events.dDay @></span>
            <@}@>
            <img class="event_thumbnail" src="/img/event/thumbnail/<@=events.img @>" alt="">
            <span class="event_title"><@=events.title @></span>
            <span class="event_brandname"><@=events.brand @></span>
            <span class="event_date"><@=moment(events.startDate).format("YYYY-MM-DD") @> ~ <@=moment(events.endDate).format("YYYY-MM-DD") @></span>
        </div>
</a> 
	<@}) @>
</script>
<script src="/js/template.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script>
_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};

    var tmp = _.template($("#eventList").html());
    
    var type = "ing";
    
    var order = "new";
    
    var pageNo = 1;
    
    
    console.log(order);
    
	function getEvent(){
	$.ajax({
		url:"/ajax/event/type/"+type+"/order/"+order+"/page/"+pageNo,
		dataType:"json",
		type:"GET",
		error:function() {
			alert("서버 점검중!");
		},
		success:function(json) {
			console.log(json);
			$(".events_wrap").html(tmp({eventList:json.list}));
			$(".events_paging_wrap").html(json.paginate);
			
		}
	});
	};

	getEvent();

	$("#regdateBtn").click(function() {
        order="new";
        console.log(order);
        getEvent();
	});
	
	$("#enddateBtn").click(function() {

	        order="end";
	        console.log(order);
	        getEvent();
	})
	
	$("#startingEvent").click(function() {
		 	type="ing";
	        console.log(type);
	        getEvent();
	});
	
	$("#endEvent").click(function() {
		 	type="end";
	        console.log(type);
	        getEvent();
	})
	
	
	$(".events_paging_wrap").on("click",".paginate a",function(e) {
   	e.preventDefault();
   	var  no = $(this).attr("href");
	console.log(no);
   	var test = no.substring(no.lastIndexOf("/")+1 , no.length);
	console.log(test);
   	pageNo = test;
   	console.log(pageNo);
   	getEvent();
   });
	
	$("button").click(function () {
		 $('.button_click').removeClass('button_click');
	        $(this).addClass('button_click');
	})
</script>
</body>
</html>
