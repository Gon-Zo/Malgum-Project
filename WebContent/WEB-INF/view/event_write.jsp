<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Event 등록</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/tui-date-picker.css">
        <link rel="stylesheet" href="/css/template.css">
    <style>
        /* 맑음 서비스 색상 #BBDEFA #283593 */
        body *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        .event_wrap{
            width:1200px;
            min-height: 100px;
            /*background-color: skyblue;*/
            margin:auto;
            text-align: center;
            padding-top:20px;
        }
        /* 님의 event 등록 타이틀 */
        .event_page_title{
            font-size:50px;
            margin-bottom:15px;
        }
        /* event 등록 폼 */
        .event_edit_wrap{
            width:600px;
            min-height: 100px;
            /*background-color: beige;*/
            margin:auto;
            position: relative;
        }
        /* event 제목 */
        #eventTitle{
            width:600px;
            height:40px;
            font-size:20px;
            line-height: 40px;
            text-indent: 5px;
            background-color: #BBDEFA;
            border:none;
            border-bottom: 3px solid #BBDEFA;
            outline: none;
            margin:10px 0;
        }
        #eventTitle:focus{
            border-color:#283593;
        }
        /* 이벤트 시작 기간 종료 기간 박스 */
        .start_date_box, .end_date_box{
            width:300px;
            height:50px;
            /*background-color: yellow;*/
            display: inline-block;
            line-height: 50px;
            margin:10px 0;
        }
        .start_date_box{
            text-align: left;
        }
        .end_date_box{
            text-align: right;
        }
        /* 날짜 선택 할 수 있는 div */
        #startDateWrapper, #endDateWrapper{
            position: absolute;
            top:125px;
            z-index: 1;
        }
        #startDateWrapper{
            left:0;
        }
        #endDateWrapper{
            right:280px;
        }
        /* 날짜 선택 후 값 나오는 input */
        #startDate,#endDate{
            width:280px;
            height:40px;
            font-size:20px;
            line-height: 40px;
            outline: none;
            background-color: #BBDEFA;
            border:none;
            border-bottom: 3px solid #BBDEFA;
            cursor: pointer;
            text-indent: 5px;
        }
        .email_box{
            width:600px;
            height:50px;
            line-height: 50px;
            margin:10px 0;
        }
        /* 이메일 입력 */
        #emailMain,#emailSub{
            width:150px;
            height:40px;
            font-size:20px;
            line-height: 40px;
            outline: none;
            background-color: #BBDEFA;
            border:none;
            text-indent: 5px;
        }
        .email_sub{
            font-size: 20px;
        }
        .email_sub_auto{
            width:150px;
            height:42px;
            font-size:20px;
            outline: none;
            background-color: #BBDEFA;
            border: 3px solid #BBDEFA;
            border:none;
            cursor: pointer;
            margin-left:20px;
            text-indent: 5px;
        }

        /* 이미지 영역 */
        .img_wrap{
            width:600px;
            min-height: 100px;
            background-color: #fff;
        }
        /* 이미지 박스 */
        .img_box{
            width:600px;
            height:300px;
            background-color: #fff;
            position: relative;
            border:1px solid #424242;
        }
        /* 이미지 */
        .event_img_main{
            width:600px;
            height:300px;
            object-fit: contain;
        }
        /* 이미지 로딩시 삭제 버튼 */
        .img_delete_btn{
            width:30px;
            height:30px;
            background-color: transparent;
            border:none;
            cursor: pointer;
            outline: none;
            font-size:30px;
            line-height: 0;
            position: absolute;
            top:5px;
            right:5px;
            color:lightgray;
        }
        .img_delete_btn:hover{
            color:#283593;
        }
        .display_none{
            display: none;
        }
        /* 이미지 업로드 */
        .img_upload_btn{
            width:150px;
            height:100px;
            /*background-color: #fff;*/
            cursor: pointer;
            position: absolute;
            top:50%;
            left:50%;
            margin: -50px 0 0 -75px;
        }
        .img_upload_btn>i{
            font-size:100px;
            color:lightgray;
        }
        .img_upload_btn>i:hover{
            color:#283593;
        }
        .img_upload{
            display: none;
        }
        /* 파트 삭제 부분 */
        .part_delete_btn{
            width:50px;
            height:50px;
            background-color: transparent;
            border:none;
            cursor: pointer;
            outline: none;
            font-size:50px;
            line-height: 0;
            position: absolute;
            top:5px;
            right:-50px;
            color:lightgray;
        }
        .part_delete_btn:hover{
            color:#283593;
        }
        /* 이미지 권장 사이즈 알림 */
        .recommend_size{
            width:250px;
            height:70px;
            background-color: transparent;
            position: absolute;
            top:0;
            left:0;
            font-size:25px;
            padding-top:10px;
        }
        /* 이미지 영역 추가 버튼 */
        #imgBoxAddBtn{
            margin:20px auto;
            width:200px;
            height:50px;
            font-size: 30px;
            line-height: 0;
            background-color: #BBDEFA;
            border:3px solid #BBDEFA;
            display: block;
            cursor: pointer;
        }
        #imgBoxAddBtn:hover{
            color:#fff;
            background-color: #283593;
            border-color: #283593;
        }
        .button_box{
            width:600px;
            height: 60px;
            margin: auto;
            text-align: right;
            /*background-color: lightcoral;*/
            line-height: 70px;
        }
        #eventSubmit, #eventClose{
            width:130px;
            height:40px;
            border: none;
            font-size:25px;
            background-color: #fff;
            color:#283593;
            margin-right:5px;
            outline: none;
            border:1px solid #283593;
            cursor: pointer;
        }
        #eventSubmit:hover, #eventClose:hover{
            background-color: #283593;
            color:#fff;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<div class="event_wrap">
    <h3 class="event_page_title">${loginUser.brand }님의 Event 등록</h3>
    <form id="writeForm" action="/event/write/form" method="post">
        <fieldset>
            <legend class="screen_out">Event 등록 폼</legend>
            <div class="event_edit_wrap">
                <input id="eventTitle" name="title" type="text" placeholder="제목을 입력해주세요"/>
                <div class="start_date_box">
                    <input type="text" id="startDate" name="startDate1" aria-label="Date_Time"
                    placeholder="시작일을 선택해주세요"/>
                    <span class="tui=ico=date"></span>
                </div><div id="startDateWrapper" style="margin-top: -1px;"></div><!--
                --><div class="end_date_box">
                    <input type="text" id="endDate" name="endDate1" aria-label="Date_Time"
                    placeholder="종료일을 선택해주세요">
                    <span class="tui=ico=date"></span>
                </div>
                <div id="endDateWrapper" style="margin-top: -1px;"></div>
                <div class="email_box">
                    <input id="emailMain" name="emailMain" type="text" placeholder="주최자 email"/>
                    <span class="email_sub">@</span>
                    <input id="emailSub" name="emailSub" type="text" />
                    <select class="email_sub_auto">
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>daum.net</option>
                        <option>nate.com</option>
                        <option>직접입력</option>
                    </select>
                </div>
                <div class="img_wrap">
                    <div class="img_box">
                        <img class="event_img_main" src="" alt=""/>
                        <button type="button" class="display_none img_delete_btn fas fa-times"></button>
                        <label class="img_upload_btn ">
                            <i class="far fa-image"></i>
                            <input onchange="readURL(this);" type="file" class="img_upload" name="imgName">
                        </label>
                        <span class="recommend_size">이미지 권장 사이즈 1920px x 1080px</span>
                        <input type="hidden" class="img_name" name="img"/>
                    </div>
                </div>
                <button id="imgBoxAddBtn" type="button"><i class="fas fa-plus"></i></button>
                <div class="button_box">
                <button id="eventSubmit" type="submit">등록</button>
                    <button id="eventClose" type="reset">취소</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>


