<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
	<c:import url="/WEB-INF/template/link.jsp"></c:import>
	    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/slick.css">
    <link rel="stylesheet" href="/css/review-slick-theme.css">
    <link rel="stylesheet" href="/css/reviewMain.css"/>
    <link rel="stylesheet" href="/css/review_popup.css"/>
    <link rel="stylesheet" href="/css/paging.css"/>
    <title>리뷰 메인 페이지</title>
</head>
<body>

 <h1 hidden>리뷰 메인 페이지</h1>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
 <div id="reviewMainContentsArea">
    <div id="pageTitle">제품리뷰</div>
    <div id="reviewTypeArea">
 <ul id="reviewType">
     <li class="on" data-value="A">전체 리뷰 보기(${total})</li>
     <li data-value="I">이미지 리뷰 보기(${totalImg})</li>
     <li data-value="T">간단 리뷰 보기(${totalTxt})</li>
 </ul>
    </div>

     <div class="btn_area">
     	 
         <a href="/review/write"><div class="review_write btn">리뷰 작성</div></a>
         <a><div class="my_review btn" >내가 쓴 리뷰 보기</div></a>
     </div>


     <div class="review_category_btn"><i class="fas fa-list"></i> 카테고리선택</div>
     <div class="product_category review_category_on">
         <ul class="first_category">
             <li ><span value="B" id="firstB" name="one">기초케어</span>
                 <ul class="second_category" id="secondB">
                     <li ><span class="cat_btn" name="second" value="1">스킨케어</span></li>
                     <li><span class="cat_btn" name="second" value="2">선케어</span></li>
                     <li><span class="cat_btn" name="second" value="3">클렌징</span></li>
                 </ul>
             </li>
             <li><span value="M" id="firstM" name="one">메이크업</span>
                 <ul class="second_category" id="secondM">
                     <li><span class="cat_btn" name="second" value="4">베이스</span></li>
                     <li><span class="cat_btn" name="second" value="5">아이</span></li>
                     <li><span class="cat_btn" name="second" value="6">립&치크</span></li>
                     <li><span class="cat_btn" name="second" value="7">네일</span></li>
                 </ul>
             </li>
             <li><span value="E" id="firstE" name="one">바디/헤어/향수</span>
                 <ul class="second_category" id="secondE">
                     <li><span class="cat_btn" name="second" value="8">헤어케어</span></li>
                     <li><span class="cat_btn" name="second" value="9">바디케어</span></li>
                     <li><span class="cat_btn" name="second" value="10">향수</span></li>
                 </ul>
             </li>
             <li><span id="firstS" naem="skin" value="S">타입별</span>
                 <ul class="second_category" id="secondS">
                     <li><span class="cat_btn" name="skin" value="D">건성</span></li>
                     <li><span class="cat_btn" name="skin" value="N">중성</span></li>
                     <li><span class="cat_btn" name="skin" value="O">지성</span></li>
                     <li><span class="cat_btn" name="skin" value="C">복합성</span></li>
                     <li><span class="cat_btn" name="skin" value="E">모든피부</span></li>
                 </ul>
             </li>
             <li><span value="A" id="firstP" name="problem">고민별</span>
                 <ul class="second_category" id="secondP">
                     <li><span class="cat_btn" name="problem" value="1">알레르기</span></li>
                     <li><span class="cat_btn" name="problem" value="2">안티에이징</span></li>
                     <li><span class="cat_btn" name="problem" value="3">트러블</span></li>
                 </ul>
             </li>
             <li><span value="P" name="age" id="firstA">연령별</span>
                 <ul class="second_category" id="secondA">
                     <li><span class="cat_btn" name="age" value="E">모든연령</span></li>
                     <li><span class="cat_btn" name="age" value="K">유아</span></li>
                     <li><span class="cat_btn" name="age" value="T">청소년</span></li>
                     <li><span class="cat_btn" name="age"  value="A">성인</span></li>
                     <li><span class="cat_btn" name="age" value="M">중년</span></li>
                 </ul>
             </li>
             <li><span value="G" id="firstG">선물</span>
                 <ul class="second_category" id="secondG" name="gift" value="A">
                     <li><span class="cat_btn" name="gift" value="T">선물용</span></li>
