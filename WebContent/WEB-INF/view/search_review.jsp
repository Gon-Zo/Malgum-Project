<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/template/link.jsp" />
    <link rel="stylesheet" href="/css/template.css">
<link rel="stylesheet" href="/css/reviewSearch.css">
<link rel="stylesheet" href="/css/slick.css">
    <link rel="stylesheet" href="/css/review_popup.css"/>
<link rel="stylesheet" href="/css/review-slick-theme.css">
<link rel="stylesheet" href="/css/paging.css">
<title>검색페이지</title>
</head>
<body>
	<h1 hidden>검색페이지</h1>
	<c:import url="/WEB-INF/template/header.jsp" />
	<div id="searchImgArea">
		<img src="/img/review_main_img/category_img_0.png" alt="" width="1200">

		<div id="searchInpArea" class="area">
				<input value="${title }" name="" id="search" placeholder="내용을 입력해주세요">
				<div class="bar"></div>
				<button>
					<i class="fas fa-search"></i>
				</button>
		</div>

		<div id="searchChoiceBtnArea" class="area">
			<a href="/search/items" id="itemBtn"><span><strong>${count}</strong>개의 제품</span></a> ｜
			<a href=""> <span class="category_on"><strong id="itemcount"></strong>개의 리뷰</span></a>
		</div>
	</div>
	<!--searchImgArea-->
	<div class="search_list">
		<div id="reviewMainContentsArea">
			<div id="reviewTypeArea">
				<ul id="reviewType">
					<li class="review_type_on" data-value="A">전체 리뷰 보기</li>
					<li data-value="I">이미지 리뷰 보기</li>
					<li data-value="T">간단 리뷰 보기</li>
				</ul>
			</div>

			<div class="order_select_area">
				    <select name="order" title="정렬기준" id="orderSelect">
        				<option value="new">최신순</option>
        				<option value="avg" >평점순</option>
        				<option value="like" >추천순</option>
    				</select>
			</div>


			<div id="reviewListArea">
				<ul class="review_list"></ul>
			</div>
			<div id="paging"></div>
		</div>

	</div>

	<div id="popup"></div>
	<!-- #popup end -->

	<script type="text/template" id="addComment">
		<@_.each(replies, function(reply){@>
					<div class="comment_wrap">
						<div class="comment_info">
						<span class="profile comment">
						<@if(reply.userImg!=null){@>
							<img src="/img/profile/<@=reply.userImg@>" width="30" height="30">
						<@}else{@>
							<@=reply.userName.substring(0,1)@>
						<@}@>
						</span>
							<span class="name comment"><@=reply.userName@></span>
							<span class="date comment"><@=moment(reply.regdate).format('YYYY년MM월DD일')@></span>
						</div>
						<!--.comment_info -->
						<p>
							<@=reply.content@>
						</p>
					</div>
				<@})@>
</script>
	<script type="text/template" id="reviewPopup">
<@ var profileName = user.name.substring(0,1) @>
	<!-- review_popup_wrap -->
	<div class="review_popup_wrap">
		<div class="review_popup_aux">
			<div class="title">
				<@=review.title@>
				<div class="cancel">
					<i class="fas fa-times"></i>
				</div>
			</div>
			<!-- .title end -->
			<div class="writer_info">
				<span class="profile writer">
				<@if(user.img!=null){@>
					<img src="/img/profile/<@=user.img@>" width="30" height="30">
				<@}else{@>
					<@=profileName@>
				<@}@>
				</span> 
				<span class="name writer"><@=user.name@></span>
				<span class="date writer"><@=moment(review.regdate).format('YYYY년MM월DD일')@></span>
			</div>
			<!-- .writer_info -->
			
			<div class="review_content_box">
		<@if(review.type!='T'&&review.contents==null){@>	
			<div class="review">
					<@_.each(reviewContents, function(review){@>
					<div class="review_content">
						<img src="/img/review/<@=review.img@>">
						<div class="review_text"><@=review.content@></div>
						<!-- .review_text -->
					</div>
					<@})@>
					<!-- .review_content -->
					</div><!-- .review -->
					<button id="leftBtn">&lt;</button>
					<button id="rightBtn">&gt;</button>
<@}else{@>
<div class="contents_box" ><@=review.content@></div>
<@}@>
				</div>
				<!--.review_content_box-->
				<div class="like_wrap">
					<div class="counts">	
						<span class="likes"><i class="far fa-heart likesBox"></i></span> 
						<span class="comments"><i class="far fa-comment-dots reply_num"></i></span>
					</div>
				<!--.item_box start -->
				<div class="item_info_wrap">
					<img class="item_img" src="/img/item/<@=review.img@>" alt="제품사진">
					<div class="item_info">
						<div class="item_name"><@=review.itemTitle@></div>
						<div class="brand_name"><@=review.id@></div>
					</div>
				</div>
				<!--.item_box end -->
				<div class="comment_write">
					<input placeholder="댓글을 입력하세요." />
					<button class="comment_btn">댓글작성</button>
				</div>
				<!--.comment_write -->
				<!-- .comment_set-->
				<div class="comment_set"></div>
			</div>
			<!-- .review_popup_aux -->
		</div>
		<!--.review_popup_wrap end -->
