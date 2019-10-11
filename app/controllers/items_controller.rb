class ItemsController < ApplicationController

  def index
    @items = Item.all.includes(:item_images).limit(5).order("created_at DESC")
    # @item_images =ItemImage.all
    # @ladies_items = Item.get_ladies.limit(5).includes(:item_images)
    # @mens_items = Item.get_mens.limit(5).includes(:item_images)  
    # @Electric_items = Item.get_Electric.limit(5).includes(:item_images)
    # @hobby_items = Item.get_hobby.limit(5).includes(:item_images)
  end
  # def new
  #   @item = Item.new
  #   @image = Image.new    
  # end

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

end