<!--                      <li><span class="cat_btn" name="gift" value="F">비선물</span></li> -->
                 </ul>
             </li>
         </ul>


         <div class="category_main_img img_display_on">
             <div><img src="/img/review_main_img/category_img_0.png" ></div>
             <div><img src="/img/review_main_img/category_img_1.png" ></div>
             <div><img src="/img/review_main_img/category_img_2.png"></div>
             <div><img src="/img/review_main_img/category_img_3.png" ></div>
         </div>
         <div class="category_img"></div>
     </div>

     <div id="choiceCategoryArea">
         <ul></ul> <!--선택 카테고리 필터 들어가는 곳-->
     </div>


     <div id="searchBoxWrap">
     <div class="review_search_area">
        <form  action="">
        <input placeholder="제품명을 검색해주세요." id="productName" name="">
        <button class="review_search_btn"><i class="fas fa-search"></i></button>
        </form>
     </div><!--//review_search_area end-->
     <ul id="itemSearchWrap"></ul><!--//itemSearchWrap end-->
    </div><!--//searchBoxWrap end-->
     
     
   
    <div class="order_select_area">
    <select name="order" title="정렬기준" id="orderSelect">
        <option value="regdate">최신순</option>
        <option value="score" >평점순</option>
        <option value="like" >추천순</option>
    </select>
     </div>


    <div id="reviewListArea">
        <ul class="review_list">
        </ul><!-- //review_list end -->
    </div><!--//reviewListArea end  -->
	<div id="paging"></div>
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

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
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
		
	var $searchItemTmpl = _.template($("#searchItemTmp").html());
	var $reviewTmpl = _.template($("#reviewTmp").html());
	
	var second ="1-2-3-4-5-6-7-8-9-10-";
	var skin =null;
	var age = null;
	var problem = null;
	var gift = "T-F-";
	var type=null;
	var order="regdate";
	var click=0;
	var listNo=0;
	
	
	
	/*  */
	
var $tmpComment = _.template($('#addComment').html());
var $popupTmpl = _.template($("#reviewPopup").html());
var content;
var move = 0;
var reviewVal = 0;
var width = 0;

	
/*로그인 유저가 값이 null 일 경우 아래 의 함수는 실행 되지 않는다.*/
	var loginUserNo=0;
<c:if test="${loginUser!=null}">
loginUserNo = ${loginUser.no};
$('.my_review').on('click',function(){
	click=1;
    listNo=0;

    second ="1-2-3-4-5-6-7-8-9-10-";
	skin =null;
	age = null;
	problem = null;
	gift = "T-F-";
	type=null;
	order="regdate";
	reviewList(1);
})
</c:if>

