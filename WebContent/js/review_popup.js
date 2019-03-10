var $tmpComment = _.template($('#addComment').html());
var $popupTmpl = _.template($("#reviewPopup").html());
var content;
var move = 0;
var loginUser = 704;
var reviewVal = 0;
var width = 0;

$("body").on("click", ".likes", function() {
	likeAjax();
});// likeAjax() 실행

$(".more_view").on("click", function() {
	reviewVal = $(this).data('value');
	console.log("reviewVal :" + reviewVal);
	popupAjax();
});// more_view end

$("#popup").on("click", function() {
	$(".review_popup_wrap").css("display", "none");
	$("#popup").css("display", "none");
});// #popup end

$("body").on("click", ".cancel", function() {
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
	writeReplyAjax();
});// .write_comment button click

function writeReplyAjax() {
	$.ajax({
		url : "/ajax/comment/write",
		type : "GET",
		dataType : "json",
		data : {
			"reviewNo" : reviewVal,
			"userNo" : loginUser,
			"content" : content
		},
		error : function() {
			alert("서버 점검중!");
		},
		success : function(json) {
			console.log(json);
			$(".comment_write input").val("");
			selectReplyAjax();
		}
	})
}// commentAjax() end

function selectReplyAjax() {
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
			$(".comment_set").html($tmpComment({
				replies : json
			}));
		}
	})
}// commentAjax() end

function likeAjax() {
	$.ajax({
		url : "/ajax/comment/like/" + reviewVal,
		type : "GET",
		dataType : "json",
		data : {
			"userNo" : loginUser
		},
		success : function(json) {
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
		data : {
			"likeNum" : json.likeNum
		},
		success : function(json) {
			console.log(json.likeNum);
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
				count : json.count,
				like : json.like
			}));
			width = json.reviewContents.length * 507;
			$(".review").css("width", width);
			$(".review_popup_wrap").css("display", "block");
			$("#popup").css("display", "block");
			selectReplyAjax();
		}
	})
}// popupAjax() end

