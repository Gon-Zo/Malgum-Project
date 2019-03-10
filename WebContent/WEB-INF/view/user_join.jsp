<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
<c:when test="${user==null}">
<title>일반 회원가입</title>
</c:when>
<c:otherwise>
<title>${loginUser.name }님 회원정보 수정</title>
</c:otherwise>
</c:choose>

<c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/userJoin.css">
</head>
<body>
<div id="logoWrap">
    <a id="goIndex" href="/index"><img src="/img/logo_1.png" alt="맑음"/></a>
</div><!--//logoWrap end-->
<div id="contents">
    <form method="post" action="/user/join" id="formWrap" autocomplete="off">
		<input type="hidden" id="profileName" name="profile" />
		<!-- 
			인풋의 name이 벌스 다 하지만 vo에 birth 가 있다
			넘길때 우리는 유저객체로 넘긴다.
			근데 자동으로 셋팅이 된다
			이것을 주석을 풀면 이것이 들어가서 충돌이 된다
		 -->
		<!-- <input type="hidden" id="birthDate" name="birth" /> -->

        <div class="wrap_input">
            <label for="id" class="">아이디</label>
            <div class="box_input">
                <input <c:if test="${loginUser!=null }">disabled value="${loginUser.id }"</c:if> id="id" type="text" name="id" autocomplete="off" placeholder="영어, 숫자로 4~20자 입력" title="영어, 숫자로 4~20자 입력"/>
            </div><!--//box_input end-->
            <div class="wrap_msg id"></div><!--//wrap_msg end-->
        </div><!--//wrap_input end-->

        <div class="wrap_input">
            <label for="password">비밀번호<c:if test="${loginUser!=null }"> 수정</c:if></label>
            <div class="box_input">
                <input <c:if test="${loginUser!=null }">value="${loginUser.pwd }"</c:if> id="password" autocomplete="off" type="password" name="pwd" placeholder="4~32자로 입력" title="4~32자로 입력"/>
                <div id="pwdIcon" class="icon_check fas fa-lock"></div><!--//ckeckIcon end-->
            </div><!--//box_input end-->
            <div class="wrap_msg pwd"></div><!--//wrap_msg end-->
        </div><!--//wrap_input end-->
        
        <div class="wrap_input">
            <label for="checkPwd">비밀번호 확인</label>
            <div class="box_input">
                <input id="checkPwd" autocomplete="off" type="password" placeholder="위와 동일하게 입력" title="위와 동일하게 입력"/><!--//checkPwd end-->
                <div id="ckeckIcon" class="icon_check fas fa-check-square"></div><!--//ckeckIcon end-->
            </div><!--//box_input end-->
            <div id="checkPwdMsg" class="wrap_msg check_pwd"></div><!--//wrap_msg end-->
        </div><!--//wrap_input end-->

        <div class="wrap_input">
            <label for="userInput">이름</label>
            <div class="box_input">
                <input <c:if test="${loginUser!=null }">disabled value="${loginUser.name }"</c:if> id="userInput" type="text" name="name" placeholder="성, 이름 순으로 입력하세요 ex) 홍길동" title="이름을 입력하세요"/>
            </div><!--//box_input end-->
            <div class="wrap_msg"></div><!--//wrap_msg end-->
        </div><!--//wrap_input end-->

        <div class="wrap_input">
            <label>생년월일</label>
            <div id="birthDate">
                <select class="birth" id="year" name="year" value="2011"></select>
                <em class="birthEm">년</em>
                <select class="birth" id="month" name="month"></select>
                <em class="birthEm">월</em>
                <select class="birth" id="date" name="date"></select>
                <em class="birthEm">일</em>
               <!-- <input id="birthInput" type="text" name="brand"/>-->
            </div><!--//box_input end-->
            <div class="wrap_msg birth"></div><!--//wrap_msg end-->
        </div><!--//wrap_input end-->

        <div class="wrap_input">
            <label>성별</label>
            <div class="radioBox">
                <div class="box_radio">
                    <input <c:if test="${loginUser.gender=='M' }">checked </c:if><c:if test="${loginUser!=null}">disabled</c:if> type="radio" name="gender" value="M" id="man"/>
                    <div class="btn_radio">
                        <div class="checkd_radio <c:if test="${loginUser.gender=='M' }">radio_checking</c:if>"></div>
                    </div><!--//btn_radio end-->
                    <label class="title_radio" for="man">남자</label><!--//title_radio end-->
                </div><!--//box_radio end-->
                <div class="box_radio">
                    <input <c:if test="${loginUser.gender=='W' }">checked</c:if><c:if test="${loginUser!=null}">disabled</c:if> type="radio" name="gender" value="W" id="woman"/>
                    <div class="btn_radio">
                        <div class="checkd_radio <c:if test="${loginUser.gender=='W' }">radio_checking</c:if>"></div>
                    </div><!--//btn_radio end-->
                    <label class="title_radio" for="woman">여자</label><!--//title_radio end-->
                </div><!--//box_radio end-->
            </div><!--//radioBox end-->
            <div class="wrap_msg gender"></div><!--//wrap_msg end-->
        </div><!--//wrap_input end-->

         <div class="wrap_input">
            <label>피부타입</label>
            <div class="radioBox">
                <div class="box_radio">
                    <input <c:if test="${loginUser.skin=='D' }">checked</c:if> type="radio" name="skin" value="D" id="dry"/>
                    <div class="btn_radio2">
                        <div class="checkd_radio <c:if test="${loginUser.skin=='D' }">radio_checking2</c:if>"></div>
                    </div><!--//btn_radio end-->
                    <label class="title_radio2" for="dry">건성</label><!--//title_radio end-->
                </div><!--//box_radio end-->
                <div class="box_radio">
                    <input <c:if test="${loginUser.skin=='O' }">checked</c:if> type="radio" name="skin" value="O" id="oily"/>
                    <div class="btn_radio2">
                        <div class="checkd_radio <c:if test="${loginUser.skin=='O' }">radio_checking2</c:if>"></div>
                    </div><!--//btn_radio end-->
                    <label class="title_radio2" for="oily">지성</label><!--//title_radio end-->
                </div><!--//box_radio end-->
            	<div class="box_radio">
                	<input <c:if test="${loginUser.skin=='N' }">checked</c:if> type="radio" name="skin" value="N" id="neutral"/>
                	<div class="btn_radio2">
                    <div class="checkd_radio <c:if test="${loginUser.skin=='N' }">radio_checking2</c:if>"></div>
                	</div><!--//btn_radio end-->
                	<label class="title_radio2" for="neutral">중성</label><!--//title_radio end-->
            	</div><!--//box_radio end-->
		        <div class="box_radio">
        		    <input <c:if test="${loginUser.skin=='C' }">checked</c:if> type="radio" name="skin" value="C" id="complex"/>
            		<div class="btn_radio2">
                	<div class="checkd_radio <c:if test="${loginUser.skin=='C' }">radio_checking2</c:if>"></div>
            		</div><!--//btn_radio end-->
            		<label class="title_radio2" for="complex">복합성</label><!--//title_radio end-->
        		</div><!--//box_radio end-->
        	</div><!--//radioBox end-->
            <div class="wrap_msg type"></div><!--//wrap_msg end-->
        </div><!--//wrap_input end-->

          <div class="wrap_input">
            <label>피부고민</label>
            <div id="checkboxBox">
                <div class="box_checkbox">
                    <input <c:if test="${loginUser!=null&&loginUser.oneWorry!=0 }">checked</c:if> type="checkbox" id="oneWorry" value="1" name="typies"/>
                    <label class="btn_checkbox" for="oneWorry">
                        <div class="checkd_checkbox <c:if test="${loginUser!=null&&loginUser.oneWorry!=0 }">checkbox_checking</c:if>"></div>
                    </label>
                    <label class="title_checkbox" for="oneWorry">알레르기(아토피 등)</label>
                </div>
                <div class="box_checkbox">
                    <input <c:if test="${loginUser!=null&&loginUser.tweWorry!=0 }">checked</c:if> type="checkbox" id="tweWorry" value="2" name="typies"/>
                    <label class="btn_checkbox" for="tweWorry">
                        <div class="checkd_checkbox <c:if test="${loginUser!=null&&loginUser.tweWorry!=0 }">checkbox_checking</c:if>" for="tweWorry"></div>
                    </label>
                    <label class="title_checkbox" for="tweWorry">안티에이징</label>
                </div>
                <div class="box_checkbox">
                    <input <c:if test="${loginUser!=null&&loginUser.threeWorry!=0 }">checked</c:if> type="checkbox" id="threeWorry" value="3" name="typies"/>
                    <label class="btn_checkbox" for="threeWorry">
                        <div class="checkd_checkbox <c:if test="${loginUser!=null&&loginUser.threeWorry!=0 }">checkbox_checking</c:if>"></div>
                    </label>
                    <label class="title_checkbox" for="threeWorry">트러블</label>
                </div>
            </div><!--//#checkboxBox end end-->
            <div class="wrap_msg worry"></div><!--//wrap_msg end-->
        </div><!--//wrap_input end-->


