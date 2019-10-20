  class CreditcardsController < ApplicationController
  layout 'registration'

  def new
  end

  def create
    @creditcard= Creditcard.new(create_params)
    if @creditcard.save
      redirect_to controller: :compleate, action: :edit
    else
      render :new
    end
  end

  private
  def create_params
    params.require(:creditcard).permit(:curd_number, :cvc).merge(user_id: User.last.id,valid_year: params[:valid_year], valid_month:params[:valid_month])
  end


end
