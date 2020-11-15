class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]
  
  def index  
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end  
  end

  def edit
  end

  def show
  end



  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :burden_id, :area_id, :ship_id, :value, :image).merge(user_id: current_user.id)
  end 

  def set_item
    @item = Item.find(params[:id])
  end
end