<%--         <c:choose>
        <c:when test="${loginUser!=null }">
		<div class="row" id="profileRow">
			<span class="label" hidden>프로필사진</span>
			<div id="profileBox" class="fas fa-user-circle no_image">
				<img src="/img/profile/${loginUser.img }" width="140" height="140" id="profileImg"/>
				<label class="fas fa-camera">
					<input type="file" id="profile"/>
				</label>
				<input type="file" id="profile" class="screen_out"/>
				<button type="button" class="delete fas fa-times"><span class="screen_out">삭제</span></button>
			</div><!-- //profileBox -->
		    <div class="wrap_msg profile"></div>
		</div><!--//profileRow -->
		</c:when>
		</c:choose> --%>
		
        <div id="buttonWrap">
           <a href="/mypage/${loginUser.id}"><button class="btn_style" type="button">취소</button></a>
       
<c:choose>
	<c:when test="${user=null }">
             <button class="btn_style" type="submit"> 회원가입 </button>
	</c:when>
	<c:otherwise>
		<input type="hidden" name="_method" value="PUT"/>
		<input type="hidden" name="no" value="${loginUser.no}"/>
		<input type="hidden" name="id" value="${loginUser.id}"/>
		<button class="btn_style" type="submit">수정</button>
	</c:otherwise>
