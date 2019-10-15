class AddressesController < ApplicationController
  layout 'registration'

  def new
  end

  def create
    @address= Address.new(create_params)
    if @address.save
      redirect_to controller: :creditcards, action: :new
    else
      render :new
    end
  end

  private
  def create_params
    params.require(:address).permit(:postcode, :city, :address, :building_name).merge(user_id: User.last.id, prefecture_id: params[:prefecture_id])
  end
end