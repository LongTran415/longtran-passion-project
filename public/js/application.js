$.global = new Object();

$.global.item = 1;
$.global.total = 0;

$(document).ready(function() {
  var WindowWidth = $(window).width();
  var SlideCount = $('#slides li').length;
  var SlidesWidth = SlideCount * WindowWidth;

  $.global.item = 0;
  $.global.total = SlideCount;

  $('.slide').css('width',WindowWidth+'px');
  $('#slides').css('width',SlidesWidth+'px');
  $("#slides li:nth-child(1)").addClass('alive');

  $('#left').click(function() { Slide('back'); });
  $('#right').click(function() { Slide('forward'); });
});

function Slide(direction) {
  if (direction == 'back') { var $target = $.global.item - 1; }
  if (direction == 'forward') { var $target = $.global.item + 1; }

  if ($target == -1) { DoIt($.global.total-1); }
  else if ($target == $.global.total) { DoIt(0); }
  else { DoIt($target); }
}

function DoIt(target) {
  var $windowwidth = $(window).width();
  var $margin = $windowwidth * target;
  var $actualtarget = target+1;

  $("#slides li:nth-child("+$actualtarget+")").addClass('alive');
  $('#slides').css('transform','translate3d(-'+$margin+'px,0px,0px)');

  $.global.item = target;

  $('#count').html($.global.item+1);
}



// inspiration link
$(document).ready(function() {
  $(".logo-1").on('click', handleWebClick);
});

function handleWebClick(evt){
  evt.preventDefault();

  $(".logo-1").click(function() {
    var topPosition = $(".content").position().top;
    $("body").animate({ scrollTop: topPosition }, "slow");

    return false;
  });
  // $("body").animate({ scrollTop: 0 }, 200 );
}

// nav-scroll
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

// navigation
function dropMenu() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

//  slides
