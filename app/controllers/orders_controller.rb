class OrdersController < ApplicationController
  before_action :authenticate_user!, :only => [:show, :create]
  layout 'registration'
  require 'payjp'
  def index
  end

  def show
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @item.update(order_status: 0)
    Payjp.api_key = Rails.application.credentials.PAYJP_TEST_SECRET_KEY
    Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

end
