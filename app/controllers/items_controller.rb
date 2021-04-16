class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :set_items, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  #def destroy
  #end

  def update
    if @item.update(item_params)
    redirect_to item_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:product, :category_id, :price, :condiction_id, :shipping_chager_id, :shipping_area_id, :shipping_day_id, :explanation, :image).merge(user_id: current_user.id)
                             
   def set_item
    @item= Item.find(params[:id])
   end

   def set_items
    redirect_to root_path unless current_user.id == @item.user_id
  end
  end
end
