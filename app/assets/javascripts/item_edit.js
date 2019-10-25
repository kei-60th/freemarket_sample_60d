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
});