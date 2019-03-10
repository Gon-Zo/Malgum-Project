<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>뷰티제품 메인</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
   	<link rel="stylesheet" href="/css/productCard.css">
    <link rel="stylesheet" href="/css/slick.css ">
    <link rel="stylesheet" href="/css/product-slick-theme.css">
    <link rel="stylesheet" href="/css/paging.css">
        <link rel="stylesheet" href="/css/template.css">
    <style>

      
        #content {
            /*background-color: red;*/
            width: 1200px;
            min-height: 1500px;
            margin:30px auto;
            position: relative;
        }

        #choiceCategoryArea{
            width: 1200px;
            min-height: 50px;
        }
        #choiceCategoryArea ul{
            margin-top: 10px;
            display: inline-block;
            width: 1200px;
            min-height: 40px;
            border-bottom: 2px solid #283593;
        }
        #choiceCategoryArea ul li,#choiceCategoryArea ul li span{
            width: 100px;
            height: 20px;
            border-radius: 3px;
            padding: 5px;
            background: #bbdefa;
            float:left;
            text-align: center;
           margin: 10px 10px;
            font-size: 12px;
            line-height: 20px;
            cursor: pointer;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            position: relative;
        }
        #choiceCategoryArea ul li span{
            position: absolute;
            margin: 0px;
            top: 0px;
            left: 0px;
            opacity: 0;
            transition: .3s ease;
        }

        #choiceCategoryArea ul li span:hover{
            opacity: 1;background: #283593;
            color: #fff;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }

        .product_category{
            position: relative;
            width: 1200px;
            height: 350px;
            transition: .4s ease;
        }

        .first_category,.second_category,.category_img,.category_main_img{
            position: absolute;
            float: left;
            top: 0px;
            left: 0px;
            height: 350px;
            color: #283593;
            cursor: pointer;
        }
        .category_main_img{
            width: 1050px;
            height: 350px;
            left: 150px;
     }
        .category_main_img img{
            width: 1050px;
            height: 350px;
        }
        .category_img{
            transition: .3s ease;
            width: 900px;
            left: 150px;
            z-index: 2000;
            opacity: 0;
        }
        .second_category{
            left: 150px;
            display: none;
        }

        .first_category li,.second_category li,.first_category li span{
            width: 150px;
            height: 50px;
            line-height: 50px;
            text-align: center;
        }
        .first_category li span{
            display: inline-block;
        }
        .first_category li:hover,.second_category li:hover{
            background: #283593;
            color: #fff;
        }
        .first_category li:hover ul{
            display: block;
        }
        /*.product_category:hover .category_main_img,.product_category:hover .category_img{*/
            /*left: 300px;*/
        /*}*/
        .first_category li:hover .category_main_img{
            opacity: 0;

        }
        
         .order_select_area{
            float: right;
    		height: 25px;
    		margin: 5px;
    		width: 1200px;

        }

        .order_select_area select{
            text-align: center;
            float: right;
            width: 100px;
            height: 25px;
            border:none;
            border-bottom: 1px solid #aaa;
            outline: none;
            color: #424242;
        }
        .order_select_area select option{
            border:none;
            outline: none;
        }
        
        #productsWrap{
        	width: 1200px;
        	height: 1300px;
        	position: relative;
        	
        }

        #products {
            width: 1200px;
            height: 1350px;
            position: relative;
            top:40px
        }
        #paginateAera{
        	position:absolute;
        	bottom:20px;
         	width: 1200px;
        
        }


    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>

    
    <div id="content">

        <!--<div class="review_category_btn"><i class="fas fa-list"></i> 카테고리선택</div>-->
        <div class="product_category">
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
                <li><span name="G"  value="G" id="firstG">성별</span>
                    <ul class="second_category" id="secondG">
                        <li ><span class="cat_btn" name="gender" value="M">남성</span></li>
                        <li ><span class="cat_btn" name="gender" value="W">여성</span></li>
                    </ul>
                </li>
            </ul>


            <div class="category_main_img">
                <div><img src="/img/review_main_img/category_img_0.png" ></div>
                <div><img src="/img/review_main_img/category_img_1.png" ></div>
                <div><img src="/img/review_main_img/category_img_2.png"></div>
                <div><img src="/img/review_main_img/category_img_3.png" ></div>
            </div>
            <div class="category_img"></div>
        </div>

        <!--<div class="filter_main_img">-->
            <!--<div><img src=""></div>-->
        <!--</div>-->
        <div id="choiceCategoryArea">
            <ul>
					
					
                <!--선택 카테고리 필터 들어가는 곳-->
            </ul>
        </div>
           <div class="order_select_area">
    <select id="orderSelect" name="order" title="정렬기준" >
        <option value="regdate">최신순</option>
        <option value="score">평점순</option>
    </select>
     </div>
        <div id="products">

            <div id="productsWrap">

            </div><!-- //#productsWrap end -->
        </div><!-- //#products end -->
    </div><!-- //#content end -->

