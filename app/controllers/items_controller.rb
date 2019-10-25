class ItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]


  def index
    @category_list = Category.all
    @items = Item.all.includes(:item_images).limit(5).order("created_at DESC")
    # @item_images =ItemImage.all
    # @item_images =ItemImage.all
    # @ladies_items = Item.get_ladies.limit(5).includes(:item_images)
    # @mens_items = Item.get_mens.limit(5).includes(:item_images)
    # @Electric_items = Item.get_Electric.limit(5).includes(:item_images)
    # @hobby_items = Item.get_hobby.limit(5).includes(:item_images)
    # binding.pry
  end

  def show
  end

  def new
    @item = Item.new
    @parents = Category.where(ancestry: nil)  
    2.times{@item.item_images.build}
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to '/items/new'
      #render :new, item_images: @item.item_images.build
    end
  end

  # def create
  #   @item = current_user.items.new(item_params)
  #   if @item.save
  #     redirect_to root_path
  #   else
  #     render :new, item_images: @item.item_images.build
  #   end
  # end

  # def show
  #   @item_images = @item.item_images(@item.id)
  # end

  def edit
    @parents = Category.where(ancestry: nil)  
  end

  def update
    @item.update!(item_params)
    redirect_to root_path
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    elsif
      render :index
    end
  end

  def item_status
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
  end

  def category_children
    category_id = params[:categoryId]
    @categories = Category.where(ancestry: category_id.to_s)
    respond_to do |format|
      format.html {redirect_to new_item_path }
      format.json
    end
  end
  # def update
  # end

  # def destroy
  # end

  # def category_index
  # end

  # def brand_index
  # end

  # def first_category
  # end

  # def second_category
  # end

  # def third_category
  # end

  # def search
  # end
  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :prefecture_id, :condition_id, :delivery_fee_id, :delivery_way_id, :delivery_date_id, :parent_id, :grand_parent_id, item_images_attributes:[:id,:image]).merge(user_id: current_user.id)
  end
  
end

# :price, :description, :brand_id, :size_id, :condition_id, 
#       :category_id, :delivery_fee_id, :prefecture_id, :delivery_date_id,  
#       :delivery_way_id, 