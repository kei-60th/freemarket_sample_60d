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
    Payjp.api_key = ENV['PAYJP_TEST_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
  
end
