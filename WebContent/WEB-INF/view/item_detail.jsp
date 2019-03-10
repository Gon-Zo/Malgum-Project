<%@page import="java.util.Date"%>
<%@page import="com.mujea.malgum.vo.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 숫자의 출력을 위한 JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- list 사이즈를 구하기 위한 JSTL -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제품메인페이지</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
        <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/productCard.css">
    <link rel="stylesheet" href="/css/review_popup.css">
    <link rel="stylesheet" href="/css/slick.css">
    <link rel="stylesheet" href="/css/review-slick-theme.css">
    <link rel="stylesheet" href="/css/paging.css">
    <style>
        /* 폰트설정 */
        body *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        /* 제품상세페이지_전체_wrap */
        #productDetailDiv{
            width: 1200px;
            height: auto;
            margin: auto;
        }

        /* 제품상세정보_div */
        .product_detail_div{
            width: 1200px;
            height: 400px;
            border-bottom: 1px solid #bbdefa;
            margin-bottom: 10px;
        }
        /* 제품상세정보_img */
        .product_detail_img{
            width: 368px;
            height: 368px;
            margin: 20px;
            border: 1px solid #bbdefa;
            border-radius: 5px;
            float: left;
        }
        /* 제품 랭킹 */
        .product_rank{
            width: 100px;
            height: 100px;
            background-color: #bbdefa;
            margin: 10px;
            border-radius: 5px;
            position: absolute;
        }
        .product_rank_img{
            width: 100px;
            height: 100px;
            border-radius: 5px;
        }
        /* 제품 이미지 */
        .product_main_img{
            width: 368px;
            height: 368px;
            border-radius: 5px;
            object-fit:contain;
        }
        /* 제품상세정보_제품정보 */
        .product_detail_contents{
            width: 750px;
            height: 300px;
            margin: 20px;
            float: left;
            /*background-color: #777b80;*/
            position: relative;
        }
        /* 제품상세정보 ul */
        .product_information_list{
            width: 600px;
            height: 260px;
            margin-left: 60px;
            /*background-color: red;*/
        }
        /* 제품상세정보 */
        .product_information_list>li{
        }
        /* 제품명 색상, min-height(두줄 까지나오게)*/
        .product_information_list li:nth-child(2){
            color: #424242;
            min-height: 60px;
        }
        .product_brand_name{
            color: #424242;
            font-size: 22px;
            margin: 22px 0px;
        }
        .product_product_name{
            color: #424242;
            font-size: 30px;
            font-weight: bold;
            margin: 22px 0px;
        }
        .product_skin_type{
            color: #424242;
            font-size: 20px;
            margin-top: 15px;
        }
        .product_skin_worry{
            color: #424242;
            font-size: 20px;
            margin-top: 15px;
            margin-bottom: 10px;
        }
        .product_skin_caution{
            font-size: 17px;
            color: #C62828;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .product_volume{
            color: #424242;
            font-size: 18px;
            margin: 5px 0px;
        }
        .product_grade{
            font-size: 22px;
            margin: 20px 0px;
            height:40px;
            line-height: 40px;
        }
        .product_grade .fa-tint{
            color: #bbdefa;
        }
		/* 제품 평점에 대한 표시 소수점 2자리 까지 */
		.item_grade_wrap{
            display: inline-block;
            width:87px;
            height:30px;
            /*background-color: beige;*/
            font-size:25px;
            position: relative;
        }
        .item_grade_box_before{
            width:87px;
            height:33px;
            position: absolute;
            top:0;
            left:0;
        }
        .item_grade_box_after{
            width:87px;
            height:33px;
            position: absolute;
            content: attr(data-split);
            overflow: hidden;
            top:0;
            left:0;
        }

        .item_grade_box_after>i {
            position: absolute;
            bottom:0;
        }
        .product_grade .score_color{
        	color:#283593;
        }

        .item_grade_box_after>i:nth-child(1) {
            left:0;
        }
        .item_grade_box_after>i:nth-child(2) {
            left:17px;
        }
        .item_grade_box_after>i:nth-child(3) {
            left:34px;
        }
        .item_grade_box_after>i:nth-child(4) {
            left:51px;
        }
        .item_grade_box_after>i:nth-child(5) {
            left:68px;
        }

        /* 수정, 단종, 파우치 btn_div */
        .product_manager_div{
            width: 288px;
            height: 40px;
            float: left;
            margin-top: 10px;
            margin-left: 500px;
        }

        /*  관리자 수정, 단종, 파우치_btn_size */
        .manager_btn_size{
            width: 80px;
            height: 40px;
            right: 100px;
            float: left;
            left: 800px;
            color: #424242;
            font-size: 22px;
            font-weight: bold;
            text-decoration: none;
            text-align: center;
            line-height: 40px;
            border-radius: 5px;
            margin: 0px 6px;
            border: 2px solid #90CAF9;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            background-color: #bbdefa;
        }
        .manager_btn_size>a{
            text-decoration: none;
            font-weight: bold;
            color: #424242;
        }
        /* 수정 호버 시 */
        .product_update_btn:hover{
            color: #EEEEEE;
            background-color: #283593;
            transition: .3s ease;
        }
        /* 단종 호버 시*/
        .product_extinction_btn:hover{
            color: #EEEEEE;
            background-color: #283593;
            transition: .3s ease;
        }
        /* 파우치 호버 시*/
        .product_pouch_btn:hover{
            color: #EEEEEE;
            background-color: #283593;
            transition: .3s ease;
        }

        /* 데이터분석_키워드 */
        .product_bigdata_div{
            width: 1200px;
            height: 248px;
            /*background-color: #00B0FF;*/
            border-top: 1px solid #bbdefa;
            border-bottom: 1px solid #bbdefa;
            margin-bottom: 10px;
            display: none;
        }
        
        /* 데이터분석_타이틀 */
        .product_bigdata_title{
            width: 1200px;
            height: 50px;
            font-size: 22px;
            font-weight: bold;
            line-height: 50px;
            /*margin: 0px 20px;*/
            text-align: center;
            line-height: 50px;
            color: #424242;
        }
        .product_bigdata_keywords{
            width: 1158px;
            height: 200px;
            margin: 0px 20px;
        }

        /* 제품정보,리뷰_전체_div */
        .product_review_div{
            width: 1200px;
            height: 78px;
            border-top: 1px solid #bbdefa;
            border-bottom: 1px solid #bbdefa;
            margin-bottom: 10px;
            /*background-color: #00bb00;*/
        }
        .product_info_title{
            width: 300px;
            height: 55px;
            margin: 10px 20px;
            color: #424242;
            font-size: 32px;
            font-weight: bold;
            text-align: left;
            line-height: 55px;
            float: left;
        }
        /* 리뷰_btn */
        .info_btn_size{
            width: 120px;
            height: 60px;
            text-align: center;
            line-height: 60px;
            border-radius: 5px;
            margin-top: 7px;
            margin-left: 1055px;
            background-color: #bbdefa;
            display: block;
            border: 2px solid #90CAF9;
            color: #424242;
            font-size: 30px;
            font-weight: bold;
            text-decoration: none;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            transition: .3s ease;
        }
        .info_btn_size:hover {
            box-shadow:none;
            background-color: #1a237e;
            color:#EEEEEE;
        }

        /* 제품정보_div_전체 */
        .product_information{
            width: 1200px;
            height: 540px;
            border-top: 1px solid #bbdefa;
            border-bottom: 1px solid #bbdefa;
            margin-bottom: 10px;
        }
        /* 제품정보_img*/
        .product_ingredient{
            width: 458px;
            height: 518px;
            margin: 10px 20px;
            float: left;
            border-radius: 5px;
        }
        .product_ingredient_title{
            width: 460px;
            height: 60px;
            font-size: 25px;
            color: #424242;
            line-height: 60px;
            text-align: center;
            border-radius: 4px 4px 0px 0px;
            font-weight: bold;
        }
        /* 제품성분_div*/
        .product_ingredient_div{
            width: 458px;
            height: 458px;
            border: 1px solid #bbdefa;
            border-radius: 5px;
        }
        /* 제품성분_img*/
        .product_ingredient_img{
            width: 458px;
            height: 458px;
            border-radius: 5px;
            object-fit:contain;
        }
        /* 제품정보_설명 */
        .product_information_explanation{
            width: 658px;
            height: 518px;
            margin: 10px 20px;
            border-radius: 5px;
            float: left;
        }
        /* 제품설명_제목 */
        .product_explanation_title{
            width: 660px;
            height: 60px;
            color: #424242;
            line-height: 60px;
            text-align: center;
            font-size: 25px;
            font-weight: bold;

        }
        /* 제품설명_내용 */
        .product_explanation_contents{
            width: 618px;
            height: 418px;
            padding: 20px;
            border: 1px solid #bbdefa;
            border-radius: 5px;
        }
        /* 제품정보내용 폰트 크기*/
        .product_information_contents{
            font-size: 20px;
            line-height: 150%;
        }

        /* 20가지_주의성분_div */
        .product_precautions_div{
            width: 1200px;
            height: 300px;
            border-top: 1px solid #bbdefa;
            border-bottom: 1px solid #bbdefa;
            margin-bottom: 10px;
            /*background-color: #80D8FF;*/
        }
        /* 20가지_주의성분_title */
        .product_precautions_title{
            width: 1200px;
            height: 30px;
            margin-top: 10px;
            margin-left: 20px;
            line-height: 30px;
            font-size: 18px;
            color: #424242;
            font-weight: bold;
            line-height: 30px;
            /*background-color: #9E9E9E;*/
        }
        /* 20가지_주의성분_내용*/
        .product_precautions_content{
            width: 1200px;
            height: 250px;
            margin: auto;
            /*margin-left: 20px;*/
            /*background-color: #1992df;*/
        }
        /* 20가지_주의성분_리스트*/
        .product_precautions_list{
            width: 1100px;
            height: 250px;
            margin: auto;
            /*background-color: beige;*/
            padding-top:10px;
        }
        .product_precautions_list>li{
            float: left;
            margin: 5px;
            position: relative;
        }
        .product_precautions_list>li>div{
            width:200px;
            height:50px;
        }
        .product_precautions_list>li>div>span{
            margin: auto;
            text-align: center;
            width:150px;
            height:50px;
            line-height: 50px;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color:lightgray;
            font-size:18px;
        }
        .product_precautions_list>.item_warn_color{
        	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        .product_precautions_list>.item_warn_color>div>span{
        	color:#283593; font-weight: bold; font-size:20px;
        }
        .product_precautions_list .product_precautions{
            z-index: 300;
            width: 250px;
            min-height: 50px;
            font-size: 12px;
            position: absolute;
            top: 60px;
            border-radius:  0 3px 3px 3px;
            left: 0;
            color: #fff;
            background: #424242;
            transition: .3s ease;
            display: none;
            padding:5px;
        }
        .product_precautions_list .product_precautions>.product_precautions_name{
            width:250px;
            min-height:25px;
            display: inline-block;
            font-size:20px;
            /*background-color: navy;*/
            line-height: 25px;
            margin-bottom:5px;
        }
        .product_precautions_list .product_precautions>.precautions {
            width:250px;
            min-height:25px;
            display: inline-block;
            font-size:15px;
            /*background-color: navy;*/
            line-height: 25px;
            margin-bottom:5px;
        }
        .product_precautions_list>li .product_precautions:before{
            content: '';
            width: 0;
            height: 0;
            position: absolute;
            top: -10px;
            left: 0px;
            border-left: 10px solid transparent;
            border-bottom: 10px solid #424242;
            border-right: 10px solid transparent;
        }

        /* 주의성분 이름 호버 시 내용 보여짐*/
        .product_precautions_list>li:hover .product_precautions{
            display: block;
        }
        /* 제품리뷰평점_전체 div */
        .product_grade_div{
            width: 1200px;
            height: 200px;
            margin-bottom: 10px;
            border-top: 1px solid #bbdefa;
            border-bottom: 1px solid #bbdefa;
        }
        /* 제품 리뷰, 그래프 가운데 정렬 div*/
        .product_grade_center{
            width: 810px;
            margin: 0 auto;
        }
        /* 제품리뷰평점_div */
        .product_grade_box{
            padding: 20px;
            width: 200px;
            height: 160px;
            float: left;
        }
        /* 제품리뷰평점_average */
        .grade_score_average{
            width: 200px;
            height: 80px;
            color: #424242;
            font-size: 60px;
            font-weight: bold;
            text-align: center;
            line-height: 90px;
            border-bottom: 5px solid #bbdefa;
            margin-bottom: 20px;
        }
        /* 제품리뷰평점_리뷰수 */
        .grade_score_count{
            width: 200px;
            height: 40px;
            color: #424242;
            font-size: 22px;
            text-align: center;
            line-height: 40px;
			border-bottom: 5px solid #bbdefa;
            margin-bottom: 20px;
        }
        /* 제품리뷰평점_평점그래프*/
        .product_score_graph{
            width: 570px;
            height: 200px;
            /*background-color: #80D8FF;*/
            /*border-left: 1px solid #424242;*/
            float: left;
        }
        .product_graph{
            width: 670px;
            height: 160px;
            margin: 20px 0px;
            /*background-color: #0e8783;*/
        }
        .product_graph li{
            width: 500px;
            height: 10px;
            margin-left: 120px;
            margin-top:25px;
            background-color: #bbdefa;
            line-height: 25px;
            display: block;
            cursor: pointer;
        }
        .product_graph li span{
            width: 500px;
            height: 10px;
            display: block;
            background-color: #283593;
        }
        .product_star{
            width: 100px;
            height: 160px;
            margin-top: 20px;
            margin-left: 10px;
            float: left;
            /*background-color: #1DE9B6;*/
        }
        .star_size{
            width: 100px;
            height: 25px;
            color: #bbdefa;
            font-size: 20px;
            font-weight: bold;
            line-height: 25px;
            text-align: center;
            margin-bottom: 8px;
            /*background-color: red;*/
        }
        .star_size span{
            color: #424242;
        }
        /* 그래프 게이지*/
        .product_graph li:nth-child(1) span{width: 100%;}
        .product_graph li:nth-child(2) span{width: 100%;}
        .product_graph li:nth-child(3) span{width: 100%;}
        .product_graph li:nth-child(4) span{width: 100%;}
        .product_graph li:nth-child(5) span{width: 100%;}

        /* 제품리뷰_전체 Div*/
        #productReplyDiv{
        width: 1200px;
        min-height: 1000px;
        position: relative;
        margin: auto;
        /*background-color: #F5F5F5;*/
        }

        /* 제품 필터 div / 전체, 포토리뷰, 간단리뷰, 리뷰작성, 최신순 */
        .product_filter_div{
            width: 1200px;
            height: 58px;
            border-top: 1px solid #bbdefa;
            border-bottom: 1px solid #bbdefa;
            margin-bottom: 10px;
            /*background-color: red;*/
        }
        .product_filter{
            width: 1160px;
            height: 60px;
            float: left;
            margin: 0px 20px;
            /*background-color: #9E9E9E;*/
        }
        /* 필터 크기 및 폰트 지정*/
        .filter_size{
            display: block;
            float: left;
            margin: 12px 10px;
            width: 96px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            font-size: 21px;
            font-weight: bold;
            border-radius: 5px;
            color: #424242;
            border: 2px solid #90CAF9;
            cursor: pointer;
            border-radius: 5px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            background-color: #bbdefa;
        }
        /* 전체 */
        .product_filter_total:hover{
            color: #EEEEEE;
            background-color: #1a237e;
            transition: .3s ease;
        }
        /* 포토리뷰 호버 시 */
        .product_filter_photo:hover{
            color: #EEEEEE;
            background-color: #1a237e;
            transition: .3s ease;
        }
        /* 간단리뷰 호버 시 */
        .product_filter_simple:hover{
            color: #EEEEEE;
            background-color: #1a237e;
            transition: .3s ease;
        }
        /* 리뷰작성 호버 시*/
        .product_review_write:hover{
            color: #EEEEEE;
            background-color: #1a237e;
            transition: .3s ease;
        }

        .product_filter_simple{
            margin-right: 560px;
        }
        .product_select_area{
            margin-right: 20px;
        }
        .product_select_area select{
            text-align: center;
            float: right;
            width: 96px;
            height: 30px;
            font-size: 21px;
            font-weight: bold;
            border:none;
            border-radius: 5px;
            border-bottom: 1px solid #bbdefa;
            background-color: #bbdefa;
            outline: none;
            color: #424242;
            cursor: pointer;
        }
        .product_select_area select option{
            border:none;
            outline: none;
            cursor: pointer;
        }

        /* from_no */
        #reviewListArea{
            width: 1200px;
            min-height: 100px;
        }

        #reviewListArea .review_list{
            display: inline-block;
            width: 1200px;
        }

        #reviewListArea .review_list .review_card{
            float: left;
            width: 1200px;
            height: 200px;
            margin-top: 30px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }

        .review_card .review_photo_area {
            height: 200px;
            width: 200px;
            float: right;
            position: relative;
            top:-175px;
        }


        .review_card .review_photo_area .photo_count{
            position: absolute;
            left: 3px;
            top: 1px;
            z-index: 100;
            font-size: 20px;
            color: rgba(000,000,000,.8);
        }

        .review_card .writer_info{
            float: left;
            margin: 7px auto;
            width: 1000px;
            height: 32px;
        }
        #reviewListArea .review_card .writer_info .score_list{
            float: left;
            width: 100px;
            height: 20px;
            margin: 10px 0 0 10px;
        }

        #reviewListArea .review_card .writer_info .score_list li{
            float: left;
            width: 20px;
            color: #bbdefa;
            text-align: center;
        }
        #reviewListArea .review_card .writer_info .profile_img_area{
            position: relative;
            top: 0px;
            left: 5px;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            color: #fff;
            background: #283593;
            font-size: 20px;
            font-weight: bold;
            line-height: 35px;
            text-align: center;
            float: left;
        }
		.profile_img{
			width:100%;
			height:100%;
			object-fit:contain;
			border-radius: 50%;
		}
        #reviewListArea .review_card .writer_info  .writer_detail_info{
            float: left;
            margin-left: 20px;
            height:35px;
            width: 800px;
            line-height:35px;
            /*background-color: beige;*/
        }

        #reviewListArea .review_card .writer_info  .writer_detail_info .writer_name{
            font-weight: bold;
        }

        #reviewListArea .review_card .review_info{
            width: 1000px;
            height: 165px;
        }
        #reviewListArea .review_card .review_info .review_title{
            width: 1000px;
            height:50px;
            font-size: 40px;
            font-weight: bold;
            margin:10px auto;
            text-indent: 10px;
        }

        #reviewListArea .review_card .review_info .review_contents{
            width: 1000px;
            height: 75px;
            font-size: 15px;
            padding-top: 10px;
            line-height: 75px;
            text-indent: 15px;
        }

        #reviewListArea .review_card .review_info .review_contents span{
            font-weight: bold;
            cursor: pointer;
            font-size: 18px;
            margin-left:30px;
        }

        #reviewListArea .review_card .review_info .count_area{
            width: 985px;
            height: 20px;
            padding-left:15px;
        }
        #reviewListArea .review_card .review_info .count_area span{
            margin-right: 10px;
        }/* from_no */

		.review_score_color{
        	color:#283593;
        }
        .review_photo_area{
        	width:200px;
        	height:200px;
        }
		.review_imgs div img{
			width:200px;
			height:200px;
			object-fit:contain;
		}
		
		/* 페이징 CSS */
        .paginate_div{
            width: 1200px;
            height: 60px;
            margin: 10px auto;
        }

        .product_graph>li:hover{
        	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
        }
        
        /* 단종 표시 */
        .product_type{
            width:100px;
            height:50px;
            background-color: #bbdefa;
            position: absolute;
            top: 0px;
            left: -140px;
            text-align: center;
            line-height: 45px;
            font-size: 30px;
            overflow: hidden;
        }
        .product_type>div{
            width:100px;
            height:10px;
            background-color: #283593;
            position: absolute;
            top:5px;
            left:-40px;
            transform: rotate(140deg);
        }
    </style>
