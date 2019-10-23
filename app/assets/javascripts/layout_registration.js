$(function(){
  var url = location.pathname
  if(url == "/users/sign_up") {
  }
  else if(url == "/registration/address") {
    listInfo = $('.list')[0];
    $(listInfo).removeClass("list--active");
    listAddress = $('.list')[2];
    $(listAddress).addClass("list--active");
    for (i=1; i<=2; i++) {
      leftBar = $('.left-bar')[i];
      point = $('.point')[i];
      rightBar = $('.right-bar')[i-1];

      $(leftBar).addClass("left-bar--active");
      $(rightBar).addClass("right-bar--active");
      $(point).addClass("point--active");
    }
  }
  else if (url == "/registration/compleate"){
    listInfo = $('.list')[0];
    $(listInfo).removeClass("list--active");
    listComp = $('.list')[4];
    $(listComp).addClass("list--active");
    for (i=1; i<=4; i++) {
      leftBar = $('.left-bar')[i];
      point = $('.point')[i];
      rightBar = $('.right-bar')[i-1];
      
      $(leftBar).addClass("left-bar--active");
      $(rightBar).addClass("right-bar--active");
      $(point).addClass("point--active");
    }
  }
  else{
    $('.right-contents').empty();
  }
});