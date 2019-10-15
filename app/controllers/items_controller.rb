class ItemsController < ApplicationController

  def index
    @items = Item.all.includes(:item_images).limit(5).order("created_at DESC")
    # @item_images =ItemImage.all
    # @item_images =ItemImage.all
    # @ladies_items = Item.get_ladies.limit(5).includes(:item_images)
    # @mens_items = Item.get_mens.limit(5).includes(:item_images)
    # @Electric_items = Item.get_Electric.limit(5).includes(:item_images)
    # @hobby_items = Item.get_hobby.limit(5).includes(:item_images)
  end

  def new
    @item = Item.new
    4.times{@item.item_images.build}
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      # render :new, item_images: @item.item_images.build
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

  # def edit
  # end

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
  private

  def item_params
    params.require(:item).permit(:name, :description, :price,item_images_attributes: [:id, :image]).merge(order_status:1,category:1,prefecure:1,size:1,user_id:1)
  end

end

# :price, :description, :brand_id, :size_id, :condition_id, 
#       :category_id, :delivery_fee_id, :prefecture_id, :delivery_date_id,  
#       :delivery_way_id, 