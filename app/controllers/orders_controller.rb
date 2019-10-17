class OrderController < ApplicationController
  require 'payjp'

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: params[:price],
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
end