//추가 제이쿼리
    $('#productName').keyup(function () {
    	//input 에서 키업이될때마다 
    	// ajax 처리를 해준다.
    	// input 의 값을 받아서 o이 아닐때 마다  값으 넘겨 줘서 ajax 처리 해준다.
    	// 0일 시 또는 값이 안맞을시 ajax는 처리가 되지 않는다.
    	var itemTitle = $(this).val();
    	if(itemTitle.length != 0){
		    searchItems(itemTitle);
    		$('#itemSearchWrap').css('display','block');
    	}else{
			$('#itemSearchWrap').css('display','none'); 
    	}
    	//console.log(itemTitle);
	});
    
    $('#productName').focusout(function () {
    	  // 검색이 된 것을 클릭시 검색된 
    	  // 아이템에 번호를 ajax를 처리해준다.
    	  // 후에 다른 카테고리의 값들을  초기화 해준다.
        $('#itemSearchWrap').on('click','.list_item',function(){
        	listNo = $(this).data('value'); 
         	second = null;
        	skin=  null;
        	age = null;
        	problem = null;
        	gift = "T-F-";
        	type = null;   
        	click=0;
        	order="regdate";
        	$('#productName').val('');
        	$('#itemSearchWrap').css('display','none'); 
        	reviewList(1);
        })    	
	});  //productName end 
    
    var pageNo = 1;
   /*리뷰 리스트 ajxa */
   reviewList(pageNo);
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
  		reviewList(1);
  	})
  	
	var $reviewType = $('#reviewType li');
    var $category =$('.review_category li');

    $('.category_main_img').slick({
        dots: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 3000,
    });

    var categoryImg = $('.category_img');
    var categoryMainImg =$('.category_main_img');
    var secondLine = $('.second_category ul');


    //카테고리 선택버튼 동작 관련 버튼
    $('.review_category_btn').click(function () {
        $(this).next().toggleClass('review_category_on');
    });

    $('.first_category>li').hover(function () {
        var idx = $(this).index();

        categoryImg.css({
            'background-image':'url("/img/review_main_img/category_img_'+idx+'.png")',
            'opacity': '1',
            'left':'300px'
        });

        categoryMainImg.css({
            'opacity': '0',
            'left':'300px'
        });

    });

    $('.product_category').hover(function () {
    	//listNo , click 유무 초기화
    	listNo=0;
    	click=0;
        secondLine.show()
    });

    $('.product_category').mouseleave(function () {
        categoryImg.css({
            'opacity': '0',
            'left':'150px'
        });
        categoryMainImg.css({
            'opacity': '1',
            'left':'150px'
        })
    });

    //카테고리 선택하고자 리스트에서 버튼을 클릭하였을 경우
    $('.first_category .cat_btn').click(function () {
        var choiceCategoryArea = $('#choiceCategoryArea ul');
        var categoryVal = $(this).attr('value');
        //name 값을 받는다 
        var name= $(this).attr('name');
        var categoryTitle = $(this).html();
        var choiceCategoryFilter = $('<li id="'+categoryVal+'" value="'+categoryVal+'" name="'+name+'">'+categoryTitle+'<span>제외하기</span></li>');
        // order 이라는 변수는 최신 순으로 세팅을 시켜준다.
        order="regdate";
        //이미 선택된 카테고리의 값과 명을 받는다.
        var choiceCategory = $('#choiceCategoryArea ul').children('#'+categoryVal+'').attr('value');
        var choiceCategoryName = $('#choiceCategoryArea ul').children('#'+categoryVal+'').attr('name');
        
        //선택된 카테고리를 choiceCategoryArea에 li로 추가
        if(choiceCategory==categoryVal && choiceCategoryName == name){
            //선택된 카테고리가 이미 필터에 추가된 경루 alert
            alert("이미 선택한 필터입니다~(✪‿✪)ノ");
        }else{
        	// checkType이라는 함수에 명과 값을 넣어준다.
            checkType(name,categoryVal);
        	// 후에 요소를 추가 시켜준다.
            choiceCategoryArea.append(choiceCategoryFilter);
        }

        //선택된 필터 영역에서 선택된 필터를 눌렀을 경우
        $('#choiceCategoryArea ul li').unbind("click").bind("click",function(){
            //삭제될 요소들의 명 과 값을 변수에 담는다.
            var removeVal = $(this).attr('value');
            var removeName = $(this).attr('name');
            // remobeType이라는 함수를 통하여 ajax를 처리한다.
            removeType(removeVal,removeName);
            // 후에 지워버린다.
            $(this).remove();
        });
    });
    
