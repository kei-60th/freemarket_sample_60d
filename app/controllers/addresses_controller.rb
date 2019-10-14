class AddressesController < ApplicationController
  layout 'registration'

  def new
    #@address = Address.new
    #@address.save
  end

  def create
    @user = User.last
    @user.address= Address.new(create_params)
    if @user.address.save

    else
      render :new
    end

    # Address.create(create_params)
    #binding.pry
  end

  private
  def create_params
    params.require(:address).permit(:postcode, :city, :address, :building_name)
  end
end