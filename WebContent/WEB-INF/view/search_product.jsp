<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="/css/productCard.css">
<link rel="stylesheet" href="/css/productSearch.css">
<link rel="stylesheet" href="/css/slick.css">
<link rel="stylesheet" href="/css/review-slick-theme.css">
<link rel="stylesheet" href="/css/paging.css">
    <link rel="stylesheet" href="/css/template.css">
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
			<a href=""><span class="category_on"><strong id="itemcount">0</strong>개의 제품</span></a> ｜
			<a id="reviewBtn" href="/search/reviews"> <span><strong>${count }</strong>개의 리뷰</span></a>
		</div>
	</div>
	<!--searchImgArea-->
	<div id="products">
		<div class="order_select_area">
		   <select id="orderSelect" name="order" title="정렬기준" >
       			 <option value="new">최신순</option>
        		<option value="avg">평점순</option>
   		   </select>
		</div>
		<div id="productsWrap"></div>
		<!-- //#productsWrap end -->
		<div id="paging"></div>
		<!--//paginate-->
	
	</div><!-- //#products end -->


	<script type="text/template" id="itemTmp">
<@_.each(list,function(item){@>
        <div class="product_box">
            <div class="product_imgs">
               	<!-- <div class="rank_img"><img src="/img/rankImg.PNG" width="50" height="50"/></div><!--rank_img end-->
                <div class="product_img"><img src="/img/item/thumbnail/<@=item.itemImg@>" width="170" height="210"></div><!--product_img end-->
                <div class="pouch_img"><a href="/pouch"><i class="far fa-clipboard wish"></i></a></div><!--//pouch_img end-->
                <div class="brand_img"><img src="/img/profile/thumbnail/<@=item.userImg@>" width="40" height="40"><div class="brand_name"><@=item.brandName@></div></div><!--//brand_img end-->
                <!--<div class="check_box"><i class="far fa-check-circle"></i></div>-->
                <!--//check_box end-->
                <!--<div class="stop_product">단종상품</div>-->
                <!--//stop_product end-->
            </div><!--//product_imgs ebd-->
            <div class="product_name"><a href=""><@=item.itemTitle@></a></div><!--//product_name end-->
            <div class="product_eval">
            <span class="score"><@=item.avgscore@></span><span class="score_icon">
			<@for(var i=0;i<item.avgscore;i++){@>
			<i class="fas fa-tint"></i>
			<@}@></span>
<span class="scoreBG"> 
<@for(var i=0;i<5;i++){@>
			<i class="fas fa-tint BG"></i>
<@}@>
</span>
(<span><@=item.reviewCount@></span>)
            </div><!--//product_eval end-->
            <div class="product_detail"><div class="product_capacity"><@=item.volume@></div><div class="product_price"><span><@=numberWithCommas(item.price)@></span>원</div></div><!--//product_detail end-->
        </div><!-- //.product_box end -->
<@  })@>
 </script>

	<c:import url="/WEB-INF/template/footer.jsp" />
	<script src="/js/template.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/slick.min.js"></script>
	<script>

_.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };


var $searchItemTmpl = _.template($("#itemTmp").html());

 $('#searchInpArea #search').focus(function () {

    $('#searchInpArea').css('transform','scale(1.1)');
    $('.bar').show();
    // $(this).css('background','#ffffff');
 });

var num = 0

 $('#searchChoiceBtnArea span').click(function () {
	  $('#reviewBtn').attr("href","/search/reviews/"+title+"/"+num);
   /*   $(".category_on").removeClass("category_on");
     $(this).addClass('category_on'); */
 });

 var $reviewType = $('#reviewType li');
 //상단 리뷰 종류 선택 버튼 동작
 $reviewType.click(function () {
     $('.review_type_on').removeClass('review_type_on');
     $(this).addClass('review_type_on');
 });


 //리뷰이미지 롤링

 $('.review_imgs').slick({
     dots: true,
     slidesToShow: 1,
     slidesToScroll: 1,
     autoplay: true,
     autoplaySpeed: 2500,
 });
	var order = "new";
	var title;

 getItems(1);
 
	function getItems(pageNo){
		$.ajax({
			url:"/ajax/search/items/page",
			type:"get",
			dataType:"json",
			data:{
				"title":title,
				 "order":order,
	    		"pageNo" : pageNo,
	    	},
			error:function(){
				alert("서버 점검중");
			},
			success:function(json){
				console.log("검색 아이템"+json.count);
				$("#productsWrap").html($searchItemTmpl({list:json.list}));
				$("#paging").html(json.paginate);
				$("#itemcount").text(json.count);
				num=json.count;
				if(json.list==0){
				$("#productsWrap").append(('<div class="box_not_review"><span>제품이 없습니다.</span></div>'));
				}
			}
		})//getItems end

	}
	
	
	$("#paging").on("click",".paginate a",function(e) {
		e.preventDefault();
		var href = $(this).attr("href");
		var no = href.substring(href.lastIndexOf("/")+1,href.length);
		pageNo= no;
		getItems(pageNo);
	});
	
	$('#searchInpArea button').on('click',function(){
		 title = $('#search').val();
		 getItems(1);
	})
	
	
	$('#orderSelect').on('change', function(){
			order = $('#orderSelect').val();
			getItems(1);
	});
	
	

	  function numberWithCommas(x) {
  	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  	}

</script>
</body>
</html>