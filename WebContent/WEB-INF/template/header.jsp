<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div id="header">
    <div id="aux">
        <div id="logo">
            <a href="/index"> <img src="/img/logo_1.png" width="150px"></a>

        </div><!--#logo end -->

        <ul class="menu">

            <li class="nav_menu"><a href="/items">제품</a></li>
            <li class="nav_menu"><a href="/reviews">리뷰</a></li>
            <li class="nav_menu"><a href="/events">이벤트</a></li>
        </ul>

        <a href="/search/items"><div id="searchBtn"><span>뷰티 정보 찾아보기</span> <i class="fas fa-search"></i></div></a>

        <div id="userBox">
        <c:choose>
        <c:when test="${loginUser==null }">
            <a id="loginBtn" href="/login">로그인</a>
            <a id="joinBtn" href="/join">회원가입</a>
        </c:when>
        <c:otherwise>
            <a href="/mypage/${loginUser.id}">
                <div class="login_user_area">
                	<c:choose>
                	<c:when test="${loginUser.img==null }">
                    <span title="마이페이지로 가기">${loginUser.name.substring(0,1) }</span>
                    </c:when>
                    <c:otherwise>
                    <!--프로필 사진없으면 span 노출-->
                    <img class="profile_img" src="/img/profile/thumbnail/${loginUser.img }" title="마이페이지로 가기" alt="${loginUser.id }"/>
                	</c:otherwise>
                	</c:choose>
                </div>
            </a>
            <form action="/session" method="POST">
            <input type="hidden" name="_method" value="DELETE" />
            <button id="logoutBtn" title="로그아웃"><i class="fas fa-door-open"></i></button>
            </form>
        </c:otherwise>    
        </c:choose>
        </div><!-- #userBox end -->
       
    </div>
    <!--#aux end-->

    <!--.menu end-->
</div>
