class AddressesController < ApplicationController
  layout 'registration'

  def new
    #@address = Address.new
    #@address.save
  end

  def create
    Address.create(create_params)
    #binding.pry
  end

  private
  def create_params
    params.require(:address).permit(:postcode, :city, :address, :building_name)
  end
end