</head>
<body>

<c:import url="/WEB-INF/template/header.jsp"/>
<!-- 제품정보_전체_Wrap -->
    <div id="productDetailDiv">

        <!-- 제품_상세정보_div -->
        <div class="product_detail_div">
            <!-- 제품_이미지박스-->
            <div class="product_detail_img">
                <!-- <div class="product_rank"><img class="product_rank_img" src="/img/rankImg.PNG" alt="rank"></div>-->
                <img class="product_main_img" src="/img/item/thumbnail/${item.img }" alt="제품사진">
            </div>

            <!-- 제품_정보_리스트-->
            <div class="product_detail_contents">
                <ul class="product_information_list">
                    <li class="product_brand_name">${item.brand } / ${item.category } </li>
                    <li class="product_product_name">${item.title } </li>
                    <c:if test="${item.type=='T' }">
                    <li class="product_type">단종<div></div></li>
                    </c:if>
                    <li class="product_skin_type">
                    <c:choose>
                    <c:when test="${item.skin=='D'}">
                    건성 /
                    </c:when>
                    <c:when test="${item.skin=='N'}">
                    중성 /
                    </c:when>
                    <c:when test="${item.skin=='O'}">
                    지성 /
                    </c:when>
                    <c:when test="${item.skin=='C'}">
                    복합성 /
                    </c:when>
                    <c:when test="${item.skin=='E'}">
                    모든피부 /
                    </c:when>
                    </c:choose>
                    <c:choose>
                    <c:when test="${item.age=='E'}">
                    전체연령
                    </c:when>
                    <c:when test="${item.age=='K'}">
                    유아
                    </c:when>
                    <c:when test="${item.age=='T'}">
                    청소년
                    </c:when>
                    <c:when test="${item.age=='A'}">
                    성인
                    </c:when>
                    <c:when test="${item.age=='M'}">
                    중년
                    </c:when>
                    </c:choose>
                    </li>
                    <li class="product_skin_worry">
                    <c:forEach items="${problemTypeList }" var="problemType" varStatus="status">
                    	<c:if test="${!status.last }">
                    		<c:out value="${problemType.title } /"/>
                    	</c:if>
                    	<c:if test="${status.last}">
                    		<c:out value="${problemType.title }"/>
                    	</c:if>
                    </c:forEach></li>
                    <li class="product_skin_caution">주의성분 ${fn:length(itemWarnList) }개</li>
                    <li class="product_volume">${item.volume } / <fmt:formatNumber value="${item.price }" groupingUsed="true"/>원</li>
                    <li class="product_grade"><fmt:formatNumber value="${reviewScoreAVG }" pattern="#0.00" />
                    	<div class="item_grade_wrap">
                            <div class="item_grade_box_before">
                                <i class="fas fa-tint "></i><!--
                                --><i class="fas fa-tint "></i><!--
                                --><i class="fas fa-tint "></i><!--
                                --><i class="fas fa-tint "></i><!--
                                --><i class="fas fa-tint"></i>
                            </div>
                            <div class="item_grade_box_after">
                                <i class="fas fa-tint score_color"></i><!--
                                --><i class="fas fa-tint score_color"></i><!--
                                --><i class="fas fa-tint score_color"></i><!--
                                --><i class="fas fa-tint score_color"></i><!--
                                --><i class="fas fa-tint score_color"></i>
                            </div>
                        </div>
                    	(${reviewTotal })
                   	</li>
                </ul>
            </div><!--//product_detail_information end -->

            <!-- 제품 수정, 단종 관리자_bnt / 로그인 시 제품 파우치 btn-->
            <div class="product_manager_div">
                <!-- 제품_수정_btn -->
                <c:if test="${loginUser.type=='C' && loginUser.no == item.userNo }">
                <div class="product_update_div">
                    <a class="product_update_btn manager_btn_size" href="" title="수정">수정</a>
                </div>
                <!-- 제품_단종_btn -->
                <div class="product_extinction_div">
                    <a class="product_extinction_btn manager_btn_size" href="/item/type/${item.no }/${item.type }" title="단종">단종</a>
                </div>
                </c:if>
                <c:if test="${loginUser.type=='UL' }">
                <!-- 제품_파우치_btn -->
                <div class="product_pouch_div">
                    <a href="" class="product_pouch_btn manager_btn_size" title="파우치">
                        <i class="fas fa-shopping-bag"></i></a>
                </div>
                </c:if>
            </div><!-- //product_manager_btn end -->
        </div><!-- //product_detail_div end -->



        <!-- 리뷰_빅데이터_분석 -->
        <div class="product_bigdata_div">
            <!-- 리뷰_빅데이터_분석_타이틀-->
            <div class="product_bigdata_title">리뷰 빅데이터 분석 Beta</div>
            <div class="product_bigdata_analysis">
                <!-- 리뷰_빅데이터_분석_키워드-->
                <div class="product_bigdata_keywords">
                    <span>부드럽게</span>
                    <span>보습</span>
                    <span>겨울에</span>
                    <span>향이 좋아요</span>
                </div>
            </div><!-- //product_bigdata_analysis end -->
        </div><!-- //product_bigdata_div  -->


        <!-- 제품정보 title/ 제품_내부링크_Btn -->
        <div class="product_review_div">
            <div class="product_info_title">제품 정보</div>
            <div class="product_review_btn"><a href="#productGrade" class="info_btn_size"
                    title="이 제품의 리뷰보기"><i class="far fa-comment-dots"></i> 리뷰</a></div>
        </div><!--//product_review_div end -->



        <!-- 제품 성분, 설명 -->
        <div class="product_information">
            <div class="product_ingredient">
                <div class="product_ingredient_title">제품 성분</div>
                <div class="product_ingredient_div">
                    <img class="product_ingredient_img" src="/img/item/thumbnail/${item.detailImg }" />
                </div>
            </div>
            <div class="product_information_explanation">
                <div class="product_explanation_title">제품 설명</div>
                <div class="product_explanation_contents">
                    <span class="product_information_contents">${item.content }</span>
                </div>
            </div>
        </div><!-- //product_information end -->

        <!-- 20가지_주의사항 -->
        <div class="product_precautions_div">
            <div class="product_precautions_title"><i class="fas fa-exclamation-triangle"></i> 20가지 주의성분</div>
            <div class="product_precautions_content">
                <ul class="product_precautions_list">
               		<c:forEach items="${warnList }" var="warn">
               			<li class="<c:if test="${itemWarnList.contains(warn)}">item_warn_color</c:if>">
               				<div>
		                        <span>${warn.title }</span>
	                        	<div class="product_precautions">
	                            	<span class="product_precautions_name">${warn.title }</span>
	                            	<span class="precautions">${warn.content }</span>
	                         	</div>
	                    	</div>
	                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div><!-- //product_precautions_div end -->
        

        <!-- 평점 -->
        <div id="productGrade" class="product_grade_div">
            <div class="product_grade_center">
                <div class="product_grade_box">
                    <div class="grade_score_average"><fmt:formatNumber value="${reviewScoreAVG }" pattern="#0.00" /></div>
                    <div class="grade_score_count">리뷰 : ${reviewTotal }</div>
                </div>
                <div class="product_score_graph">
                    <div class="product_star">
                        <div class="product_star5 star_size"><i class="fas fa-tint"></i><span> 5 (${reviewScoreCnt5 })</span></div>
                        <div class="product_star4 star_size"><i class="fas fa-tint"></i><span> 4 (${reviewScoreCnt4 })</span></div>
                        <div class="product_star3 star_size"><i class="fas fa-tint"></i><span> 3 (${reviewScoreCnt3 })</span></div>
                        <div class="product_star2 star_size"><i class="fas fa-tint"></i><span> 2 (${reviewScoreCnt2 })</span></div>
                        <div class="product_star1 star_size"><i class="fas fa-tint"></i><span> 1 (${reviewScoreCnt1 })</span></div>
                    </div>
                    <ul class="product_graph">
                        <li><span></span></li>
                        <li><span></span></li>
                        <li><span></span></li>
                        <li><span></span></li>
                        <li><span></span></li>
                    </ul>
                </div>
            </div>
        </div><!-- //product_precautions end -->

    </div><!--product_detail_Wrap-->

    <!-- 제품리뷰_전체_Wrap -->
    <div id="productReplyDiv">
        <!-- 제품_필터_div -->
        <div class="product_filter_div">
            <div class="product_filter">
                <a class="product_filter_total filter_size" title="전체">전체</a>
                <a class="product_filter_photo filter_size" title="포토리뷰">포토리뷰</a>
                <a class="product_filter_simple filter_size" title="간단리뷰">간단리뷰</a>
                
                <c:if test="${loginUser.type=='MALGUM' }">
                <a class="product_review_write filter_size" title="리뷰작성">리뷰작성</a>
				</c:if>
                <div class="product_select_area filter_size">
                    <select name="" title="정렬기준" >
                        <option value="">최신순</option>
                        <option value="">평점순</option>
                        <option value="">추천순</option>
                    </select>
                </div>
            </div><!-- //product_filter end-->
        </div><!-- 제품_필터_div end-->

        <!-- from_no -->
        <div id="reviewListArea">
            <ul class="review_list">
            </ul>
        </div>


        <!-- 페이징 처리_div-->
        <div class="paginate_div">
        </div><!--//paginate_div end -->
    </div><!-- //productReplyDiv end-->
		
