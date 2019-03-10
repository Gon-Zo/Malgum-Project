<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/template.css">
    <style>
        body{
            font-family: 'Noto Sans KR', sans-serif;
        }
        #wrap{
            position: relative;
            width: 1200px;
            min-height: 500px;
            margin: auto;
            /*box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);*/
            top:70px;

        }
        #logoArea{
            width: 350px;
            margin: auto;
            height: 150px;;
        }
        #logo{
            width:300px;
            height: 150px;
            cursor: pointer;
        }
        #loginWrap{
            position: relative;
            width:800px;
            height: 500px;

            margin: auto;
        }


        .userInfo{
            position: relative;
            width: 350px;
            height: 50px;
            display: block;
            left:200px;
            top:50px;
            outline: none;

        }
        label{
            position: absolute;
            left:200px;

        }
        #labelId{
            top:30px;
        }
        #id{
            border: none;
            border-bottom: 1px solid #424242;
        }
        #labelPwd{
            top:120px;
        }
        #pwd{
            top:90px;
            border: none;
            border-bottom: 1px solid #424242;
        }
        button {
            position: absolute;
            width: 350px;
            height: 50px;
            background-color: #283593;
            left: 200px;
            top: 220px;
            border: none;
            border-radius: 3px;
            color: #fff;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
            outline: none;
        }
        #register{
            top:290px;
            background-color: #fff;
            color: #000000;
            border: 1px solid #424242;
        }
        .find{
            position: absolute;
            left: 280px;
            top:360px;
            text-decoration: none;
            color: #9E9E9E;

        }
        .find:hover{
            color: #283593;
            text-decoration-line: underline;
        }
        #pwdFind{
            left:380px;
        }
       /* #findBox{
            position: relative;
            width:350px;
            background-color: aqua;
            margin: auto;
        }*/

    </style>
</head>
<body>
<div id="wrap">
    <a href="/index"><div id="logoArea"><img id="logo" src="/img/logo_1.png"/></div></a>
    <div id="loginWrap">
    <form action="/session" method="post">
    	<input type="hidden" name="referer" value="${referer }"/>
    	<fieldset>
        	<label for="id" class="screen_out" id="labelId">아이디</label>
        	<input type="text" placeholder="아이디" tabindex="1" accesskey="i" name="id" class="userInfo" id="id"  autocomplete="off">
        	<label for="pwd" class="screen_out" id="labelPwd">비밀번호</label>
        	<input type="password" accesskey="p" placeholder="비밀번호" name="pwd" tabindex="2"  class="userInfo" id="pwd"  autocomplete="off">
        	<button id="login" type="submit" tabindex="3" class="btn" accesskey="l">로그인</button>
    	</fieldset>
    </form>
        <button id="register" onclick="location.href='/join'" tabindex="4" accesskey="j" class="join">회원가입</button>
        <div id="findBox">
        <a href="" class="find" id="idFind">아이디 찾기</a>
        <a href="" class="find" id="pwdFind">비밀번호 찾기</a>
        </div><!-- #findBox end -->
    </div><!-- //#loginWrap end -->
</div><!-- #wrap end -->
</body>
</html>