class MypageController < ApplicationController

  def index
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @address = Address.find(params[:id])
  end

end