<c:import url="/WEB-INF/template/footer.jsp"/>




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
						<img src="/img/review/thumbnail/<@=review.img@>">
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
					<img class="item_img" src="/img/item/thumbnail/<@=review.img@>" alt="제품사진">
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




<script type="text/template" id="reviewTmp">
<@ if(reviews != null){
	_.each(reviews, function(review){
	var userBirth = ((moment().format('YYYY')-moment(review.birth).format('YYYY'))+1).toString().substring(0,1)+"0대";
	var content = review.content;
	var userGenderStr = "남자";
	if(review.userGender=='W'){
		userGenderStr = "여자";
	}
	var userSkinStr = "모름";
	if(review.userSkin == null) {
		userSkinStr = "모름";
	}else if(review.userSkin == 'D') {
		userSkinStr = "건성";
	}else if(review.userSkin == 'N') {
		userSkinStr = "중성"; 
	}else if(review.userSkin == 'O') {
		userSkinStr = "지성";
	}else if(review.userSkin == 'C') {
		userSkinStr = "복합성";
	} 
	if(content==null){
		var list = review.list;
		content = list[0].content;
	}
@>
		<li class="review_card">
           <div class="writer_info">
              <ul class="score_list">
               	<@ for(var i = 0; i < 5; i++){@>
               		<li><i class="fas fa-tint <@if(i<review.score){@>review_score_color<@}@>"></i></li>
                   	<@ } @>
                   </ul>
                   <div class="profile_img_area">
					<@if(review.userImg!=null){@>
                   		<!--프로필 사진없으면 span 노출-->
                   		<img class="profile_img" src="/img/profile/thumbnail/<@=review.userImg@>" alt="프로필 이미지"/>
                   	<@}else{@>
                   		<span><@= review.name.toString().substring(0,1) @></span>
					<@}@>
                   </div>
                   <div class="writer_detail_info">
                       <span class="writer_name"><@=review.name@></span>
                       <span> <@=userGenderStr @>｜<@= userBirth @>｜<@=userSkinStr @> ｜ </span>
                       <span class="review_regdate"><@= moment(review.regdate).format('YYYY년 MM월 DD일') @></span>
                   </div>
               </div>
               <ul class="review_info">
                   <li class="review_title"><@=review.title@></li>
                   <li class="review_contents"><@=content @><span class="more_view" data-value="<@=review.no@>"> + 더보기</span></li>
                   <li class="count_area">
                   <span class="like count">
                       <i class="fas fa-heart" <@if(review.ckeckLike=='T'){@> style="color: #bbdefa"<@}@> ></i><@=review.likeNum @></span>
                       <span class="reply count">
                       <i class="far fa-comment-dots"></i><@=review.replyNum @></span>
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
      <@})
	}else{
.0
 @>
	<li class="review_card">
               리뷰가 없습니다.
    </li><!--review_card-->
<@ } @>
</script>