</script>



<script type="text/template" id="searchItemTmp">
	<@ _.each(items,function(item){@>
 	 <li class="list_item" data-value="<@=item.no@>"><@=item.title@></li>
  	<@}) @>
</script>

<script type="text/template" id="reviewTmp">
<@ _.each(reviews,function(review){
		var gender =  "여자";
		if(review.userGender=='M'){
			gender = "남자";
		}
		var reviewContent = review.txt;
		if(reviewContent==null){
			reviewContent = review.reviewContent;
		}
		var profile  =review.name.substring(0,1);
		var userSkin = review.userSkin;
		if(userSkin=='D') {
			userSkin = "건성";
		}else if(userSkin=='N') {
			userSkin = "중성";
		}else if(userSkin=='O') {
			userSkin = "지성";
		}else if(userSkin=='C') {
			userSkin = "복합성";
		}else {
			userSkin = "없음";
		}
var userAge = ((moment().format('YYYY')-moment(review.birth).format('YYYY'))+1).toString().substring(0,1)+"0대";
@>
     <li class="review_card">
                <div class="product_info">
					<@if(review.gift=='T'){@><div class="box_gift">선물 리뷰</div><@}@>
                    <img class="product_img" src="/img/item/thumbnail/<@=review.itemImg@>" alt="제품사진">
                    <div class="product_img_cover"></div>
                    <div class="product_name"><@=review.itemTitle@></div>
                    <div class="brand_name"><@=review.brand@></div>
                </div>
                <!--product_info-->
                <div class="writer_info">
                        <ul class="score_list">
						<@for(var i = 0 ; i < 5 ; i++){@>
                            <li class="score_color<@if(i<review.score){@> em_color<@}@>"><i class="fas fa-tint"></i></li>
						<@}@>
                        </ul>
                        <div class="profile_img_area">
                            <@if(review.userImg==null){@>
							<span><@=profile@></span>
							<@}else{@>
                            <!--프로필 사진없으면 span 노출-->
                            <img class="profile_img" src="/img/profile/thumbnail/<@=review.userImg@>" alt="프로필 이미지"/>
							<@}@>
                        </div>
                    <div class="writer_detail_info">
                        <span class="writer_name"><@=review.name@></span>
                        <span> <@=gender@>｜<@=userAge@>｜<@=userSkin@>｜</span>
                        <span class="review_regdate"> <@= moment(review.regdate).format('YYYY년MM월DD일') @></span>
                    </div>
                </div>
                <ul class="review_info">
                    <li class="review_title hidden_out"><@=review.title@></li>
                    <li class="review_contents hidden_out"><@=reviewContent@></li>
					<span class="more_view"  data-value="<@=review.no@>">+ 더보기</span>
                    <li class="count_area">
                        <span class="like count">
                            <i class="fas fa-heart" <@if(review.ckeckLike=='T'){@> style="color: #bbdefa"<@}@> ></i><@=review.likeNum@></span>
                        <span class="reply count">
                            <i class="far fa-comment-dots"></i><@=review.replyNum@></span>
                    </li>
                </ul>
			<@if(review.type=='I'){@>
               <div class="review_photo_area">
                    <div class="review_imgs">
						<@ _.each(review.list,function(imgs){@>
                        <div><img class="img_review" src="/img/review/thumbnail/<@=imgs.img@>" width="200"></div>
						<@}) @>
                    </div>
                    <div class="photo_count"><i class="far fa-images"></i><@=review.imgCount@></div>
                </div>
              <@}@>
            </li><!--review_card-->
  	<@}) @>
