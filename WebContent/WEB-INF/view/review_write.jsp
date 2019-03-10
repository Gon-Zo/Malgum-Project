<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
        <link rel="stylesheet" href="/css/template.css">
    <style>
        /* 맑음 서비스 색상 #BBDEFA #283593 */
        body *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        /* 리뷰 작성 전체 영역 */
        .review_wrap{
            width:1200px;
            min-height:100px;
            /*background-color: beige;*/
            margin:auto;
        }

        /* 리뷰 작성 메인 타이틀 */
        .review_page_title{
            width:auto;
            /*background-color: rebeccapurple;*/
            text-align: center;
            font-size:35px;
            padding: 30px 0;
        }
        /* 리뷰 작성 폼 안에 각 파트별 박스 */
        .review_box{

        }
        /* 제품 관련 박스 */
        .product_box{
            width:1000px;
            height: 100px;
            line-height: 50px;
            margin: auto;
            text-align: center;
            position: relative;
        }
        /* 제품 입력 창 */
        #productName{
            width:600px;
            height:40px;
            font-size:20px;
            text-indent: 5px;
            outline: none;
            background-color: #BBDEFA;
            border:none;
            border-bottom:5px solid #BBDEFA;
        }
        #productName:focus, #reviewTitle:focus{
            border-color: #283593;
        }
        /* 제품 이름 자동완성 박스 */
        #productAutoNameBox{
            max-width:595px;
            max-height:200px;
            margin: auto;
            position: relative;
            z-index: 1;
            /* background-color: olive; */
            display: none;
            overflow-y: auto;
        }
        .list_item{
        	width: 585px;
        }
        .list_item>li{
        	height:40px;
        	padding-left: 10px;
        	font-size: 20px;
        	text-align: left;
        	width: 571px;
        	height:40px;
        	line-height:40px;
        	cursor:pointer;
        	overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
        	background-color: #BBDEFA;
        }
        .list_item>li:hover{
        background: #283593;
        color: #fff;
        }
        
        
        /* 제품 입력창에 검색 아이콘 */
        #productIcon{
            width:40px;
            height:40px;
            line-height: 40px;
            /*background-color: rebeccapurple;*/
            font-size:25px;
            position: absolute;
            top:10px;
            right:200px;
            cursor: pointer;
            color:#283593;
        }
        /* 선물 관련 박스 */
        .gift_box{
            width:1000px;
            height: 180px;
            margin: auto;
            text-align: center;
            position: relative;
            padding-top:20px;
        }
        .gift_box>span{
            display: block;
            font-size:20px;
        }
        /* 선물 유무 체크 */
        #giftLabel{
            margin:10px 0;
            width:150px;
            height:120px;
            display: inline-block;
            cursor: pointer;
            background-color: #fff;
            border:5px solid #fff;
        }
        /* 선물상자 이미지 */
        #giftLabel img{
            width:100%;
            height:100%;
            object-fit: cover;
        }
        #giftLabel:hover{
            border-color: #283593;
        }
        /* 체크박스 숨기기 */
        #giftCheck{
            display: none;
        }
        /* 체크박스에 체크가 되면 선물상자에 테두리색이 변경됨 */
        #giftCheck:checked ~ #giftLabel{
            border-color: #283593;
        }

        /* 제품 평가 관련 박스 */
        .score_box{
            width:1000px;
            height: 100px;
            margin: auto;
            text-align: center;
            position: relative;
            padding-top:20px;
        }
        /* 제품 평가란 타이틀 */
        .score_box>span{
            display: block;
            font-size: 20px;
        }
        /* 평가 점수 박스 */
        .review_star_box{
            width:400px;
            height:60px;
            margin:auto;
            /*background-color: lightblue;*/
            line-height: 60px;
            
        }
        .review_star_box>span{
            font-size:40px;
            color:#BBDEFA;
			cursor:pointer;
        }

        /* 리뷰 제목 관련 박스 */
        .title_box{
            width:1000px;
            height: 70px;
            margin: auto;
            text-align: center;
            position: relative;
            padding-top:20px;
        }
        /* 리뷰 제목 입력창 */
        #reviewTitle{
            width:600px;
            height:40px;
            font-size:20px;
            text-indent: 5px;
            outline: none;
            background-color: #BBDEFA;
            border:none;
            border-bottom:5px solid #BBDEFA;
        }

        /* 리뷰의 타입 관련 박스 */
        .review_type_box{
            width:1000px;
            height: 100px;
            margin: auto;
            text-align: center;
            position: relative;
            line-height: 100px;
        }
        /* 리뷰의 타입 선택용 라벨 */
        .review_type_box>label{
            width:150px;
            height:40px;
            display: inline-block;
            background-color: #BBDEFA;
            line-height: 35px;
            border:5px solid transparent;
            font-size:20px;
            margin-left:20px;
            cursor: pointer;
        }
        .review_type_box>label:hover{
            border-color: #283593;
        }
        /* 라디오 버튼 숨기기 */
        .review_type_box>input{
            display: none;
        }
        /* 리뷰 타입 선택시 표시 */
        .review_type_box>input:checked+label{
            border-color: #283593;
            background-color: #283593;
            color:#fff;
            font-weight: bold;
        }
        /* 이미지 리뷰 작성 박스 */
        .img_review_box{
            width:1000px;
            min-height: 100px;
            margin: auto;
            text-align: center;
            position: relative;
            /*background-color: lightpink;*/
        }
        /* 이미지 리뷰 작성 창 */
        .img_review_part{
            margin:10px auto;
            width:600px;
            height:500px;
            background-color: #fff;
            position: relative;
            border:1px solid #424242;
        }
        /* 대표이미지 마크 */
        .img_mark{
            width:80px;
            height:80px;
            /*background-color: lightpink;*/
            position: absolute;
            top:-1px;
            left:-1px;
            line-height: 65px;
        }
        /* 대표사진 글귀 span */
        .img_mark>span{
            position: absolute;
            top:0;
            left:7px;
            color:#fff;
            font-weight: bold;
        }
        /* 대표사진 글귀 뒤 배경 */
        .img_mark>i{
            font-size:100px;
            position: absolute;
            top:-10px;
            left:0;
            color:#283593;
        }
        /* 이미지 삭제 버튼 */
        .img_delete_btn{
            width:30px;
            height:30px;
            background-color: transparent;
            border:none;
            cursor: pointer;
            outline: none;
            font-size:30px;
            line-height: 0;
            position: absolute;
            top:5px;
            right:5px;
            color:lightgray;
        }
        .img_delete_btn:hover{
            color:#283593;
        }
        /* 이미지 리뷰 작성 part 별 삭제 버튼 */
        .part_delete_btn{
            width:50px;
            height:50px;
            background-color: transparent;
            border:none;
            cursor: pointer;
            outline: none;
            font-size:50px;
            line-height: 0;
            position: absolute;
            top:5px;
            right:-55px;
            color:lightgray;
        }
        .part_delete_btn:hover{
            color:#283593;
        }
        /* 리뷰 순서 변경 버튼 박스 */
        .move_btn_box{
            width:40px;
            height:120px;
            /*background-color: lightblue;*/
            position: absolute;
            top:200px;
            right:-50px;
        }
        /* 리뷰 순서 변경 버튼 */
        .part_move_btn{
            width:40px;
            height:40px;
            position: absolute;
            background-color: transparent;
            border:none;
            outline: none;
            cursor: pointer;
            font-size:30px;
            left:0;
            color:lightgray;
        }
        .part_move_btn:hover{
            color:#283593;
        }
        .part_up_btn{
            top:5px;
        }
        .part_down_btn{
            top:50px;
        }
        /* 현 리뷰의 순서 알려주는 span */
        .review_part_count{
            width:40px;
            height:30px;
            position: absolute;
            bottom:0;
            left:0;
            /*background-color: gray;*/
            line-height: 30px;
        }
        /* 이미지 요소 */
        .img_review_main{
            width:100%;
            height:350px;
            /*background-color: transparent;*/
            display: block;
            position: relative;
            object-fit: contain;
        }
        /* 사진에 대한 설명 입력 창 */
        .img_review_sub{
            width:580px;
            height:128px;
            resize: none;
            outline: none;
            padding:10px;
            border:none;
            border-top:1px solid #424242;
            font-size:20px;
        }
        /* 이미지 업로드 아이콘 */
        .img_upload_btn{
            width:200px;
            height:200px;
            /*background-color: #fff;*/
            cursor: pointer;
            position: absolute;
            top:50%;
            left:50%;
            margin: -170px 0 0 -100px;
        }
        .img_upload_btn>i{
            font-size:200px;
            color:lightgray;
        }
        .img_upload_btn>i:hover{
            color:#283593;
        }
        /* input file 숨기기 */
        .img_upload{
            display: none;
        }
        /* 이미지 추가하기 위한 버튼 */
        #partAddBtn{
            width:100px;
            height:100px;
            margin: 10px;
            background-color: #fff;
            border:none;
            font-size: 80px;
            color: lightgray;
            cursor: pointer;
            outline: none;
        }
        #partAddBtn:hover{
            color:#283593;
        }
        /* 간단리뷰 폼 */
        .simple_review_box{
            width:1000px;
            height: 300px;
            margin: auto;
            text-align: center;
            /*background-color: lightcoral;*/
        }
        /* 간단리뷰 작성 창 */
        #simpleReviewContents{
            width:580px;
            height:250px;
            padding:10px;
            resize: none;
            border: 1px solid #424242;
            margin:10px 0;
            font-size:20px;
        }
        /* 작성 관련 버튼 */
        .button_box{
            width:1000px;
            height: 70px;
            margin: auto;
            text-align: right;
            /*background-color: lightcoral;*/
            line-height: 70px;
        }
        .button_box>button{
            width:150px;
            height:40px;
            background-color: #fff;
            border: none;
            font-size:25px;
        }
        #reviewSubmit {
            background-color: #fff;
            color:#283593;
            margin-right:50px;
            outline: none;
            border:1px solid #283593;
        }
        #reviewClose {
            background-color: #fff;
            margin-right:200px;
            outline: none;
            color:#283593;
            border:1px solid #283593;
        }
        #reviewSubmit:hover, #reviewClose:hover{
            background-color: #283593;
            color:#fff;
        }
        .display_none{
            display: none;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<!--header end-->

<div class="review_wrap">
    <h3 class="review_page_title">리뷰 작성</h3>
    <form id="reviewWriteForm" action="/review/write" method="post">
        <fieldset>
            <legend class="screen_out">리뷰 작성 폼</legend>
            <div class="product_box review_box ">
                <input id="productName" name="productName" autocomplete="off" placeholder="작성하실 제품을 검색하세요">
                <i id="productIcon" class="fas fa-search"></i>
                <div id="productAutoNameBox">
					 <ul class="list_item">
                    </ul>
                </div>
					<input id="itemNo" name="itemNo" value="" type="hidden" />
					<input id="userNo" name="userNo" value="${loginUser.no }" type="hidden" />
            </div>
            <div class="gift_box review_box ">
                <span>선물한 제품을 리뷰로 작성하시면 상자를 눌러주세요.</span>
                <input type="checkbox" id="giftCheck" />
                <input id="giftCheckValue" type="hidden" name="gift" value="F"/>
                <label id="giftLabel" for="giftCheck"><img src="/img/gift_box.jpg" alt="선물상자"/></label>
            </div>
            <div class="score_box review_box ">
                <span>이 제품을 어떻게 평가하세요?</span>
                <div class="review_star_box">
                	<input type="hidden" name="score" value="1"/>
                    <span><i class="fas fa-tint"></i></span>
                    <span><i class="fas fa-tint"></i></span>
                    <span><i class="fas fa-tint"></i></span>
                    <span><i class="fas fa-tint"></i></span>
                    <span><i class="fas fa-tint"></i></span>
                </div>
            </div>
            <div class="title_box review_box ">
                <input value="" id="reviewTitle" autocomplete="off" name="title" placeholder="제목을 입력하세요">
            </div>
            <div class="review_type_box review_box ">
                <input id="typeImg" type="radio" name="type" value="I"/>
                <label for="typeImg">이미지리뷰</label>
                <input id="typeSimple" type="radio" name="type" value="T"/>
                <label for="typeSimple">간단리뷰</label>
            </div>
            <div class="img_review_box review_box display_none">
                <div class="review_part_wrap">
                    <div class="img_review_part">
                        <img class="img_review_main" src="" alt=""/>
                        <button type="button" class="display_none img_delete_btn fas fa-times"></button>
                        <label class="img_upload_btn ">
                            <i class="far fa-image"></i>
                            <input onchange="readURL(this);" type="file" class="img_upload">
                            <input class="img_name" type="hidden" name="img" />
                        </label>
                        <div class="img_mark"><i class="fas fa-bookmark"></i><span>대표사진</span></div>
                        <div class="move_btn_box">
                            <button type="button" class="part_up_btn part_move_btn fas fa-chevron-up"></button>
                            <button type="button" class="part_down_btn part_move_btn fas fa-chevron-down"></button>
                            <span class="review_part_count">1/10</span>
                        </div>
                        <textarea class="img_review_sub" name="imgReviewSub" placeholder="사진에 대한 설명을 입력해주세요."></textarea>
                    </div>
                </div>
                <button type="button" class="far fa-images " id="partAddBtn"></button>
            </div>
            <div class="simple_review_box review_box display_none">
                <textarea id="simpleReviewContents" name="content" placeholder="내용을 입력해주세요."></textarea>
            </div>
            <div class="button_box review_box">
                <button id="reviewSubmit" type="submit">작성</button>
                <button id="reviewClose" type="reset">취소</button>
            </div>
        </fieldset>
    </form>
</div>

<c:import url="/WEB-INF/template/footer.jsp"/>
<!--#footer end-->
<script type="text/template" id="imgReviewPartTmp">
    <div class="img_review_part">
        <img class="img_review_main" src="" alt=""/>
        <button type="button" class="display_none img_delete_btn fas fa-times"></button>
        <label class="img_upload_btn ">
            <i class="far fa-image"></i>
            <input onchange="readURL(this);" type="file" class="img_upload">
			<input class="img_name" type="hidden" name="img" />
        </label>
        <button type="button" class="part_delete_btn fas fa-times"></button>
        <div class="move_btn_box">
            <button type="button" class="part_up_btn part_move_btn fas fa-chevron-up"></button>
            <button type="button" class="part_down_btn part_move_btn fas fa-chevron-down"></button>
            <span class="review_part_count"><@=partCount@>/10</span>
        </div>
        <textarea class="img_review_sub" name="imgReviewSub" placeholder="사진에 대한 설명을 입력해주세요."></textarea>
    </div>
</script><!-- imgReviewPartTmp tmp end-->

<script type="text/template" id="searchItemTmp">
	<@ _.each(items,function(item){@>
 	 <li data-value="<@=item.no@>"><@=item.title@> - <@=item.volume@>/<@=item.price@>원</li>
  	<@}) @>
</script>

<script src="/js/jquery.js"></script>
<script src="/js/template.js"></script>
<script src="/js/underscore-min.js"></script>
<script>

_.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };
    
