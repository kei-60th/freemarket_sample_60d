$(function(){
  var url = location.pathname
  if(url == "/users/sign_up") {
  }
  else if(url == "/registration/address") {
    for (i=1; i<=2; i++) {
      list = $('.list')[i];
      leftBar = $('.left-bar')[i];
      point = $('.point')[i];
      rightBar = $('.right-bar')[i-1];

      $(list).addClass("list--active");
      $(leftBar).addClass("left-bar--active");
      $(rightBar).addClass("right-bar--active");
      $(point).addClass("point--active");
    }
  }
  else if (url == "/registration/compleate"){
    for (i=1; i<=4; i++) {
      list = $('.list')[i];
      leftBar = $('.left-bar')[i];
      point = $('.point')[i];
      rightBar = $('.right-bar')[i-1];
      
      $(list).addClass("list--active");
      $(leftBar).addClass("left-bar--active");
      $(rightBar).addClass("right-bar--active");
      $(point).addClass("point--active");
    }
  }
  else{
    $('.right-contents').empty();
  }
});