<div id="footer">
    <ul class="footer_wrap">
        <li class="list_footer_item"><a href="#">공지사항</a></li>
        <li class="list_footer_item"><a href="#">도움말</a></li>
        <li class="list_footer_item"><a href="#">개인정보처리방침</a></li>
        <li class="list_footer_item"><a href="#">이용약관</a></li>
        <li class="list_footer_item"><a href="#">운영정책</a></li>
    </ul>
    <div class="ci">&copy;無題</div>
</div><!--#footer end-->

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
            <div class="product_name"><a href="/item/<@=item.itemNo@>"><@=item.itemTitle@></a></div><!--//product_name end-->
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
   <div id="paginateAera"><@=paginate @></div>

    </script>

    <script src="/js/jquery.js"></script>
    <script src="/js/underscore-min.js"></script>
    <script src="/js/template.js"></script>
    <script src="/js/productCard.js"></script>
    <script src="/js/slick.min.js"></script>
    <script>
 
    
    _.templateSettings = {
            interpolate: /\<\@\=(.+?)\@\>/gim,
            evaluate: /\<\@([\s\S]+?)\@\>/gim,
            escape: /\<\@\-(.+?)\@\>/gim
        };
    

	var second ="1-2-3-4-5-6-7-8-9-10-";
	var skin =null;
	var age = null;
	var problem = null;
	var order="regdate";
	var gender=null;
    
 
    $("#productsWrap").on("click",".pouch_img i",function (e) {
    	//alert("test");
    		e.preventDefault();
    	  
    	
    			$.ajax({
    	 	   		url:"/ajax/addpouch/"+loginUserNo,
    	    		type:"post",
    	    		dataType:"json",
    	    		error:function(xhr,error,code){
    	    			alert("서버 점검")
    	    		},
    	 			success:function(data){
    	 			
    	 			  	$(this).toggleClass('fas').toggleClass('far');
    	 			}  
    	    	
    			});
    	
    	});
    
   		var page = 1;
    
 		var order = "regdate";   
           
        var itemTmp =_.template($("#itemTmp").html());
		
        
       
        
		function getItems(page){
			
			$.ajax({
				url:"/ajax/items/page",
				type:"get",
				dataType:"json",
				data:{
    	    		"order": order,
    	    		"page" : page,
    	    		"second":second,
    	    		"skin":skin,
    	    		"age":age,
    	    		"problem":problem,
    	    		"gender":gender,
    	    	},
				error:function(){
					
					alert("서버 점검중");
				},
				success:function(json){
			
					
					$("#productsWrap").html(itemTmp(json));
				}
				
			})//getItems end

		}
		
		getItems(1);
		
		   $('#orderSelect').on('change', function(){
		    	
			   order = $('#orderSelect').val();
		    	
		    	getItems(1);
		    });
		   
		   
		   
		 
		   
		   
		    /*  필터링 함수 처리 
		     *  Str 이라는 변수들은 임시 저장 공간이다.
		     *  저장을 하지만 값을 넘길떄에는 초기 변수에 담아서 넘어간다.
		     *  
		     */
		    	var secondStr="";
		    	var skinStr="";
		    	var ageStr="";
		    	var problemStr="";
		  var genderStr= "";
		    	
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
		        	if(name=="gender"){
		        		gender="";
		        		gender += val+"-";
		        		genderStr+=gender;
		          		gender=genderStr;
		          		
		        		console.log("gender ::"+gender)      
		          		console.log("genderStr ::"+genderStr)   
		        	}
		        	
		        	getItems(1);
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
		        	  if(removeName =="gender"){
			              	valNum = gender.indexOf(removeVal+"-");
			              	proStr = gender.substring(0,valNum);
			              	lastValNum = valNum+2;
			              	genderStr = gender.substring(lastValNum,gender.length);
			              	gender=proStr+prevStr;
			              	genderStr =gender;
			          		console.log("gender ::"+gender)      
			          		console.log("genderStr ::"+genderStr)     
			          		if(gender=="undefined"){gender=null;genderStr=null;}
		        	  }
			        	 
		        	  getItems(1);
		        }
		   

		   
		
		$("#productsWrap").on("click",".paginate a",function(e) {
			
			
			e.preventDefault();
			
			var href = $(this).attr("href");
			
			
			
			var no = href.substring(href.lastIndexOf("/")+1,href.length);
			
			pageNo= no;
			getItems(pageNo);
			
			
		});
       

        $('.pouch_img').click(function () {
            $(this).children().toggleClass('fas').toggleClass('far');
            //alert();
        });

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
       
       
       function numberWithCommas(x) {
    	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	}


    </script>
</body>
</html>