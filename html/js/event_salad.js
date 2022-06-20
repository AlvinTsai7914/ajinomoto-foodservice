// $(document).ready(function () {
//     initparallax();
// });

// youtube影片播放
$(".inner-box a").on ("click", function(){
    var $this = $(this);
    var iframeLink = $this.attr("data-iframe");
    // console.log(iframeLink)
    $(".VideoPopup iframe").attr("src", iframeLink);
    
})

//關閉modal影片結束
$(".VideoPopup").on('hidden.bs.modal', function (e) {
    $(".VideoPopup iframe").attr("src", $(".VideoPopup iframe").attr("src"));
});

//區塊背景圖片
$(".bg").each(function () {
    if ($(this).attr("data-bg")) $(this).css("background-image", "url(" + $(this).data("bg") + ")");
});


// function initparallax() {
//     var winW = $(window).width();
//     var s_parallax = skrollr.init({
//         forceHeight: !1,
//         easing: "easeInOutElastic",
//         mobileCheck: function () {
//             return !1;
//         }
//     });

//     var checkMobile = {
//         Android: function () {
//             return navigator.userAgent.match(/Android/i);
//         },
//         BlackBerry: function () {
//             return navigator.userAgent.match(/BlackBerry/i);
//         },
//         iOS: function () {
//             return navigator.userAgent.match(/iPhone|iPad|iPod/i);
//         },
//         Opera: function () {
//             return navigator.userAgent.match(/Opera Mini/i);
//         },
//         Windows: function () {
//             return navigator.userAgent.match(/IEMobile/i);
//         },
//         any: function () {
//             return checkMobile.Android() || checkMobile.BlackBerry() || checkMobile.iOS() || checkMobile.Opera() || checkMobile.Windows();
//         }
//     };
//     trueMobile = checkMobile.any();
//     if (null == trueMobile) {
//         s_parallax = skrollr.init();
//         var timer = null;
//         $(window).resize(function () {
//             winW = $(window).width();
//             window.clearTimeout(timer);
//             timer = window.setTimeout(function () {
//                 if (winW > 992) {
//                     // console.log("我是桌機")
//                     s_parallax = skrollr.init({
//                         forceHeight: !1,
//                         easing: "easeInOutElastic",
//                         mobileCheck: function () {
//                             return !1;
//                         }
//                     });
//                 } else {
//                     s_parallax = skrollr.init();
//                     s_parallax.destroy();
//                     // console.log("手機")
//                 }
//             }, 500);
//         }).trigger("resize");


//     } else {
//         s_parallax = skrollr.init();
//         s_parallax.destroy();
//     }
// }
