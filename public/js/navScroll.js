var previousScroll = 0,
    headerOrgOffset = $('.topnav').height();

$(window).scroll(function () {
    var currentScroll = $(this).scrollTop();
    if (currentScroll > headerOrgOffset) {
        if (currentScroll > previousScroll) {
            $('.header-wrap').fadeOut();
        } else {
            $('.header-wrap').fadeIn();
        }
    } else {
            $('.header-wrap').fadeIn();
    }
    previousScroll = currentScroll;
});
