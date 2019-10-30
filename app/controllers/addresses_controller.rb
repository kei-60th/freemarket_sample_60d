class AddressesController < ApplicationController
  layout 'registration'

  def new
  end

  def create
    @address= Address.new(create_params)
    # @user = User.last
    # @user.update(prefecture_id: params[:prefecture_id])
    # @user.save
    if @address.save
      @validate_error = false
      redirect_to controller: :compleate, action: :edit
    else
      @validate_error = true
      render :new
    end
  end

  private
  def create_params
    params.require(:address).permit(:postcode, :city, :address, :building_name).merge(user_id: User.last.id, prefecture_id: params[:prefecture_id])
  end
end