class AddressesController < ApplicationController
  layout 'registration'

  def new
    #@address = Address.new
    #@address.save
  end

  def create
    @address= Address.new(create_params)
    if @address.save

    else
      render :new
    end

    # Address.create(create_params)
    #binding.pry
  end

  private
  def create_params
    params.require(:address).permit(:postcode, :city, :address, :building_name).merge(user_id: User.last.id)
  end
end