</script>

	<c:import url="/WEB-INF/template/footer.jsp" />
	<script src="/js/slick.min.js"></script>
	<script src="/js/template.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script>

_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
		
var $reviewTmpl = _.template($("#reviewTmp").html());
var type ='A';
var order='new';
var title=$('#search').val();
/*로그인 유저가 값이 null 일 경우 아래 의 함수는 실행 되지 않는다.*/
var loginUserNo=0;
var $tmpComment = _.template($('#addComment').html());
var $popupTmpl = _.template($("#reviewPopup").html());
var content;
var move = 0;
var reviewVal = 0;
var width = 0;
var pageNo=1;
<c:if test="${loginUser!=null}">
loginUserNo = ${loginUser.no};
</c:if>

	
 $('#searchInpArea #search').focus(function () {

    $('#searchInpArea').css('transform','scale(1.1)');
    $('.bar').show();
    // $(this).css('background','#ffffff');
 });

var num=0;
 $('#searchChoiceBtnArea span').click(function () {
    /*  $(".category_on").removeClass("category_on");
     $(this).addClass('category_on'); */
	 $('#itemBtn').attr("href","/search/items/"+title+"/"+num);
 });

 var $reviewType = $('#reviewType li');
 //상단 리뷰 종류 선택 버튼 동작
 $reviewType.click(function () {
     $('.review_type_on').removeClass('review_type_on');
     $(this).addClass('review_type_on');
	 type =$(this).data('value');
	 //console.log(type);
	 reviewList(1);
 });


 //리뷰이미지 롤링

 $('.review_imgs').slick({
     dots: true,
     slidesToShow: 1,
     slidesToScroll: 1,
     autoplay: true,
     autoplaySpeed: 2500,
 });
 
 reviewList(1);
 
 function reviewList(pageNo) {
  	 $.ajax({
	    	url:"/ajax/review/search",
	    	type: "post",
	    	dataType : "json",
	    	data:{
	    		"pageNo" : pageNo,
	    		"loginUserNo":loginUserNo,
	    		"order":order,
	    		"type":type,
	    		"title":title
	    	},
	    	  error:function(){
	              alert("서버 정검중!")
	          },
	          success:function(json){
	        	    console.log(json)
	         	    $(".review_list").html($reviewTmpl({reviews:json.list}));
	        	    $("#paging").html(json.paginate); 
	        	    $('#itemcount').text(json.total);
	        	    num  = json.total;
	        	   $('.review_imgs').slick({
	      	       		 dots: true,
	      	       		 slidesToShow: 1,
	      	        	 slidesToScroll: 1,
	      	             autoplay: true,
	      	             autoplaySpeed: 2500,
	      	    		});
	        	if(json.list==0){
	        			$(".review_list").append(('<li class="box_not_review"><span>리뷰가 없습니다.</span></li>'));
	        		}
	          }//success:function end
	    });//ajaxList end
  }//searchItems

  
  $("#paging").on("click",".paginate a",function(e) {
	   	e.preventDefault();
	   	var  no = $(this).attr("href");
	   	var test = no.substring(no.lastIndexOf("/")+1 , no.length);
	   	pageNo = test;
	   	reviewList(pageNo);
	   });
  
  /* select 이벤트*/
	$('#orderSelect').on('change',function(){
		//select의 값이 변화할떄 만다 order 의 값을 변경시켜주어
		// ajax에 담아준다.
		order = $('#orderSelect').val();
		//console.log(order)
		reviewList(1);
	})
	
		$('#searchInpArea button').on('click',function(){
		title = $('#search').val();
		reviewList(1);
		})
		
		
		
		
		/////// 팝업 시작

    $(".review_list").on("click",".more_view",function() {
	reviewVal = $(this).data('value');
	console.log("reviewVal :" + reviewVal);
	popupAjax(); 
});// more_view end


