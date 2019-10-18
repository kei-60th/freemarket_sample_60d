class OrdersController < ApplicationController
  layout 'registration'
  require 'payjp'
  def index
  end

  def show
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_b250324552e33cee76c39e0e"
    Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
  
end
