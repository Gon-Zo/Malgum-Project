<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택</title>
    <link rel="stylesheet" href="/css/template.css">
<c:import url="/WEB-INF/template/link.jsp"></c:import>
    <style>
        body{
            font-family: 'Noto Sans KR', sans-serif;
        }
        #wrap{
            position: relative;
            width: 1200px;
            min-height: 500px;
            top:70px;
            margin: auto;
        }
        #logo{
            position: relative;
            width:300px;
            height: 150px;
            left:450px;
            cursor: pointer;
        }
        #registerWrap{
            position: relative;
        }
        .register{
            position: absolute;
            font-size: 30px;
            top:50px;
            width:250px;
            height: 250px;
            color: #fff;
            text-align: center;
            line-height: 250px;
            cursor: pointer;

            border-radius: 5px;
            transition: .3s ease;
        }
        #normal{
            background-color: #283593;
            left:300px;
        }
        #company{
            background-color: #BBDEFA;
            right: 300px;
        }

        #company:hover,#normal:hover{
            background-color: #fff;
            color: #283593;
            border: 1px solid #9E9E9E;

        }

    </style>
</head>
<body>
<div id="wrap">
    <a href="/index"><img id="logo" src="/img/logo_1.png"/></a>
    <div id="registerWrap">
    <a href="/user/join"><div id="normal" class="register">일반회원 가입</div></a>
    <a href="/company/join"> <div id="company" class="register">기업회원 가입</div></a>
    </div>
</div>
</body>
</html>