</c:choose>
            
        </div><!--//buttonWrap end-->

    </form><!--//form end-->
</div><!--//contents end-->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="/js/moment-with-locales.js"></script>

<script>

	//form
	var $joinForm = $("#contents>form");
	
	//아이디가  첫글자는 영어로, 영어와 숫자로 4~20글자까지라면
	var idReg = /^[a-z|A-Z][\w]{3,19}$/;
	//비밀번호가 4~32자로 영어, 숫자
	var pwdReg = /^[\w]{4,32}$/;
	//image인지 확인하는 정규표현식
	var profileReg = /^image/;

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
	
	//year
	var $year = $("#year");
	//month
	var $month = $("#month");
	//date
	var $date = $("#date");

	var $birthDate = $("#birthDate");
	
	//birth msg
	var $birthMsg = $(".wrap_msg.birth");

	//profile input요소(type file)
	var $profile = $("#profile");
	//profile msg 
	var $profileMsg = $(".wrap_msg.profile");
	//profileName
	var $profileName = $("#profileName");
	//profileImg
	var $profileImg = $("#profileImg");
	//profileBox
//	var $profileImgBox = $("#profileImgBox");	
	var $profileBox = $("#profileBox");
	
	var $input = $('input');
	
    /*input css and 필수항목 확인 하는 함수*/
	$input.focus(function () {
	        $('.box_input_focus').removeClass('box_input_focus');
	        $(this).parent('.box_input').addClass('box_input_focus');
	        var inputVal = $(this).val();
	        if (inputVal.length != 0) {
	            $(this).parent('.box_input').next().text(' ');
	        } else {
	            $(this).parent('.box_input').next().text('필수항목 입니다.');
	        }
	});

	$input.keyup(function () {
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

	//유효성검사가 되었는지 확인하는 변수
	var isValidId = false;
	var isValidPwd = false;
	var isConfirmPwd = false;
	var isValidBirth = false;

	/*유효성검사 함수들 */
	
		//아이디 유효성검사용 함수
	function checkId() {
		
	    //유저가 입력한 값을 얻어옴
	   var value = $id.val();
	    
	    //이전 글자와 현재 글자가 같지 않을때만
	   if(oldId!=value) { 
		   //현재 글자를 이전글자로 업데이트
		   oldId = value;
	   
		   if(idReg.test(value)) {
			   
			 	//체크를 다시 시작하니까 무조건 false로
				isValidId = false;
			   
			   //ajax작동시작
			   $idMsg.removeClass("ok")
			         .text("확인중...");
			   
			   $.ajax({
				   url:"/ajax/user/id",
				   dataType:"json",
				   data:{"id":value},
				   error:function() {
					   
					  alert("서버 점검중!");
					  
				   },
				   success:function(json) {
					   
					   if(json.result) {
						   isValidId = true;
						   $idMsg.addClass("ok").text("아주 좋은 아이디입니다.");
					   }else {
						   isValidId = false;
						   $idMsg.removeClass("ok").text("이미 사용중이거나 탈퇴한 아이디입니다.");
					   }//if~else end
					   
				   }//success end
			   });//$.ajax() end
		        
		   }else {
		        $idMsg.removeClass("ok").text("첫글자를 영어로, 영어,숫자 4~20글자로 입력해주세요.");
		   }//if~else end
	   
	   }//if end

	}//checkId end	
	
	$id.keyup(checkId)
	   .blur(checkId)
	   .focus();//id에 포커스 지정	
	
	//비밀번호 유효성검사하는 함수
	function checkPwd() {
		
		if(pwdReg.test($pwd.val())) {
			$pwdMsg.addClass("ok").text("좋은 비밀번호입니다.");
			isValidPwd = true;
		}else {
			$pwdMsg.removeClass("ok").text("영어,숫자 4~32글자로 입력해주세요.");
			isValidPwd = false;
		}//if~else end
		
		checkConfirmPwd();
		
	}//checkPwd() end	
	
	$pwd.keyup(checkPwd);
	
	function checkConfirmPwd() {
		
		var value = $confirm.val();
		
		if(value.length!=0 && value==$pwd.val()) {
			isConfirmPwd = true;
			$confirmMsg.addClass("ok")
			           .text("비밀번호와 일치합니다.");
		}else {
			isConfirmPwd = false;
			$confirmMsg.removeClass("ok")
	        .text("비밀번호와 동일하게 입력해주세요.");
			//$confirm.val("").focus();
		}//if else end
		
	}//checkConfirmPwd() end		
		
	 $confirm.keyup(checkConfirmPwd);  
	
	//년월일이 제대로 되었는지 확인하는 함수
	function checkBirthDate() {
		
		var year = $year.val();
		var month = $month.val();
		var date = $date.val();
		
		var birth = moment([year,month-1,date]);
		
		if(birth.isValid()) {
			isValidBirth = true;
			$birthMsg.addClass("ok")
			         .text("아주 좋은 생년월일입니다.");
		}else {
			isValidBirth = false;
			$birthMsg.removeClass("ok")
	                 .text("제대로 된 생년월일을 입력해주세요.");
		}//if~else end
		
	}//checkBirthDate() end	
/* 	var myYear = ${loginUser.updateBirthYear()};
	var myMonth = ${loginUser.updateBirthMonth()};
	var myDate = ${loginUser.updateBirthDate()};
	 */
    function makeBirthDate() {
        for (i=2019; i>=1900; i--){
        	
        	<c:choose>
        	<c:when test="${loginUser!=null}">
        	if(i==${loginUser.updateBirthYear()})
        		{
		            $("<option>").text(i).attr("selected","selected").appendTo("#year");
        		}else{
		            $("<option>").text(i).appendTo("#year");
        		}
        	</c:when>
        	<c:otherwise>
        		$("<option>").text(i).appendTo("#year");
        	</c:otherwise>
        	</c:choose>
        	
        } //년도 생성
        for (i=1; i<=12; i++){
        	
        	<c:choose>
        	<c:when test="${loginUser!=null}">
        	if(i==${loginUser.updateBirthMonth()})
        		{
        			$("<option>").text(i).attr("selected","selected").appendTo("#month");
        		}else {
		            $("<option>").text(i).appendTo("#month");
        		}
        	</c:when>
        	<c:otherwise>
        		$("<option>").text(i).appendTo("#month");
        	</c:otherwise>
        	</c:choose>
        	
        } //월 생성
        for (i=1; i<=31; i++){
        	
        	<c:choose>
        	<c:when test="${loginUser!=null}">
        	if(i==${loginUser.updateBirthDate()}){
        		$("<option>").text(i).attr("selected","selected").appendTo("#date");
        	}else {
            	$("<option>").text(i).appendTo("#date");
        	}
        	</c:when>
        	<c:otherwise>
        		$("<option>").text(i).appendTo("#date");
        	</c:otherwise>
        	</c:choose>
        	
        } //일 생성
    };
    makeBirthDate(); 
    
	$year.keyup(checkBirthDate);
	$month.keyup(checkBirthDate);
	$date.keyup(checkBirthDate);

<c:if test="${loginUser==null}">	
    //radio checking
	$('.title_radio').on('click', function () {
		$('.radio_checking').removeClass('radio_checking');
	    $(this).prev('.btn_radio').children().addClass('radio_checking');
	})

	$('.btn_radio').on('click', function () {
	    $('.radio_checking').removeClass('radio_checking');
	    $(this).children().addClass('radio_checking');
	    $(this).prev().prop("checked", true);
	})
</c:if>
    
	$('.title_radio2').on('click', function () {
	    $('.radio_checking2').removeClass('radio_checking2');
	    $(this).prev('.btn_radio2').children().addClass('radio_checking2');
	})

	$('.btn_radio2').on('click', function () {
	    $('.radio_checking2').removeClass('radio_checking2');
	    $(this).children().addClass('radio_checking2');
	    $(this).prev().prop("checked", true);
	})
	
	//checking box
	    // 오류천국 ** 다시보기
	$('.title_checkbox').on('click', function () {
		    $(this).prev('.btn_checkbox').children().toggleClass("checkbox_checking");
			//alert('test');
	  /*   $(this).prev('.btn_checkbox').children().toggleClass("checkbox_checking");
			 var tmp = $(this).prev().prev().is(":checked");
	        // 체크여부 확인

	        console.log(tmp)

	        if (tmp == false) {
	            $(this).prev('.btn_checkbox').children().addClass('checkbox_checking');
	        } else {
	            $('.checkbox_checking').removeClass('checkbox_checking');
	        } 
	        $('.checkbox_checking').removeClass('checkbox_checking');
	        $(this).prev('.btn_checkbox').children().addClass('checkbox_checking'); */
	})
	
 	$('.btn_checkbox').on('click', function () {
		$(this).children().toggleClass("checkbox_checking");
    })

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
		
		if(file==null||file.size<=0) {
			
			$profileMsg.removeClass("ok")
			           .text("제대로 된 파일을 선택해주세요.");
			
			return;
		}//if end
		
		//이미지인지 확인!!
		if(!profileReg.test(file.type)) {
			
			$profileMsg.removeClass("ok")
	        .text("이미지 파일을 선택해주세요.");
			
			return;
		}else {
			
			$profileMsg.text("");
			
		}//if~else end
		
		if(oldProfile!=file.name) {
			
		oldProfile = file.name;
		
		//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
		//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
		
		//ajax로 넘길 폼을 생성하고
		var form = new FormData();
		
		//우리가 선택한 파일을 붙임
		form.append("type","P");//일반적인 데이터
		
		//1)파라미터명, 2) 파일 3) 파일명
		form.append("uploadImg",file,file.name);
		
		//multipart/form-data로 ajax처리
		$.ajax({
			url:"/ajax/upload",
			dataType:"json",
			type:"POST",//multipart/form-data
			processData:false,//multipart/form-data
			contentType:false,//multipart/form-data
			data:form,
			error:function() {
				alert("사진 서버 점검중!");
			},
			success:function(json) {
				console.log(json.src);
				$profileImg.attr("src",json.src);
				$profileName.val(json.src);
				$profileBox.removeClass("no_image");
							
			}//success end
			
		});//ajax() end
		
		}//if end
		
	}//checkProfile() end	

	/* 	
 	//fileUpload change
    $('#fileUpload').change(function () {
        var profileRoot = $('#fileUpload').val();
        $('#profile').val(profileRoot);
        $('#profileImg').attr('src', profileRoot);

        console.log(profileRoot);
    });//fileupload check 하는 함수 
	
     */
     
	//profile사진이 변경되면
	$profile.change(checkProfile);//change() end

	//사진 x버튼 눌렀을때 사진 초기화
	   $(".delete").click(function() {
	   	$profile.val("");
	   	$profileName.val("");
	   	$profileBox.addClass("no_image");
	   });//click() end 

	   //form submit
	   $joinForm.submit(function() {

	   	checkPwd();
	   	checkBirthDate();
	   	checkProfile();
	   	
	   	/*
	   	console.log("submit 할때");
	   	console.log(isValidId);
	   	console.log(isValidNickname);
	   	console.log(isValidPwd);
	   	console.log(isConfirmPwd);
	   	console.log(isValidBirth);
	   	console.log(!$profileBox.hasClass("no_image"));
	   	*/
	   	
        //var radioVal = $('input[name="gender"]:checked').val();
       // var checkVal = $('input[type="checkbox"]:checked').val();
      //  console.log(radioVal);
        console.log(checkVal);
	   	
	   	if(!isValidId ||
	   	   !isValidPwd ||
	   	   !isConfirmPwd ||
	   	   !isValidBirth) {
	   		//console.log("서브밋 안됨");
	   		return false;
	   	}//if end
	   	
	   	/*  $birthDate.val($year.val()+"-"+$month.val()+"-"+$date.val());
 */
	   });//submit() end
	   
	
</script>
</body>
</html>