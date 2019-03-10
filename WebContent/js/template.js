
var bannerLeft = 0;
var first = 1;
var last = 0;
var liCnt = 0;
var $li = $("#dangerList li");
var $first;
var $last;

$li.each(function () {   // 5px 간격으로 배너 처음 위치 시킴
    bannerLeft += $(this).width() + 5;
    $(this).css("left", bannerLeft);
    $(this).attr("id", "danger" + (++liCnt));
});

if (liCnt > 4) {  //배너 4개 이상이면 이동시킴
    last = liCnt;
    setInterval(function () {
        $li.each(function () {
            $(this).css("left", $(this).position().left - 3); // 1px씩 왼쪽으로 이동
        });
        $first = $("#danger" + first);
        $last = $("#danger" + last);
        if ($first.position().left < -150) {    // 제일 앞에 배너 제일 뒤로 옮김
            $first.css("left", $last.position().left + $last.width() + 5);
            first++;
            last++;
            if (last > liCnt) {
                last = 1;
            }
            if (first > liCnt) {
                first = 1;
            }
        }
    }, 50);
}//if end

$(function () {
    $(".menu li").hover(function () {
        $('ul:first', this).show();
    }, function () {
        $('ul:first', this).hide();
    });
    $(".menu>li:has(ul)>a").each(function () {
        $(this).html($(this).html());
    });
    $(".menu ul li:has(ul)")
        .find("a:first")
        .append("<p style='float:right; margin:-3px'></p>");
})

var $footer = $("#footer");

function fixFooter() {
    var wHeight = $(window).height();
    var bHeight = $("body").height()+80;

    console.log(bHeight);

    if($footer.hasClass("fixed")) {
        bHeight += 150;
    }

    if(wHeight>=bHeight) {
        $footer.addClass("fixed");
    }else {
        $footer.removeClass("fixed");
    }
}

$(window).resize(fixFooter);

fixFooter();
