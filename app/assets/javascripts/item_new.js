$(document).on('turbolinks:load', function() {
  function appendProfit(priceForm, feeForm, profitForm){
    var price = $(priceForm).val();
    var fee = Math.round(price * 0.1);
    var profit = price - fee;
    $(feeForm).empty();
    $(profitForm).empty();
    $(feeForm).append("¥" + fee.toLocaleString());
    $(profitForm).append("¥" + profit.toLocaleString());
  };

  function appendHyphen(feeForm, profitForm){
    $(feeForm).empty();
    $(profitForm).empty();
    $(feeForm).append("-");
    $(profitForm).append("-");
  };

  var priceForm = $('.item-price_field')[0];
  $(priceForm).on("keyup", function(){
    var feeForm = $("#item-new-fee")[0];
    var profitForm = $("#item-new-profit")[0];
    var price = $(priceForm).val();
    if (price>=300 && price<=9999999) {
      appendProfit(priceForm, feeForm, profitForm)
    }
    else {
      appendHyphen(feeForm, profitForm)
    }
  });


  $(document).on("change", '#item_select-box2', function(){
    var GrandParentCategoryId = $('#item_select-box1').val();
    var selectBox = $('#item_select-box2');
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
      $("#item_select-box3").remove();
      $(selectBox).after(
        `<select class="item_select-box" id="item_select-box3" name="item[category_id]">
          <option value="">---</option>
          ${options}
        </select>`
      );
    })
  });

  $(document).on("change", '#item_select-box1', function(){
    var selectBox = $('#item_select-box1');
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
      $("#item_select-box3").remove();
      $("#item_select-box2").remove();
      $(selectBox).after(
        `<select class="item_select-box" id="item_select-box2" name="item[parent_id]">
          <option value="">---</option>
          ${options}
        </select>`
      );
    })
  });
});