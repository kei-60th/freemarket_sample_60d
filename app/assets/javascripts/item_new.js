$(function(){
  $('.item-price_field').on("keyup", function(){
    priceForm = $('.item-price_field')[0];
    price = $(priceForm).val();
    if (price>=300 && price<=9999999) {
      $("#item-new-fee").empty();
      $("#item-new-profit").empty();
      fee = Math.round(price * 0.1);
      profit = price - fee;
      $("#item-new-fee").append("¥" + fee.toLocaleString());
      $("#item-new-profit").append("¥" + profit.toLocaleString());
    }
    else {
      $("#item-new-fee").empty();
      $("#item-new-profit").empty();
      $("#item-new-fee").append("-");
      $("#item-new-profit").append("-");
    }
  });
});

$(document).on("change", '#item_select-box1', function(){
  categoryId = $('#item_select-box1').val();
  $.ajax({
    type: 'GET',
    url: '/item/category_children',
    data: {categoryId: categoryId},
    dataType: 'json'
  })
  .done(function(categories){
    let options = '';
    $.each(categories.childrens, function(i){
      category = categories.childrens[i];
      //options += `<option value="${categoryId}/${category.id}">${category.name}</option>`;
      options += `<option value="${category.id}">${category.name}</option>`;
    });
    $("#item_select-box2").remove();
    $("#item_select-box3").remove();
    $("#item_select-box1").after(
      `<select class="item_select-box" id="item_select-box2" name="item[parent_id]">
        <option value="">---</option>
        ${options}
      </select>`
    );
  })
});

$(document).on("change", '#item_select-box2', function(){
  GrandParentCategoryId = $('#item_select-box1').val();
  categoryId = $('#item_select-box2').val();
      //console.log(categoryId);
  $.ajax({
    type: 'GET',
    url: '/item/category_children',
    data: {categoryId: `${GrandParentCategoryId}/${categoryId}`},
    dataType: 'json'
  })
  .done(function(categories){
    let options = '';
    $.each(categories.childrens, function(i){
      category = categories.childrens[i];
      options += `<option value=${category.id}>${category.name}</option>`;
    });
    $("#item_select-box3").remove();
    $("#item_select-box2").after(
      `<select class="item_select-box" id="item_select-box3" name="item[category_id]">
        <option value="">---</option>
        ${options}
      </select>`
    );
  })
});