<c:if test="${loginUser!=null}">
$("body").on("click", ".likes", function() {
	reviewList(pageNo);
	likeAjax();
});// likeAjax() 실행
</c:if>

$("#popup").on("click", function() {
	reviewList(pageNo);
	$(".review_popup_wrap").css("display", "none");
	$("#popup").css("display", "none");
});// #popup end

$("body").on("click", ".cancel", function() {
	reviewList(pageNo);
	$(".review_popup_wrap").css("display", "none");
	$("#popup").css("display", "none");
});// .cancel end

$("body").on("click", "#leftBtn", function() {
	move = move + 507;
	if (move == 507) {
		move = 0;
	} else {
		$(".review").css("left", move + "px");
	}
});// leftBtn end

$("body").on("click", "#rightBtn", function() {
	move = move - 507;
	if (move == -width) {
		move = move + 507;
	} else {
		$(".review").css("left", move + "px")
	}
});// rightBtn end

$("body").on("click", ".comment_write button", function() {
	content = $(this).prev().val();
	if(loginUserNo==0){
		alert('로그인을 해주세요')
	}else{
	writeReplyAjax();
	}
});// .write_comment button click



function writeReplyAjax() {
	$.ajax({
		url : "/ajax/comment/write",
		type : "GET",
		dataType : "json",
		data : {
			"reviewNo" : reviewVal,
			"userNo" : loginUserNo,
			"content" : content
		},
		error : function() {
			alert("서버 점검중!");
		},
		success : function(json) {
			console.log(json);
			$(".comment_write input").val("");
			selectListReplyAjax();
			selectReplyAjax();
		}
	})
}// commentAjax() end

function selectListReplyAjax() {
	$.ajax({
		url : "/ajax/comment/selectList/" + reviewVal,
		type : "GET",
		dataType : "json",
		data : {
			"no" : reviewVal
		},
		error : function() {
			alert("서버 점검중!");
		},
		success : function(json) {
			//console.log("json reply ::"+json);
			$(".comment_set").html($tmpComment({replies : json}));
		}
	})
}// commentAjax() end

function likeAjax() {
	$.ajax({
		url : "/ajax/comment/like/" + reviewVal,
		type : "GET",
		dataType : "json",
		data : {
			"userNo" : loginUserNo
		},
		success : function(json) {
			console.log("likeAjax() :: "+json);
			if(json==0){
				$('.likes').css("color","#f00");
			}else{
				$('.likes').css("color","#000");
			}
			selectLikeAjax();
		},
		error : function() {
			alert("점!검!");
		}
	});
} // likeAjax() end

function selectLikeAjax() {
	$.ajax({
		url : "/ajax/comment/like/select/" + reviewVal,
		type : "GET",
		dataType : "json",
		success : function(json) {
			$('.likesBox').text(json.likeNum);
		},
		error : function() {
			alert("점!검!");
		}
	});
} // selectLikeAjax() end

function popupAjax() {
	$.ajax({
		url : "/ajax/review/" + reviewVal,
		type : "GET",
		dataType : "json",
		error : function() {
			alert("서버 점검중!");
		},
		success : function(json) {

			console.log(json.review);// 객체
			console.log(json.reviewContents);// 배열

			$("body").append($popupTmpl({
				review : json.review,
				reviewContents : json.reviewContents,
				user : json.user,
			}));
			selectLikeAjax();
			selectReplyAjax();
			width = json.reviewContents.length * 507;
			$(".review").css("width", width);
			$(".review_popup_wrap").css("display", "block");
			$("#popup").css("display", "block");
			selectListReplyAjax();
		}
	})
}// popupAjax() end


function selectReplyAjax() {
	$.ajax({
		url : "/ajax/reply/count/select/" + reviewVal,
		type : "GET",
		dataType : "json",
		success : function(json) {
			console.log(json);
			$('.reply_num').text(json);
		},
		error : function() {
			alert("서버 점검중!");
		}
	});
} // selectLikeAjax() end

</script>
</body>
</html>