/* ajax 관련 함수들 */
    function reviewList(pageNo) {
      	 $.ajax({
    	    	url:"/ajax/review/page",
    	    	type: "post",
    	    	dataType : "json",
    	    	data:{
    	    		"order": order,
    	    		"pageNo" : pageNo,
    	    		"type":type,
    	    		"listNo":listNo,
    	    		"second":second,
    	    		"skin":skin,
    	    		"age":age,
    	    		"problem":problem,
    	    		"gift":gift,
    	    		"click":click,
    	    		"loginUser":loginUserNo
    	    	},
    	    	  error:function(){
    	              alert("서버 정검중!")
    	          },
    	          success:function(json){
    	        	    console.log(json)
    	        	    $(".review_list").html($reviewTmpl({reviews:json.list}));
    	        	    $("#paging").html(json.paginate); 
    	        	    
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
      
      function searchItems(titles) {
    	   	 $.ajax({
    	 	    	url:"/ajax/search/item/"+titles,
    	 	    	type: "post",
    	 	    	dataType : "json",
    	 	    	  error:function(){
    	 	              alert("서버 정검중!")
    	 	          },
    	 	          success:function(json){
    	 	        	 $("#itemSearchWrap").html($searchItemTmpl({items:json}));
    	 	          }
    	 	    });//ajaxList end
    	   }//searchItems
    	   
/*  필터링 함수 처리 
 *  Str 이라는 변수들은 임시 저장 공간이다.
 *  저장을 하지만 값을 넘길떄에는 초기 변수에 담아서 넘어간다.
 *  
 */
	var secondStr="";
	var skinStr="";
	var ageStr="";
	var problemStr="";
	var giftStr="";
	
    function checkType(name,val){
    
    	if(name=="second"){
    		second="";
    		second += val+"-";
    		secondStr+=second;
    		second=secondStr;
    	}
      	if(name=="skin"){
      		skin="";
      		skin += val+"-";
      		skinStr+=skin;
      		skin=skinStr;
    	}
      	if(name=="problem"){
      		problem="";
      		problem += val+"-";
    		problemStr+=problem;
    		problem=problemStr;
    	}
    	if(name=="age"){
    		age="";
    		age += val+"-";
      		ageStr+=age;
      		age=ageStr;
    	}
    	if(name=="gift"){
    		gift="";
    		gift += val+"-";
    		giftStr+=gift;
    		gift=giftStr;
    	}
    	
    	reviewList(1);
    }//checkType(name,val) end
    
    function removeType(removeVal,removeName){
    	var valNum , proStr , lastValNum , prevStr;
    	  if(removeName =="second"){
           	 valNum = second.indexOf(removeVal+"-");
           	 proStr = second.substring(0,valNum);
           	 lastValNum = valNum+2;
           	 prevStr =second.substring(lastValNum,second.length);
           	 second=proStr+prevStr;
           	 secondStr=second;
             }
    	  if(removeName =="skin"){
            	 valNum = skin.indexOf(removeVal+"-");
            	 proStr = skin.substring(0,valNum);
            	 lastValNum = valNum+2;
            	 prevStr =skin.substring(lastValNum,skin.length);
            	 skin=proStr+prevStr;
            	 skinStr=skin;
              }
    	  if(removeName =="age"){
         	 valNum = age.indexOf(removeVal+"-");
         	 proStr = age.substring(0,valNum);
         	 lastValNum = valNum+2;
         	 prevStr =age.substring(lastValNum,age.length);
         	 age=proStr+prevStr;
         	 ageStr=age;
         	}
    	  if(removeName =="problem"){
          	 valNum = problem.indexOf(removeVal+"-");
          	 proStr = problem.substring(0,valNum);
          	 lastValNum = valNum+2;
          	 prevStr = problem.substring(lastValNum,problem.length);
          	 problem=proStr+prevStr;
             problemStr =problem;
            }
    	  if(removeName =="gift"){
           	 gift="T-F-";
           	 giftStr=gift;
           	}
             reviewList(1);
    }
    
    //상단 리뷰 종류 선택 버튼 동작
    //여기서도 filter떄문에 val 값을 받는다....
    $reviewType.click(function () {
        $('.on').removeClass('on');
        $(this).addClass('on');
        type = $(this).data('value');
        if(type=='A'){type=null;}
	   	reviewList(1);
    });
    
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