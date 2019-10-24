$(function(){
  // 「left-bottom__array」内の「img」をマウスオーバーした場合
  $('.left-bottom__array img').hover(function(){
  // マウスオーバーしている画像をメインの画像に反映
  $('.left-top img').attr('src', $(this).attr('src'));
  });
});