class AddressesController < ApplicationController
  layout 'registration'

  def new
    #@address = Address.new
    #@address.save
  end

  def create
    @user = User.find(1)
    @user.address= Address.create(create_params)
    # Address.create(create_params)
    #binding.pry
  end

  private
  def create_params
    params.require(:address).permit(:postcode, :city, :address, :building_name)
  end
end