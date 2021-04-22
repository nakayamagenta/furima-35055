class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item,only:[:index, :create]
  before_action :sold_out_item,only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :phone_number, :shipping_area_id, :municipality, :address, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_b319953b90ef46766fd5ed7f"  
    Payjp::Charge.create(
      amount: @item.price,   # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  
  def set_item
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

   def sold_out_item
    redirect_to root_path if @item.purchase.present?
   end
end
