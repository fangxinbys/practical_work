function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return r[2];
    return '';
}
$(function () {
    
    if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
        $('.nav-title').click(function () {
            var idx = $(this).data('index');
            nav($(this),idx);
        });
    } else {
        $('.nav-title').eq(0).hover(function(){
            $('.nav-title-childer').removeClass("uhide");
        },function(){
            $('.nav-title-childer').addClass("uhide");
        });
        $('.nav-title').eq(2).hover(function(){
            $('.nav-zixun-title-childer').removeClass("uhide");
        },function(){
            $('.nav-zixun-title-childer').addClass("uhide");
        });
        $(".nav-title-childer").hover(function(){
            $('.nav-title').eq(0).addClass('nav-active');
        },function(){
            var page = window.location.href;
            if(page.indexOf("index.html") != -1){
                $('.nav-title').eq(0).addClass('nav-active');
            }else{
                $('.nav-title').eq(0).removeClass('nav-active');
            }
            
            $(this).addClass("uhide");
        });
        $(".nav-zixun-title-childer").hover(function(){
            $('.nav-title').eq(2).addClass('nav-active');
        },function(){
            var page = window.location.href;
            if(page.indexOf("information.html") != -1){
                $('.nav-title').eq(2).addClass('nav-active');
            }else{
                $('.nav-title').eq(2).removeClass('nav-active');
            }
            
            $(this).addClass("uhide");
        })
    }
});
function nav(el,idx){
    $(".nav-title-childer").addClass("uhide");
    if ($(".nav-title-childer")[idx]) {

        $(".nav-title-childer")[idx].className = "nav-title-childer tx-l";
    }
    $(el).addClass('nav-active');
    $(el).siblings().removeClass('nav-active');
}