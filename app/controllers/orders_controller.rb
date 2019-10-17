class OrdersController < ApplicationController
  layout 'registration'
  require 'payjp'
  def index
  end

  def create
    Payjp.api_key = "pk_test_e2a35b594536903b05446c30"
    Payjp::Charge.create(
      amount: params[:price],
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
end