<script type="text/template" id="imgBoxTmp">
    <div class="img_box">
        <img class="event_img_main" src="" alt=""/>
        <button type="button" class="display_none img_delete_btn fas fa-times"></button>
        <label class="img_upload_btn ">
            <i class="far fa-image"></i>
            <input onchange="readURL(this);" type="file" class="img_upload">
        </label>
        <button type="button" class="part_delete_btn fas fa-times"></button>
        <div class="recommend_size">이미지 권장 사이즈 1920px x 1080px</span>
		<input type="hidden" class="img_name" name="img"/>
    </div>
</script><!-- imgBoxTmp tmp end-->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="/js/template.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src="/js/tui-date-picker.min.js"></script>
<script>
    var imgMaxCount = 10;
    var imgCount = 1;
    var tmp = _.template($("#imgBoxTmp").html());//템플릿 정의

    var datepicker1 = new tui.DatePicker('#startDateWrapper', {
        date: new Date(),
        input: {
            element: '#startDate',
            format:"시작일 : " + 'yyyy-MM-dd'
        },
        language:'ko'
    });
    
    
    var datepicker2 = new tui.DatePicker('#endDateWrapper', {
        date: new Date(),
        input: {
            element: '#endDate',
            format: "종료일 : " + 'yyyy-MM-dd'
        },
        language:'ko'
    });

    datepicker1.on('change', function() {
        var newDate = datepicker1.getDate();
        console.log(newDate);
        
    });
    datepicker2.on('change', function() {
        var newDate = datepicker2.getDate();
        console.log(newDate);
    });

    $(document).ready(function () {
        //문서가 준비되면
        var emailSubTxt = $(".email_sub_auto").val();
        $("#emailSub").attr("readonly",true).val(emailSubTxt);
    });

    //이메일 직접 입력일 경우에 활성화, 이메일 변경시 최신화
    $(".email_sub_auto").change(function () {
        var emailSubTxt = $(this).val();
        if(emailSubTxt == "직접입력"){
            $("#emailSub").attr("readonly",false).val("").focus();
        }else{
            $("#emailSub").attr("readonly",true).val(emailSubTxt);
        }
    });

    //이미지 추가 등록 버튼 누를 경우
    $("#imgBoxAddBtn").click(function () {
        if(imgCount<imgMaxCount){
            imgCount++;
            $(".img_wrap").append(tmp);
        }else{
            alert("더 이상 추가하실수 없습니다.");
        }
    });

    //추가된 이미지리뷰 영역 삭제 하는 버튼
    $(".img_wrap").on("click",".part_delete_btn",function () {
        $(this).parent().remove();
        imgCount--;
    });

    //이미지 등록이 되면
    $(".img_wrap").on("click",".img_upload",function () {
        //console.log($(this).val());
    });
    function readURL(fileName){
        //filename = input 변경된 인풋 요소 자체
        if(fileName.files && fileName.files[0]){
            //console.log(fileName.files[0].name);
            var fileSrc = "img/" + fileName.files[0].name;
            //사진이 올라갔을때 부모요소 찾기.
            var $parent = $(fileName).parents(".img_box");
            //console.log();
            $parent.children(".event_img_main").attr("src",fileSrc);
            $parent.children(".img_upload_btn").addClass("display_none");
            $parent.children(".recommend_size").addClass("display_none");
            $parent.children(".img_delete_btn").removeClass("display_none");
        };
    }

    //등록된 이미지 삭제
    $(".img_wrap").on("click",".img_delete_btn",function () {
        var $parent = $(this).parent();
        //이미지 영역 링크 삭제
        $parent.children(".event_img_main").attr("src","");
        //이미지 업로드 버튼 활성화
        $parent.children(".img_upload_btn").removeClass("display_none");
        //이미지 삭제 버튼 숨기기
        $parent.children(".img_delete_btn").addClass("display_none");
        //이미지 업로드 input file 초기화
        $parent.children(".img_upload_btn").children(".img_upload").val("");
        //이미지 권장 사이즈 라벨 보여주기
        $parent.children(".recommend_size").removeClass("display_none");
    });
    


	var $img=$(".img_upload");
	var imgReg = /^image/;
	var oldImg = null;
	
	function checkImg() {
		
		//alert("test");

		//jquery객체에서 순수자바스크립트요소객체 얻기
		var eventImg = $(this).get(0);

		//input type=file요소(순수자바스크립트)는 무조건
		//files배열을 가지고 있습니다.

		//한 개의 파일
		var file1 = eventImg.files[0];

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
			
			
			var $this = $(this);//input type file
			
			
			var $imgBox = $this.parents(".img_box");
			
			
			$event_img_main = $imgBox.find(".event_img_main");
			
			
			$img_name  = $imgBox.find(".img_name");
			

			//multipart/form-data로 ajax처리
			$.ajax({
				url : "/ajax/event/upload",
				dataType : "json",
				type : "POST",//multipart/form-data
				processData : false,//multipart/form-data
				contentType : false,//multipart/form-data
				data : form,
				error : function() {
					alert("사진 서버 점검중!");
				},
				success : function(json) {
					//$event_img_main.attr("src", "/img" + json.src);
					$event_img_main.attr("src", "/img/event/" +file1.name);
					$img_name.val(file1.name);
				}//success end
			});//ajax() end
		}//if end
	}//checkProfile() end
	
	$(".img_wrap").on("change",".img_upload",checkImg);//change() end
	

	$("#writeForm").submit(function() {
		checkImg();
	}); //submit() end
</script>
</body>
</html>