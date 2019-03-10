<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/mypage.css">
</head>
<body>
<h1 hidden>Mypage</h1>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<div id="contents">
<c:choose>
<c:when test="${loginUser.type=='C' }">
<div class="corporation mypage_area">
    <div class="profile_area">
    
        <a class="profile_set_btn" href="/company/update" title="프로필 정보수정하기"><i class="fas fa-cog"></i></a>

        <div class="profile_img_area">
        
        <c:choose>
        <c:when test="${loginUser.img==null }">
        <span>${loginUser.name.substring(0,1) }</span>
        </c:when>
        <c:otherwise>
        <!--프로필 사진없으면 span 노출-->
        <img class="profile_img" src="/img/profile/thumbnail/${loginUser.img }" alt="${loginUser.id }"/>
        </c:otherwise>
        </c:choose>
        
        </div><!-- //.profile_img_area end -->
        
        <ul class="corporation profile_info">
            <li>기업명: ${loginUser.company }</li>
            <li>브랜드명: ${loginUser.brand }</li>
            <li>
                <div class="cs icon"></div>
                <span class="corporation_numder"> ${loginUser.tel }</span>
                <div class="site icon"></div>
                <span class="corporation_site" > ${loginUser.link }</span>
            </li>
        </ul>

    </div><!-- //.profile_area end -->

    <div class="btn_area"><a class="product_management btn" href="/items/${loginUser.id }"><span>제품 관리</span></a></div>
    <div class="btn_area"><a class="event_management btn" href="/events/${loginUser.id }"><span>이벤트 관리</span></a></div>
</div><!-- .corporation mypage_area end -->
</c:when>
<c:otherwise>
<div class="user mypage_area">
    <div class="profile_area">
    
        <a class="profile_set_btn" href="/user/update" title="프로필 정보수정하기"><i class="fas fa-cog"></i></a>

        <div class="profile_img_area">
        
        <c:choose>
        <c:when test="${loginUser.img==null }">
        <span>${loginUser.name.substring(0,1) }</span>
        </c:when>
        <c:otherwise>
        <!--프로필 사진없으면 span 노출-->
        <img class="profile_img" src="/img/profile/thumbnail/${loginUser.img }" alt="${loginUser.id }"/>
        </c:otherwise>
        </c:choose>
                	
       </div><!-- //.profile_img_area end -->
        </a>
        <ul class="user profile_info">
            <li>이름: ${loginUser.name }</li>
            <li>성별: <c:choose><c:when test="${loginUser.gender=='W' }">여성</c:when><c:otherwise>남성</c:otherwise></c:choose></li>
            <li>생년월일: ${loginUser.birth }</li>
            <li>피부타입: <c:choose><c:when test="${loginUser.type=='C' }">복합성</c:when><c:when test="${loginUser.type=='O' }">지성</c:when><c:when test="${loginUser.type=='N' }">중성</c:when><c:otherwise>건성</c:otherwise></c:choose></li>
            <li>피부고민: 
            <c:forEach items="${proTypes }" var="probType">
            <span>${probType.title }</span>
            </c:forEach> </li>
        </ul>
    </div>
    <!--profile_area-->

    <div class="btn_area"><a class="my_pouch btn" href="/items/${loginUser.id }"><span>나의 파우치</span></a></div>
    <div class="btn_area"><a class="my_review btn" href="/reviews/${loginUser.id }"><span>내가 쓴 리뷰보기</span></a></div>
</div><!-- //.user mypage_area end -->
</c:otherwise>
</c:choose>
</div><!-- //#contents end -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="/js/template.js"></script>
</body>
</html>