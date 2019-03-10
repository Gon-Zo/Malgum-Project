<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입페이지입니다</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/corporationJoin.css">
</head>
<body>
	<div id="logoWrap">
		<a id="goIndex" href="/"><img src="/img/logo_1.png"
			alt="맗음" /></a>
	</div>
	<!--//logoWrap end-->
	<div id="wrap">
		<form method="post" action="/company/join" id="formWrap" autocomplete="off">

			<div class="wrap_input">
				<label for="id" class="">아이디</label>
				<div class="box_input">
					<input id="id" type="text" name="id" />
				</div>
				<!--//box_input end-->
				<div class="wrap_msg id"></div>
				<!--//wrap_msg end-->
			</div>
			<!--//wrap_input end-->

			<div class="wrap_input">
				<label for="password">비밀번호</label>
				<div class="box_input">
					<input id="password" type="password" name="pwd" />
					<div id="pwdIcon" class="icon_check fas fa-lock"></div>
					<!--//ckeckIcon end-->
				</div>
				<!--//box_input end-->
				<div class="wrap_msg pwd"></div>
				<!--//wrap_msg end-->
			</div>
			<!--//wrap_input end-->
			<div class="wrap_input">
				<label for="checkPwd">비밀번호 확인</label>
				<div class="box_input">
					<input id="checkPwd" type="password" />
					<!--//checkPwd end-->
					<div id="ckeckIcon" class="icon_check fas fa-check-square"></div>
					<!--//ckeckIcon end-->
				</div>
				<!--//box_input end-->
				<div id="checkPwdMsg" class="wrap_msg check_pwd"></div>
				<!--//wrap_msg end-->
			</div>
			<!--//wrap_input end-->

			<div class="wrap_input">
				<label for="company">기업명</label>
				<div class="box_input">
					<input id="company" type="text" name="company" />
				</div>
				<!--//box_input end-->
				<div class="wrap_msg company"></div>
				<!--//wrap_msg end-->
			</div>
			<!--//wrap_input end-->

			<div class="wrap_input">
				<label for="brand">브랜드명</label>
				<div class="box_input">
					<input id="brand" type="text" name="brand" />
				</div>
				<!--//box_input end-->
				<div class="wrap_msg brand"></div>
				<!--//wrap_msg end-->
			</div>
			<!--//wrap_input end-->

			<div class="wrap_input">
				<label for="companyNumber">회사대표 번호</label>
				<div class="box_input">
					<input id="companyNumber" type="text" name="tel" />
				</div>
				<!--//box_input end-->
				<div class="wrap_msg company_tel"></div>
				<!--//wrap_msg end-->
			</div>
			<!--//wrap_input end-->

			<div class="wrap_input">
				<label for="companyAddress">회사 홈페이지</label>
				<div class="box_input">
					<input id="companyAddress" type="text" name="link" />
				</div>
				<!--//box_input end-->
				<div class="wrap_msg address"></div>
				<!--//wrap_msg end-->
			</div>
			<!--//wrap_input end-->

			<div class="wrap_input">
				<label for="businessNumber">사업자 번호</label>
				<div class="box_input">
					<input id="businessNumber" type="text" name="buisnessNum" />
				</div>
				<!--//box_input end-->
				<div class="wrap_msg number"></div>
				<!--//wrap_msg end-->
			</div>
			<!--//wrap_input end-->

			<div id="companyWrap">
				<label>사업자 등록증</label> <label id="businessPhotoBox"
					for="businessPhoto"><i class="fas fa-plus"></i></label> <input
					id="businessPhoto" type="file" name="companyAddress" /> <input
					id="businessPhotoName" type="hidden" name="buisnessImg">
				<img id="businessImg" />
				<button type="button" class="delete fas fa-times"></button>
				<div class="wrap_msg company_img"></div>
				<!--//wrap_msg end-->
			</div>
			<!--//wrap_input end-->

			<div id="profileWrap">
				<label>브랜드 이미지</label> <label id="profileImgBox" for="fileUpload"></label>
				<input id="fileUpload" type="file" /> <input id="profile"
					type="hidden" name="img"> <img id="profileImg"/>
					<button type="button" class="delete fas fa-times"></button>
				<div class="wrap_msg brand_img"></div>
				<!--//wrap_msg end-->
			</div>
			<!--//profileWrap end-->

			<div id="buttonWrap">
				<button class="btn_style" type="button">취소</button>
				<button class="btn_style" type="submit">등록</button>
			</div>
			<!--//buttonWrap end-->

		</form>
		<!--//form end-->
	</div>
	<!--//contents end-->

	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	<script>
		//form
		var $joinForm = $("#formWrap");

		//아이디가 첫글자는 영어로, 영어와 숫자로 4~20글자까지라면
		var idReg = /^[a-z|A-Z][\w]{3,19}$/;
		//비밀번호가 4~32자로 영어, 숫자
		var pwdReg = /^[\w]{4,32}$/;
		//image인지 확인하는 정규표현식
		var profileReg = /^image/;
		
		var companyReg = /^image/;
		
		var brandReg = /^[ㄱ-힣|\w]{1,20}$/;
		
		var telReg = /^\d{2,3}-\d{3,4}-\d{4}$/;
		
		var linkReg=/^(((http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/;


		var numReg=/^\d{3}-\d{2}-\d{5}$/;
		
		//id
		var $id = $("#id");
		//id msg
		var $idMsg = $(".wrap_msg.id");

		//pwd
		var $pwd = $("#password");
		//pwd msg
		var $pwdMsg = $(".wrap_msg.pwd");

		//confirm
		var $confirm = $("#checkPwd");
		//confirm msg
		var $confirmMsg = $(".wrap_msg.check_pwd");

		var $company = $("#company");

		var $companyMsg = $(".wrap_msg.company");

		var $brand = $("#brand");

		var $brandMsg = $(".wrap_msg.brand");

		var $companyTel = $("#companyNumber");

		var $companyTelMsg = $(".wrap_msg.company_tel");

		var $companyAddress = $("#companyAddress");

		var $companyAddressMsg = $(".wrap_msg.address");

		var $businessNumeber = $("#businessNumber");

		var $businessNumberMsg = $(".wrap_msg.number");

		var $profileImg = $("#profileImg");
		var $profileName = $("#profile");
		var $profileMsg = $(".wrap_msg.brand_img");
		var $profile = $("#fileUpload");
		var $profileImgBox = $("#profileImgBox");
		

		var $companyImgBox = $("#businessPhotoBox");
		var $companyImg = $("#businessImg");
		var $companyName = $("#businessPhotoName");
		var $companyMsg = $(".wrap_msg.company_img");
		var $company = $("#businessPhoto");

		var $input = $('input');

		/*input css and 필수항목 확인 하는 함수*/
		$input.focus(function() {
			$('.box_input_focus').removeClass('box_input_focus');
			$(this).parent('.box_input').addClass('box_input_focus');
			var inputVal = $(this).val();
			if (inputVal.length != 0) {
				$(this).parent('.box_input').next().text(' ');
			} else {
				$(this).parent('.box_input').next().text('필수항목 입니다.');
			}
		});

		$input.keyup(function() {
			var inputVal = $(this).val();
			$(this).parent('.box_input').next().text('필수항목 입니다.');
			$(this).parent('.box_input').addClass('box_input_fail');
			if (inputVal.length != 0) {
				$('.box_input_fail').removeClass('box_input_fail');
				$(this).parent('.box_input').next().text(' ');
			}
		});

		//유저가 이전에 입력한 값(ajax경우 중복 요청을 막기 위해서)
		var oldId = null;
		var oldProfile = null;
		var oldBrand = null;
		var oldBusiness = null;
		var oldCompanyTel=null;
		var oldLink=null;
		var oldBusinessNumeber=null;

		//유효성검사가 되었는지 확인하는 변수
		var isValidId = false;
		var isValidPwd = false;
		var isConfirmPwd = false;
		var isValidBrand = false;
		var isValidCompanyTel = false;
		var isValidLink = false;
		var isValidBusinessNumeber = false;

		/*유효성검사 함수들 */

		//아이디 유효성검사용 함수
		function checkId() {

			//유저가 입력한 값을 얻어옴
			var value = $id.val();

			//이전 글자와 현재 글자가 같지 않을때만
			if (oldId != value) {
				//현재 글자를 이전글자로 업데이트
				oldId = value;

				if (idReg.test(value)) {

					//체크를 다시 시작하니까 무조건 false로
					isValidId = false;

					//ajax작동시작
					$idMsg.removeClass("ok").text("확인중...");

					$.ajax({
						url : "/ajax/user/id",
						dataType : "json",
						data : {
							"id" : value
						},
						error : function() {

							alert("서버 점검중!");

						},
						success : function(json) {

							if (json.result) {
								isValidId = true;
								$idMsg.addClass("ok").text("좋은 아이디입니다.");
							} else {
								isValidId = false;
								$idMsg.removeClass("ok").text(
										"이미 사용중이거나 탈퇴한 아이디입니다.");
							}//if~else end

						}//success end
					});//$.ajax() end

				} else {
					$idMsg.removeClass("ok").text(
							"첫글자를 영어로, 영어,숫자 4~20글자로 입력해주세요.");
				}//if~else end

			}//if end

		}//checkId end

		$id.keyup(checkId).blur(checkId).focus();//id에 포커스 지정

		//비밀번호 유효성검사하는 함수
		function checkPwd() {

			if (pwdReg.test($pwd.val())) {
				$pwdMsg.addClass("ok").text("좋은 비밀번호입니다.");
				isValidPwd = true;
			} else {
				$pwdMsg.removeClass("ok").text("영어,숫자 4~32글자로 입력해주세요.");
				isValidPwd = false;
			}//if~else end

			checkConfirmPwd();

		}//checkPwd() end

		$pwd.keyup(checkPwd);

		function checkConfirmPwd() {

			var value = $confirm.val();

			if (value.length != 0 && value == $pwd.val()) {
				isConfirmPwd = true;
				$confirmMsg.addClass("ok").text("비밀번호와 일치합니다.");
			} else {
				isConfirmPwd = false;
				$confirmMsg.removeClass("ok").text("비밀번호와 동일하게 입력해주세요.");
				//$confirm.val("").focus();
			}//if else end

		}//checkConfirmPwd() end

		$confirm.keyup(checkConfirmPwd);
		
		function checkBrand() {

			//유저가 입력한 값을 얻어옴
			var value = $brand.val();

			//이전 글자와 현재 글자가 같지 않을때만
			if (oldBrand != value) {
				//현재 글자를 이전글자로 업데이트
				oldBrand = value;

				if (brandReg.test(value)) {

					//체크를 다시 시작하니까 무조건 false로
					isValidBrand = false;

					//ajax작동시작
					$brandMsg.removeClass("ok").text("확인중...");

					$.ajax({
						url : "/ajax/user/brand",
						dataType : "json",
						data : {
							"brand" : value
						},
						error : function() {

							alert("서버 점검중!");

						},
						success : function(json) {

							if (json.result) {
								isValidBrand = true;
								$brandMsg.addClass("ok").text("좋은 브랜드명입니다.");
							} else {
								isValidBrand = false;
								$brandMsg.removeClass("ok").text(
										"이미 사용중인 브랜드입니다.");
							}//if~else end

						}//success end
					});//$.ajax() end

				} else {
					$brandMsg.removeClass("ok").text(
							"20글자내로 입력해주세요.");
				}//if~else end

			}//if end

		}//checkId end
		
		$brand.keyup(checkBrand).blur(checkBrand).focus();//id에 포커스 지정
		
		function checkTel() {

			//유저가 입력한 값을 얻어옴
			var value = $companyTel.val();

			//이전 글자와 현재 글자가 같지 않을때만
			if (oldCompanyTel != value) {
				//현재 글자를 이전글자로 업데이트
				oldCompanyTel = value;

				if (telReg.test(value)) {

					//체크를 다시 시작하니까 무조건 false로
					isValidCompanyTel = false;

					//ajax작동시작
					$companyTelMsg.removeClass("ok").text("확인중...");

					$.ajax({
						url : "/ajax/user/tel",
						dataType : "json",
						data : {
							"tel" : value
						},
						error : function() {

							alert("서버 점검중!");

						},
						success : function(json) {

							if (json.result) {
								isValidCompanyTel = true;
								$companyTelMsg.addClass("ok").text("알맞은 번호입니다.");
							} else {
								isValidCompanyTel = false;
								$companyTelMsg.removeClass("ok").text(
										"이미 사용중인 번호입니다.");
							}//if~else end

						}//success end
					});//$.ajax() end

				} else {
					$companyTelMsg.removeClass("ok").text(
							"전화번호 양식에 맞춰 써주세요(00-000-0000).");
				}//if~else end

			}//if end

		}//checkId end

		$companyTel.keyup(checkTel).blur(checkTel).focus();//id에 포커스 지정
		
		function checkLink() {

			//유저가 입력한 값을 얻어옴
			var value = $companyAddress.val();

			//이전 글자와 현재 글자가 같지 않을때만
			if (oldLink != value) {
				//현재 글자를 이전글자로 업데이트
				oldLink = value;

				if (linkReg.test(value)) {

					//체크를 다시 시작하니까 무조건 false로
					isValidLink = false;

					//ajax작동시작
					$companyAddressMsg.removeClass("ok").text("확인중...");

					$.ajax({
						url : "/ajax/user/link",
						dataType : "json",
						data : {
							"link" : value
						},
						error : function() {

							alert("서버 점검중!");

						},
						success : function(json) {

							if (json.result) {
								isValidLink = true;
								$companyAddressMsg.addClass("ok").text("알맞은 홈페이지입니다.");
							} else {
								isValidLink = false;
								$companyAddressMsg.removeClass("ok").text(
										"이미 사용중인 홈페이지입니다.");
							}//if~else end

						}//success end
					});//$.ajax() end

				} else {
					$companyAddressMsg.removeClass("ok").text(
							"알맞게 입력해주세요.");
				}//if~else end

			}//if end

		}//checkId end

		$companyAddress.keyup(checkLink).blur(checkLink).focus();//id에 포커스 지정
		
		function checkNum() {

			//유저가 입력한 값을 얻어옴
			var value = $businessNumeber.val();

			//이전 글자와 현재 글자가 같지 않을때만
			if (oldBusinessNumeber != value) {
				//현재 글자를 이전글자로 업데이트
				oldBusinessNumeber = value;

				if (numReg.test(value)) {

					//체크를 다시 시작하니까 무조건 false로
					isValidBusinessNumeber = false;

					//ajax작동시작
					$businessNumberMsg.removeClass("ok").text("확인중...");

					$.ajax({
						url : "/ajax/user/businessnum",
						dataType : "json",
						data : {
							"businessnum" : value
						},
						error : function() {

							alert("서버 점검중!");

						},
						success : function(json) {

							if (json.result) {
								isValidBusinessNumeber = true;
								$businessNumberMsg.addClass("ok").text("알맞은 번호입니다.");
							} else {
								isValidBusinessNumeber = false;
								$businessNumberMsg.removeClass("ok").text(
										"이미 존재하는 번호입니다.");
							}//if~else end

						}//success end
					});//$.ajax() end

				} else {
					$businessNumberMsg.removeClass("ok").text(
							"사업자 번호 양식을 맞춰 작성해주세요.");
				}//if~else end

			}//if end

		}//checkId end

		$businessNumeber.keyup(checkNum).blur(checkNum).focus();//id에 포커스 지정

		function checkProfile() {

			//jquery객체에서 순수자바스크립트요소객체 얻기
			var profile = $profile.get(0);

			//input type=file요소(순수자바스크립트)는 무조건
			//files배열을 가지고 있습니다.

			//한 개의 파일
			var file = profile.files[0];

			//File 객체의 속성
			//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
			//- name : 파일명
			//- lastModified : 최종수정일
			//- size : 파일 크기

			if (file == null || file.size <= 0) {

				$profileMsg.removeClass("ok").text("제대로 된 파일을 선택해주세요.");

				return;
			}//if end

			//이미지인지 확인!!
			if (!profileReg.test(file.type)) {

				$profileMsg.removeClass("ok").text("이미지 파일을 선택해주세요.");

				return;
			} else {

				$profileMsg.text("");

			}//if~else end

			if (oldProfile != file.name) {

				oldProfile = file.name;

				//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
				//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.

				//ajax로 넘길 폼을 생성하고
				var form = new FormData();

				//우리가 선택한 파일을 붙임
				form.append("type", "P");//일반적인 데이터

				//1)파라미터명, 2) 파일 3) 파일명
				form.append("uploadImg", file, file.name);

				//multipart/form-data로 ajax처리
				$.ajax({
					url : "/ajax/upload",
					dataType : "json",
					type : "POST",//multipart/form-data
					processData : false,//multipart/form-data
					contentType : false,//multipart/form-data
					data : form,
					error : function() {
						alert("사진 서버 점검중!");
					},
					success : function(json) {
						$profileImg.attr("src",json.src);
						$profileName.val(json.src);
						$profileImgBox.hide();
						//$(".delete").show();
						
						
					}//success end

				});//ajax() end

			}//if end

		}//checkProfile() end
		
		
		$(".delete").click(function() {
			
			alert('test');
			/* $profile.val("");
			$profileName.val("");
			$("#profileWrap").addClass("no_image");
			$(".delete").hide();
			$profileImgBox.show() */
		});//click() end
		
		$profile.change(checkProfile);//change() end
		
		function checkCompany() {

			//jquery객체에서 순수자바스크립트요소객체 얻기
			var company = $company.get(0);

			//input type=file요소(순수자바스크립트)는 무조건
			//files배열을 가지고 있습니다.

			//한 개의 파일
			var file = company.files[0];

			//File 객체의 속성
			//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
			//- name : 파일명
			//- lastModified : 최종수정일
			//- size : 파일 크기

			if (file == null || file.size <= 0) {

				$companyMsg.removeClass("ok").text("제대로 된 파일을 선택해주세요.");

				return;
			}//if end

			//이미지인지 확인!!
			if (!companyReg.test(file.type)) {

				$companyMsg.removeClass("ok").text("이미지 파일을 선택해주세요.");

				return;
			} else {

				$companyMsg.text("");

			}//if~else end

			if (oldBusiness != file.name) {

				oldBusiness = file.name;

				//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
				//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.

				//ajax로 넘길 폼을 생성하고
				var form = new FormData();

				//우리가 선택한 파일을 붙임
				form.append("type", "P");//일반적인 데이터

				//1)파라미터명, 2) 파일 3) 파일명
				form.append("uploadImg", file, file.name);

				//multipart/form-data로 ajax처리
				$.ajax({
					url : "/ajax/upload",
					dataType : "json",
					type : "POST",//multipart/form-data
					processData : false,//multipart/form-data
					contentType : false,//multipart/form-data
					data : form,
					error : function() {
						alert("사진 서버 점검중!");
					},
					success : function(json) {
						$companyImg.attr("src", json.src);
						$companyName.val(json.src);
						$companyImgBox.hide();
						//$companyBox.removeClass("no_image");

					}//success end

				});//ajax() end

			}//if end

		}//checkProfile() end

		$company.change(checkCompany);//change() end

 
 		
 	
		$joinForm.submit(function() {

			checkPwd();
			checkProfile();
			checkBrand();
			checkTel();
			checkLink();
			checkNum();
			checkCompany();

			if (!isValidId || !isValidPwd || !isConfirmPwd || !isValidBrand|| !isValidCompanyTel
					|| !isValidLink|| !isValidBusinessNumeber) {
				//console.log("서브밋 안됨");
				return false;
			}//if end

		});//submit() end
	</script>

</body>
</html>