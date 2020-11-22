class RecordController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item, only: [:index, :create]


  def index
    @purchases = Purchase.new
    if user_signed_in? && @item.user_id
      redirect_to root_path
    end
  end

  def create
    @purchases = Purchase.new(purchase_params)
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
    get_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.value,  
      card:  params[:token],    
      currency: 'jpy'                 
    )
  end

  def get_item
    @item = Item.find(params[:item_id])
  end

end