<script src="/js/jquery.js"></script>
<script src="/js/slick.min.js"></script>
<script src="/js/template.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
	
	var $reviewTmpl = _.template($("#reviewTmp").html());
	
    var $reviewType = $('#reviewType li');
    var $category =$('.review_category li');

    /*로그인 유저가 값이 null 일 경우 아래 의 함수는 실행 되지 않는다.*/
	var loginUserNo=0;
	<c:if test="${loginUser!=null}">
		loginUserNo = ${loginUser.no};
	</c:if>
    
	
	/*  */
	
	var $tmpComment = _.template($('#addComment').html());
	var $popupTmpl = _.template($("#reviewPopup").html());
	var content;
	var move = 0;
	//var loginUser = 704;
	var reviewVal = 0;
	var width = 0;
	
	
	
    var pageNo = ${pageNo};
	var order="regdate";
    var itemNo = ${item.no};
    var filterScore = 0;
    var reviewTypeStr = "전체";
    //제품 평점에 따른 색 칠하기
    var maxTint = $(".item_grade_box_after").css("width").replace(/[^0-9]/g, "");
    var percent = ${reviewScoreAVG }/5.00;
    //console.log(percent);
    //console.log(maxTint);
    //console.log(maxTint * percent);
    $(".item_grade_box_after").css("width", (maxTint * percent) +'px');
    //console.log(percent.toFixed(2));
    
    //제품 평점에 따른 그래프
    var maxScore = ${reviewTotal};
    //console.log(maxScore);
    var score = [${reviewScoreCnt5 }, ${reviewScoreCnt4 }, ${reviewScoreCnt3 }, ${reviewScoreCnt2 }, ${reviewScoreCnt1 }];
    for(var i = 0; i < 5 ; i++){
    	percent = score[i]/maxScore * 100;
    	//console.log(percent + "%");
    	var target = ".product_graph li:nth-child("+(i+1)+") span";
    	$(target).css("width",percent+"%");
    }
    
    //필터
    $(".product_filter>a").click(function(){
    	var btnText = $(this).text();
    	//alert(btnText);
    	reviewTypeStr = btnText;
    	//console.log(reviewTypeStr);
    	reviewList(pageNo);
    });
    $(".product_graph>li").click(function(){
    	var $this = $(this);
        var idx = $this.index();
        //var $score = $this.parents(".product_score_graph").children(".product_star").find(".star_size").eq(idx);
        //var scoreStr = $score.find("span").text();
        //console.log(score[idx]);
        if(idx == 0){
        	if(filterScore!=5){
        		filterScore	= 5;	
        	}else{
        		filterScore	= 0;
        	}
        }else if(idx == 1){
        	if(filterScore!=4){
        		filterScore	= 4;	
        	}else{
        		filterScore	= 0;
        	}
        }else if(idx == 2){
        	if(filterScore!=3){
        		filterScore	= 3;	
        	}else{
        		filterScore	= 0;
        	}
        }else if(idx == 3){
        	if(filterScore!=2){
        		filterScore	= 2;	
        	}else{
        		filterScore	= 0;
        	}
        }else if(idx == 4){
        	if(filterScore!=1){
        		filterScore	= 1;	
        	}else{
        		filterScore	= 0;
        	}
        }
        //console.log(filterScore);
        reviewList(pageNo);
    });
    $(".product_select_area>select").change(function(){
    	var option = $(".product_select_area>select option:selected").text();
    	//alert(option);
    	if(option == "최신순"){
    		//alert("order : 최신순");
    		order="regdate";
    	}else if(option == "추천순"){
    		//alert("order : 추천순");
    		order="like"
    	}else if(option == "평점순"){
    		//alert("order : 평점순");
    		order="score"
    	}
    	reviewList(pageNo);
    });
    //리뷰 리스트 페이징 처리
    function reviewList(pageNo){
    	$.ajax({
    		url:"/ajax/item/review/"+pageNo,
    		type: "post",
    		dataType : "json",
    		data:{
    			"itemNo":itemNo,
    			"order":order,
    			"filterScore":filterScore,
    			"reviewTypeStr":reviewTypeStr,
    			"loginUser":loginUserNo
    		},
    		error:function(e){
    			alert("서버 점검중!");
    		},
    		success:function(json){
    			console.log(json);
    			$(".review_list").html($reviewTmpl({reviews:json.itemReviewList}));
    			$(".paginate_div").html(json.paginate);
    			
    			$('.review_imgs').slick({
    		        dots: true,
    		        slidesToShow: 1,
    		        slidesToScroll: 1,
    		        autoplay: true,
    		        autoplaySpeed: 2500,
    		    });
    		}
    	});
    }
    
    //리뷰 리스트 페이징 관련
    reviewList(pageNo);
    $(".paginate_div").on("click",".paginate a",function(e) {
       	e.preventDefault();
       	var  no = $(this).attr("href");
       	var test = no.substring(no.lastIndexOf("/")+1 , no.length);
       	pageNo = test;
       	reviewList(pageNo);
       });
    
    //뷰 종류 선택 버튼 동작
    $reviewType.click(function () {
        $('.on').removeClass('on');
        $(this).addClass('on');
    });

    //카테고리 선택버튼 동작 관련 버튼
    $('.review_category_btn').click(function () {
        var categoryMainImg = $('.category_main_img');
        //눌렀을 경우 css변경 클래스 추가
        $(this).toggleClass('category_on');
        //리뷰 카테고리 리스트 영역을 보여줌
        $(this).next().toggleClass('review_category_on');

        categoryMainImg.toggleClass('category_main_img_on') ;
    });


    $('.first_category li').hover(function () {
        var idx = $(this).index();
        //var categoryImg =$('.category_img').css('background-image');

        //alert(idx);
        //alert(categoryImg);

        $('.category_img').css('background-image','url("review_main_img/category_img_'+idx+'.png")');

    });

    //카테고리 선택하고자 리스트에서 버튼을 클릭하였을 경우
    $category.click(function () {

        var choiceCategoryArea = $('#choiceCategoryArea ul');
        var categoryVal = $(this).attr('value');
        var categoryTitle = $(this).html();
        var choiceCategoryFilter = $('<li id="'+categoryVal+'" value="'+categoryVal+'">'+categoryTitle+'<span>제외하기</span></li>');

        //이미 선택된 카테고리의 val받기
        var choiceCategory = $('#choiceCategoryArea ul').children('#'+categoryVal+'').attr('value');

        //선택된 카테고리를 choiceCategoryArea에 li로 추가
        if(choiceCategory==categoryVal){
            //선택된 카테고리가 이미 필터에 추가된 경루 alert
            alert("이미 선택한 필터입니다~(✪‿✪)ノ");
        }else{
            //선택 필터영역에 추가 하기
            choiceCategoryArea.append(choiceCategoryFilter);
        }


        //선택된 필터 영역에서 선택된 필터를 눌렀을 경우
        $('#choiceCategoryArea ul li').click(function () {
            //요소 삭제
            $(this).remove();
        });

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