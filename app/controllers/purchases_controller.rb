class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    binding.pry
    @purchase_address = PurchaseAddress.new(purchase_params)
     if @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purcahase_params
    params.require(:purchase_address).permit(:postal_code, :phone_number, :shippping_area_id, :municipality, :address, :building_name).merge(user_id: current_user.id)
  end
end
