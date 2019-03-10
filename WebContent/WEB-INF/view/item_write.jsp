<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/template.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/product_register.css" />
<title>제품등록</title>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<div id="wrap">
		<div id="titleBox">
			<h3>제품등록</h3>
		</div>
		<!--titleBox end-->
		<form id="registerForm" action="/write/success" method="POST">
			<!--  <input type="hidden" name="_method" value="PUT" /> -->
			<input type="hidden" name="userNo" value="${loginUser.no}" />
			<div id="brandBox">
				<h4>${loginUser.id}</h4>
			</div>
			<!--brandBox end-->
			<div id="infoBox">
				<div id="detailBox">
					<div id="inputWrap">
						<label class="detail_label">제품명</label> <input
							class="detail_input" placeholder="제품명을 입력해주세요" name="title">
						<label class="detail_label">가격</label> <input class="detail_input"
							placeholder="가격을 입력해주세요." name="price"> <label
							class="detail_label">용량</label> <input class="detail_input"
							placeholder="용량을 입력해주세요." name="volume">
					</div>
					<div id="ageWrap">
						<label class="ageAll">연령대</label> <label class="select_label"
							for="child">유아</label> <input class="screen_out" type="checkbox"
							id="child" name="age" value="K"> <label
							class="select_label" for="teenager">청소년</label> <input
							class="screen_out" type="checkbox" id="teenager" name="age"
							value="T"> <label class="select_label" for="adult">성인</label>
						<input class="screen_out" type="checkbox" id="adult" name="age"
							value="A"> <label class="select_label" for="middleAge">중년</label>
						<input class="screen_out" type="checkbox" id="middleAge"
							name="age" value="M"> <label class="select_label"
							for="allAge">전체</label> <input class="screen_out" type="checkbox"
							id="allAge" name="age" value="E">
					</div>
					<div id="genderWrap">
						<label class="ageAll">성별</label> <label class="select_label"
							for="man">남성용</label> <input class="screen_out" type="radio"
							name="gender" id="man" value="M"> <label
							class="select_label" for="woman">여성용</label> <input
							class="screen_out" type="radio" name="gender" id="woman"
							value="W">
					</div>
				</div>
				<!--detailBox end-->
				<div id="imageBox">
					<label>대표 이미지</label> <label class="plusImage" for="firstImage">
						<img src="/img/" id="representImg1" />
					</label> <input class="screen_out" type="file" id="firstImage"> <input
						type="hidden" name="img" id="imgName">
				</div>
				<!--imageBox end-->
			</div>
			<!--infoBox end-->
			<div id="categorizeBox">
				<label class="ageAll">분류</label> <select class="categorize_select"
					name="first">
					<option value="B">기초케어</option>
					<option value="M">메이크업</option>
					<option value="E">바디/케어/향수</option>
				</select> <select class="categorize_select" name="secondNo">
					<option value="1">스킨케어</option>
					<option value="2">선케어</option>
					<option value="3">클렌징</option>
					<option value="4">베이스</option>
					<option value="5">아이</option>
					<option value="6">립&치크</option>
					<option value="7">네일</option>
					<option value="8">바디케어</option>
					<option value="9">헤어케어</option>
					<option value="10">향수</option>
				</select>
			</div>
			<!--categorizeBox end-->
			<div id="typeBox">
				<label class="ageAll">타입별</label> <label class="select_label"
					for="dry">건성용</label> <input class="screen_out" type="radio"
					id="dry" name="skin" value="D"> <label class="select_label"
					for="neutral">중성용</label> <input class="screen_out" type="radio"
					id="neutral" name="skin" value="N"> <label
					class="select_label" for="oily">지성용</label> <input
					class="screen_out" type="radio" id="oily" name="skin" value="O">
				<label class="select_label" for="complex">복합성용</label> <input
					class="screen_out" type="radio" id="complex" name="skin" value="C">
				<label class="select_label" for="allSkin">모든피부용</label> <input
					class="screen_out" type="radio" id="allSkin" name="skin" value="E">
			</div>
			<!--typeBox end-->
			<div id="troubleBox">
				<label class="ageAll">고민별</label> <label class="select_label"
					for="trouble1">트러블</label> <input class="screen_out"
					type="checkbox" id="trouble1" name="probNo" value="1"> <label
					class="select_label" for="trouble2">안티에이징</label> <input
					class="screen_out" type="checkbox" id="trouble2" name="probNo"
					value="2"> <label class="select_label" for="trouble3">알레르기(아토피
					등)</label> <input class="screen_out" type="checkbox" id="trouble3"
					name="probNo" value="3">
			</div>
			<!--troubleBox end-->
			<div id="cautionBox">
				<label class="ageAll">주의성분</label> <label class="caution_label"
					for="caution1">디부틸하이드록시톨루엔 (DHT,BHT)</label> <input
					class="screen_out" type="checkbox" id="caution1" name="warnNo"
					value="1"> <label class="caution_label" for="caution2">미네랄오일</label>
				<input class="screen_out" type="checkbox" id="caution2"
					name="warnNo" value="2"> <label class="caution_label"
					for="caution3">부틸하이드록시아니솔 (BHA)</label> <input class="screen_out"
					type="checkbox" id="caution3" name="warnNo" value="3"> <label
					class="caution_label" for="caution4">소듐라우릴설페이트, 소듐라우레스설페이트</label>
				<input class="screen_out" type="checkbox" id="caution4"
					name="warnNo" value="4"> <label class="caution_label"
					for="caution5">소르빅애씨드 (소르빈산)</label> <input class="screen_out"
					type="checkbox" id="caution5" name="warnNo" value="5"> <label
					class="caution_label" for="caution6">부틸메톡시디벤조일메탄
					(아보벤젠,아보벤존)</label> <input class="screen_out" type="checkbox" id="caution6"
					name="warnNo" value="6"> <label class="caution_label"
					for="caution7">벤조페논-3 (옥시벤존)</label> <input class="screen_out"
					type="checkbox" id="caution7" name="warnNo" value="7"> <label
					class="caution_label" for="caution8">이미다졸리디닐우레아, 디아졸리디닐우레아,
					디엠디엠하이단토인</label> <input class="screen_out" type="checkbox" id="caution8"
					name="warnNo" value="8"> <label class="caution_label"
					for="caution9">0-사이멘-5올 (이소프로필메칠페놀)</label> <input
					class="screen_out" type="checkbox" id="caution9" name="warnNo"
					value="9"> <label class="caution_label" for="caution10">이소프로필알코올</label>
				<input class="screen_out" type="checkbox" id="caution10"
					name="warnNo" value="10">
				<div id="cautionBox2">
					<label class="caution_label" for="caution11">향료</label> <input
						class="screen_out" type="checkbox" id="caution11" name="warnNo"
						value="11"> <label class="caution_label" for="caution12">타몰</label>
					<input class="screen_out" type="checkbox" id="caution12"
						name="warnNo" value="12"> <label class="caution_label"
						for="caution13">트리에탄올아민 (TEA)</label> <input class="screen_out"
						type="checkbox" id="caution13" name="warnNo" value="13"> <label
						class="caution_label" for="caution14">트리이소프로판올아민</label> <input
						class="screen_out" type="checkbox" id="caution14" name="warnNo"
						value="14"> <label class="caution_label" for="caution15">트리클로산</label>
					<input class="screen_out" type="checkbox" id="caution15"
						name="warnNo" value="15"> <label class="caution_label"
						for="caution16">파라벤</label> <input class="screen_out"
						type="checkbox" id="caution16" name="warnNo" value="16"> <label
						class="caution_label" for="caution17">페녹시에탄올</label> <input
						class="screen_out" type="checkbox" id="caution17" name="warnNo"
						value="17"> <label class="caution_label" for="caution18">폴리에틸렌글라이콜
						(PEG)</label> <input class="screen_out" type="checkbox" id="caution18"
						name="warnNo" value="18"> <label class="caution_label"
						for="caution19">합성착색료</label> <input class="screen_out"
						type="checkbox" id="caution19" name="warnNo" value="19"> <label
						class="caution_label" for="caution20">호르몬류 </label> <input
						class="screen_out" type="checkbox" id="caution20" name="warnNo"
						value="20">
				</div>

			</div>
			<!--cautionBox end-->
			<div id="moreBox">
				<label class="ageAll">주성분표 사진</label> <label class="plusImage2"
					for="secondImage"> <img src="/img/" id="representImg2" />
				</label> 
				<input class="screen_out" type="file" id="secondImage"> 
				<input type="hidden" name="detailImg" id="detailName">
				<textarea class="noresize" placeholder="내용을 입력해주세요" name="content"></textarea>
			</div>
			<!--moreBox end-->
			<input type="submit" class="btn" value="등록"> <input
				type="button" class="btn" value="취소">
		</form>
	</div>
	<!--wrap end-->
	<c:import url="/WEB-INF/template/footer.jsp" />
	<script src="/js/jquery.js"></script>
	<script src="/js/template.js"></script>

	<script>
		$("#ageWrap>label").click(function() {
			$(".on").removeClass("on");
			$(this).addClass("on");
		});
		$("#genderWrap>label").click(function() {
			$(".on2").removeClass("on2");
			$(this).addClass("on2");
		});
		$("#typeBox>label").click(function() {
			$(".on3").removeClass("on3");
			$(this).addClass("on3");
		});
		$("#troubleBox>label").click(function() {
			$(this).toggleClass("on4");
		});
		$(".caution_label").click(function() {
			$(this).toggleClass("on5");
		})
		var num = 1;
		var pos = 0;

		/*배너 오른 버튼 클릭 이벤트*/
		$('#rightBtn').on(
				'click',
				function() {
					if (pos > -4800) {
						pos -= 1200;
						num = (num++) + 1;
					} else {
						pos = 0;
						num = 1;
					}
					/*move_on*/
					$(".move_on").removeClass("move_on");
					$('.bar_nav:nth-child(' + num + ')').children().addClass(
							'move_on');

					$('#bannerBox').css('transform',
							'translateX(' + pos + 'px)');
					$(".banner_on").removeClass("banner_on");
					$('.img_transition:nth-child(' + num + ')').addClass(
							'banner_on');
				});

		/*배너 왼쪽 버튼 클릭 이벤트*/
		$('#leftBtn').on(
				'click',
				function() {
					if (pos < 0) {
						pos += 1200;
						num = (num--) - 1;
					} else {
						pos = -4800;
						num = 5;
					}

					$('#bannerBox').css('transform',
							'translateX(' + pos + 'px)');

					/**/
					$(".move_on").removeClass("move_on");
					$('.bar_nav:nth-child(' + num + ')').children().addClass(
							'move_on');

					/**/
					$(".banner_on").removeClass("banner_on");
					$('.img_transition:nth-child(' + num + ')').addClass(
							'banner_on');
				});

		/* 배너 네비게이션*/
		$('.bar_nav').on('click', function() {
			num = ($(this).index() + 1);
			pos = -((num - 1) * 1200);

			$('#bannerBox').css('transform', 'translateX(' + pos + 'px)');

			$(".move_on").removeClass("move_on");
			$(this).children().addClass('move_on');

			$(".banner_on").removeClass("banner_on");
			$('.img_transition:nth-child(' + num + ')').addClass('banner_on');

		});

		/* 배너 자동롤링 기능*/
		var bannerCtrl;

		$(document).ready(function() {
			bannerCtrl = setInterval(moveBanner, 3500);
		});

		$('#bannerWrap').mouseout(function() {
			bannerCtrl = setInterval(moveBanner, 3500);
		});

		$('#bannerWrap').mouseover(function() {
			clearInterval(bannerCtrl);
		});

		/*배너 자동롤링 함수*/
		function moveBanner() {
			if (pos > -4800) {
				pos -= 1200;
				num = (num++) + 1;
			} else {
				pos = 0;
				num = 1;
			}
			$('#bannerBox').css('transform', 'translateX(' + pos + 'px)');

			$(".move_on").removeClass("move_on");
			$('.bar_nav:nth-child(' + num + ')').children().addClass('move_on');

			$(".banner_on").removeClass("banner_on");
			$('.img_transition:nth-child(' + num + ')').addClass('banner_on');
		}

		var $registerForm = $("#registerForm");
		var $firstImage = $("#firstImage");
		var $secondImage = $("#secondImage");
		var $imgName = $("#imgName");
		var $detailName = $("#detailName");
		var $representImg1 = $("#representImg1");
		var $representImg2 = $("#representImg2");
		var $imageBox = $("#imageBox");
		var $moreBox = $("#moreBox");
		var imgReg = /^image/;
		var oldImg = null;

		function checkDetail() {
			var secondIamge = $secondImage.get(0);
			var file2 = secondImage.files[0];

			if (file2 == null || file2.size <= 0) {

				alert("제대로된 파일을 넣어주세요.");

				return;
			}//if end

			if (!imgReg.test(file2.type)) {

				alert("이미지 파일을 선택해주세요.");

				return;
			}
			if (oldImg != file2.name) {

				oldImg = file2.name;

				//ajax로 넘길 폼을 생성하고
				var form = new FormData();

				//1)파라미터명, 2) 파일 3) 파일명
				form.append("uploadImg", file2, file2.name);

				//multipart/form-data로 ajax처리
				$.ajax({
					url : "/ajax/item/upload",
					dataType : "json",
					type : "POST",//multipart/form-data
					processData : false,//multipart/form-data
					contentType : false,//multipart/form-data
					data : form,
					error : function() {
						alert("사진 서버 점검중!");
					},
					success : function(json) {
						$representImg2.attr("src", "/img/item/" + file2.name);
						$detailName.val(file2.name);
					}//success end
				});//ajax() end
			}//if end
		}//checkDetail() end

		function checkImg() {

			//jquery객체에서 순수자바스크립트요소객체 얻기
			var firstImage = $firstImage.get(0);

			//input type=file요소(순수자바스크립트)는 무조건
			//files배열을 가지고 있습니다.

			//한 개의 파일
			var file1 = firstImage.files[0];

			//File 객체의 속성
			//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
			//- name : 파일명
			//- lastModified : 최종수정일
			//- size : 파일 크기

			if (file1 == null || file1.size <= 0) {

				alert("제대로된 파일을 넣어주세요.");

				return;
			}//if end

			//이미지인지 확인!!
			if (!imgReg.test(file1.type)) {

				alert("이미지 파일을 선택해주세요.");

				return;
			}

			if (oldImg != file1.name) {

				oldImg = file1.name;

				//ajax로 넘길 폼을 생성하고
				var form = new FormData();

				//1)파라미터명, 2) 파일 3) 파일명
				form.append("uploadImg", file1, file1.name);

				//multipart/form-data로 ajax처리
				$.ajax({
					url : "/ajax/item/upload",
					dataType : "json",
					type : "POST",//multipart/form-data
					processData : false,//multipart/form-data
					contentType : false,//multipart/form-data
					data : form,
					error : function() {
						alert("사진 서버 점검중!");
					},
					success : function(json) {
						$representImg1.attr("src", "/img/item/" + file1.name);
						$imgName.val(file1.name);
					}//success end
				});//ajax() end
			}//if end
		}//checkProfile() end

		//profile사진이 변경되면
		$firstImage.change(checkImg);//change() end
		$secondImage.change(checkDetail);//change() end

		$registerForm.submit(function() {
			checkImg();
			checkDetail();
		}); //submit() end
	</script>
</body>
</html>