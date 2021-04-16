class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :set_item, only: [:edit, :show]

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
    #@item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  #def destroy
  #end

  #def update
  #end


  private

  def item_params
    params.require(:item).permit(:product, :category_id, :price, :condiction_id, :shipping_chager_id, :shipping_area_id, :shipping_day_id, :explanation, :image).merge(user_id: current_user.id)
                             
  end
end
