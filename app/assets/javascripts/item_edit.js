function appendProfit(priceForm, feeForm, profitForm){
  let price = $(priceForm).val();
  let fee = Math.round(price * 0.1);
  let profit = price - fee;
  $(feeForm).empty();
  $(profitForm).empty();
  $(feeForm).append("¥" + fee.toLocaleString());
  $(profitForm).append("¥" + profit.toLocaleString());
};

$(function(){
  let priceForm = $('#item-edit-price')[0];
  let feeForm =  $("#item-edit-fee")[0];
  let profitForm = $("#item-edit-profit")[0];

  appendProfit(priceForm, feeForm, profitForm);

  $(document).on("keyup", '#item-edit-price', function(){
    let priceForm = $('#item-edit-price')[0];
    let price = $(priceForm).val();
    if (price>=300 && price<=9999999) {
      appendProfit(priceForm, feeForm, profitForm);
    }
    else {
      $(feeForm).empty();
      $(profitForm).empty();
      $(feeForm).append("-");
      $(profitForm).append("-");
    }
  });
<<<<<<< Updated upstream
=======
});

$(document).on("change", '#item-edit-select-box2', function(){
  var GrandParentCategoryId = $('#item_category_id').val();
  var selectBox = $('#item-edit-select-box2');
  var categoryId = $(selectBox).val();

  $.ajax({
    type: 'GET',
    url: '/item/category_children',
    data: {categoryId: `${GrandParentCategoryId}/${categoryId}`},
    dataType: 'json'
  })
  .done(function(categories){
    var options = '';
    $.each(categories.childrens, function(i){
      category = categories.childrens[i];
      options += `<option value=${category.id}>${category.name}</option>`;
    });
    $("#item-edit-select-box3").remove();
    $(selectBox).after(
      `<select class="item_select-box" id="item-edit-select-box3" name="item[category_id]">
        <option value="">---</option>
        ${options}
      </select>`
    );
  })
});

$(document).on("change", '#item_category_id', function(){
  var selectBox = $('#item_category_id');
  var categoryId = $(selectBox).val();

  $.ajax({
    type: 'GET',
    url: '/item/category_children',
    data: {categoryId: categoryId},
    dataType: 'json'
  })
  .done(function(categories){
    var options = '';
    $.each(categories.childrens, function(i){
      category = categories.childrens[i];
      options += `<option value="${category.id}">${category.name}</option>`;
    });
    $("#item-edit-select-box3").remove();
    $("#item-edit-select-box2").remove();
    $(selectBox).after(
      `<select class="item_select-box" id="item-edit-select-box2" name="item[parent_id]">
        <option value="">---</option>
        ${options}
      </select>`
    );
  })
>>>>>>> Stashed changes
});