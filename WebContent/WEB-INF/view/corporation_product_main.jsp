<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>productMain</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/corporation_product_main.css">
    <link rel="stylesheet" href="/css/jquery.dropdown.css">
    <link rel="stylesheet" href="/css/productCard.css">
    <link rel="stylesheet" href="/css/paging.css">
    <link rel="stylesheet" href="/css/template.css">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<div id="content">

    <div id="products">

        <h1>${loginUser.brand }님의 등록한 제품 관리</h1>
		<a href="/item/write" class="item_add_btn">등록</a>
        <div id="productsWrap">

        </div><!-- //#productsWrap end -->

        <div id="paging">
           
        </div><!--//paginate-->

    </div><!-- //#products end -->

</div><!-- //#content end -->
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
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.dropdown.js"></script>
<script src="/js/template.js"></script>
<script>
_.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };
var $searchItemTmpl = _.template($("#itemTmp").html());
var loginUser = ${loginUser.no};

getItems(1);

function getItems(pageNo){
	$.ajax({
		url:"/ajax/corporation/items/page/"+pageNo+"/"+loginUser,
		type:"get",
		dataType:"json",
		error:function(){
			alert("서버 점검중");
		},
		success:function(json){
			$("#productsWrap").html($searchItemTmpl({list:json.list}));
			$("#paging").html(json.paginate);
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

function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

</script>
</body>
</html>