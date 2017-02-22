
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
