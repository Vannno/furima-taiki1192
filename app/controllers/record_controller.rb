class RecordController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @purchases = Purchase.new
    @item = Item.find(params[:item_id])
    unless user_signed_in? && @item.user_id
      redirect_to root_path
    end
  end

  def create
    @purchases = Purchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchases.valid?
      pay_item
      @purchases.save
        redirect_to root_path
    else
      render 'index'
    end
  end



  private
  def purchase_params
    params.permit(:postal_code, :prefecture_id, :city, :place, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def record_params
    params.require(:record).permit(:value).merge(token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_eeef3775bead8925b8d5334d"  
    Payjp::Charge.create(
      amount: @item.value,  
      card:  params[:token],    
      currency: 'jpy'                 
    )
  end

end


