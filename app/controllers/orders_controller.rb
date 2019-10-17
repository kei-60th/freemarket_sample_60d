class OrdersController < ApplicationController
  layout 'registration'
  require 'payjp'
  def index
  end

  def create
    Payjp.api_key = "sk_test_b250324552e33cee76c39e0e"
    Payjp::Charge.create(
      amount: params[:price],
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
end
