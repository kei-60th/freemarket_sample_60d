$(function(){

  $('.setimage__onclick').on('click', function(){
    var parent = $(this).parent(),
        target = $(parent).next()
        $(target).click();
  });

  $('.preview').on('click', function(){
    var parent = $(this).parent(),
        target = $(parent).next()
        $(target).click();
  });




  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('.file-content').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $setimage = $(this).prev(),
        id_value = $(this).attr('id'),
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        $setimage.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $setimage.append($('<img>').attr({
                  src: e.target.result,
                  class: "preview",
                  title: file.name,
                  onClick:`$('#${id_value}').click()`
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});