var tmp = _.template($("#imgReviewPartTmp").html());//템플릿 정의
var tmp2 = _.template($("#searchItemTmp").html());//템플릿 정의
	$('#productName').keyup(function () {
		//input 에서 키업이될때마다 
		// ajax 처리를 해준다.
		// input 의 값을 받아서 o이 아닐때 마다  값으 넘겨 줘서 ajax 처리 해준다.
		// 0일 시 또는 값이 안맞을시 ajax는 처리가 되지 않는다.
		var itemTitle = $(this).val();
		if(itemTitle.length != 0){
		    searchItems(itemTitle);
			$('#productAutoNameBox').css('display','block');
		}else{
			$('#productAutoNameBox').css('display','none'); 
		}
		//console.log(itemTitle);
	});
    
	$('#productName').focusout(function () {
		  // 검색이 된 것을 클릭시 검색된 
		  // 아이템에 번호를 ajax를 처리해준다.
		  // 후에 다른 카테고리의 값들을  초기화 해준다.
	  $('#productAutoNameBox').on('click','.list_item>li',function(){
		 var itemNo = $(this).data('value'); 
	   	$("#itemNo").attr("value",itemNo);
	  	$('#productName').val($(this).text());
	  	$('#productAutoNameBox').css('display','none');
	  })    	
	});  //productName end 
    
	function searchItems(titles) {
	  	 $.ajax({
		    	url:"/ajax/search/item/"+titles,
		    	type: "post",
		    	dataType : "json",
		    	  error:function(){
		              alert("서버 점검중!")
		          },
		          success:function(json){
		        	 $(".list_item").html(tmp2({items:json}));
		          }
		    });//ajaxList end
	  }//searchItems
 
    function checkImg() {

        var $this = $(this);//input type file
        var reviewImg = $(this).get(0);
        var file1 = reviewImg.files[0];
        var $imgBox = $this.parents(".img_review_part");
        
        //img 요소
        var $reviewImg = $imgBox.find(".img_review_main");
        
        //input hidden
        var $img_name = $imgBox.find(".img_name");
        
        //console.log("이미지 업로드 시작할게요");
        var form = new FormData();
        form.append("img",file1, file1.name);
       	$.ajax({
        	url : "/ajax/upload/review",
        	dataType : "json",
        	type : "POST",//multipart/form-data
        	processData : false,//multipart/form-data
        	contentType : false,//multipart/form-data
        	data : form,
        	error : function(e) {
	        	alert("사진 서버 점검중!" + e.stack);
	        	},
        	success : function(json) {
	        	//$event_img_main.attr("src", "/img" + json.src);
	        	$reviewImg.attr("src",json.src);
	        	$img_name.val(file1.name);
	        	}//success end
	    });//ajax() end
    }//checkProfile() end
    
    $(".review_part_wrap").on("change",".img_upload",checkImg);
    
    
    // 선물카드 선택 시 'T' 해제 시 'F'
  	$("#giftCheck").on('click',function(){

  		var test = $("#giftCheck").is(":checked");
  		if(test==true){
  			$("#giftCheckValue").val('T');
  		}else{
  			$("#giftCheckValue").val('F');
  		}
  	});
  	
    var idx = 0;
    
    var partCount = 1;
    $(".review_star_box>span").mouseenter(function () {
        idx = $(".review_star_box>span").index(this);
        //console.log(idx);
        //console.log($(".review_star_box>span>i"));
        for(var i=0;i<=idx;i++){
            $(".review_star_box>span>i").eq(i).css("color","#283593");
        }
    });

    // 별에서 마우스 때면
    $(".review_star_box>span").mouseleave(function () {
        for(var i=0;i<=idx;i++){
            $(".review_star_box>span>i").eq(i).css("color","#BBDEFA");
        }
    });

    // 별점 클릭 시
    $(".review_star_box>span").click(function () {
        idx = $(".review_star_box>span").index(this);
        console.log(idx);
        for(var i=0;i<=idx;i++){
            $(".review_star_box>span>i").eq(i).css("color","#283593");
        }
        $(".review_star_box>input").val(idx+1);
        idx = -1;
    });

    $(".review_type_box>label").click(function () {
        //var text = $(".review_type_box>input:radio:checked").val();
        var text = $(this).text();
        if(text=='이미지리뷰'){
            $(".img_review_box").removeClass("display_none");
            $(".simple_review_box").addClass("display_none");
        }else if(text=='간단리뷰'){
            $(".img_review_box").addClass("display_none");
            $(".simple_review_box").removeClass("display_none");
        };//if~else if end
    });
    
    //이미지 등록 버튼 누를 시
    $("#partAddBtn").click(function () {
        if(partCount<10){
            partCount++;
            $(".review_part_wrap").append(tmp({partCount:partCount}));
        }
    });

    //추가된 이미지리뷰 영역 삭제 하는 버튼
    $(".review_part_wrap").on("click",".part_delete_btn",function () {
       $(this).parent().remove();
       partCount--;
    });

    //이미지가 추가되면 이미지 삭제하는 버튼
    $(".review_part_wrap").on("click",".img_delete_btn",function () {
        var $parent = $(this).parent();
        //이미지 영역 링크 삭제
        $parent.children(".img_review_main").attr("src","");
        //이미지 업로드 버튼 활성화
        $parent.children(".img_upload_btn").removeClass("display_none");
        //이미지 삭제 버튼 숨기기
        $parent.children(".img_delete_btn").addClass("display_none");
        //이미지 업로드 input file 초기화
        $parent.children(".img_upload_btn").children(".img_upload").val("");
    });

    //이미지 등록이 되면
    //$(".review_part_wrap").on("click",".img_upload",function () {
        //console.log($(this).val());
    //});
    function readURL(fileName){
        //filename = input 변경된 인풋 요소 자체
        if(fileName.files && fileName.files[0]){
          //console.log(fileName.files[0].name);
          var fileSrc = "img/" + fileName.files[0].name;
          //사진이 올라갔을때 부모요소 찾기.
          var $parent = $(fileName).parents(".img_review_part");
          //console.log();
          //$parent.children(".img_review_main").attr("src",fileSrc);
          $parent.children(".img_upload_btn").addClass("display_none");
          $parent.children(".img_delete_btn").removeClass("display_none");
        };
    }

    //대표이미지 위치 변경 버튼 눌렀을 경우
    $(".review_part_wrap").on("click",".part_move_btn",function () {
        //클릭된 버튼의 부모 DIV
        var $parent = $(this).parents(".img_review_part");
        //클릭된 버튼의 부모 DIV가 몇번째 part DIV인지 확인 0:대표사진
        var idx = $(".review_part_wrap").children(".img_review_part").index($parent);
        if($(this).hasClass("part_up_btn")){
            //console.log("순위 업 버튼입니다.");
            if(idx==0){
                console.log("올릴 수 없습니다.");
            }else{
                console.log("올릴 수 있습니다. : " + idx);
                //이동할 곳
                var $target = $(".review_part_wrap").children(".img_review_part").eq(idx-1);
                var imgSrc = $parent.children(".img_review_main").attr("src");//옴겨야할 이미지 경로
                var targetImgSrc = $target.children(".img_review_main").attr("src");
                var textSub = $parent.children(".img_review_sub").val();//옴겨야할 텍스트 값
                var targetTextSub = $target.children(".img_review_sub").val();
                //이미지 변경
                $target.children(".img_review_main").attr("src",imgSrc);
                $target.children(".img_review_sub").val(textSub);
                $parent.children(".img_review_main").attr("src",targetImgSrc);
                $parent.children(".img_review_sub").val(targetTextSub);
                if(imgSrc==""&&targetImgSrc=="") {
                    console.log("업로드된 이미지가 없습니다.");
                }else if(imgSrc!=""&&targetImgSrc==""){
                    //타깃에 이미지가 업로드 되어 있지 않을 때
                    $parent.children(".img_upload_btn").removeClass("display_none");
                    $parent.children(".img_delete_btn").addClass("display_none");
                    $target.children(".img_upload_btn").addClass("display_none");
                    $target.children(".img_delete_btn").removeClass("display_none");
                    $parent.children(".img_upload_btn").children(".img_upload").val("");
                }else if(imgSrc==""&&targetImgSrc!="") {
                    //타깃에만 이미지가 업로드 되어 있을 때
                    $parent.children(".img_upload_btn").addClass("display_none");
                    $parent.children(".img_delete_btn").removeClass("display_none");
                    $target.children(".img_upload_btn").removeClass("display_none");
                    $target.children(".img_delete_btn").addClass("display_none");
                    $target.children(".img_upload_btn").children(".img_upload").val("");
                }
            }
        }else if($(this).hasClass("part_down_btn")){
            //console.log("순위 다운 버튼입니다.");
            if(idx==9){
                console.log("내릴 수 없습니다.");
            }else{
                console.log("내릴 수 있습니다. : " + idx);
                //이동할 곳
                var $target = $(".review_part_wrap").children(".img_review_part").eq(idx+1);
                var imgSrc = $parent.children(".img_review_main").attr("src");//옴겨야할 이미지 경로
                var targetImgSrc = $target.children(".img_review_main").attr("src");
                var textSub = $parent.children(".img_review_sub").val();//옴겨야할 텍스트 값
                var targetTextSub = $target.children(".img_review_sub").val();
                //이미지 변경
                $parent.children(".img_review_main").attr("src",targetImgSrc);
                $parent.children(".img_review_sub").val(targetTextSub);
                $target.children(".img_review_main").attr("src",imgSrc);
                $target.children(".img_review_sub").val(textSub);
                if(imgSrc==""&&targetImgSrc=="") {
                    console.log("업로드된 이미지가 없습니다.");
                }else if(imgSrc!=""&&targetImgSrc==""){
                    //타깃에 이미지가 업로드 되어 있지 않을 때
                    $parent.children(".img_upload_btn").removeClass("display_none");
                    $parent.children(".img_delete_btn").addClass("display_none");
                    $target.children(".img_upload_btn").addClass("display_none");
                    $target.children(".img_delete_btn").removeClass("display_none");
                    $parent.children(".img_upload_btn").children(".img_upload").val("");
                }else if(imgSrc==""&&targetImgSrc!="") {
                    //타깃에만 이미지가 업로드 되어 있을 때
                    $parent.children(".img_upload_btn").addClass("display_none");
                    $parent.children(".img_delete_btn").removeClass("display_none");
                    $target.children(".img_upload_btn").removeClass("display_none");
                    $target.children(".img_delete_btn").addClass("display_none");
                    $target.children(".img_upload_btn").children(".img_upload").val("");
                }
            }
        }
    });
</script>
</body>
</html>