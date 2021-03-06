class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  
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

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :burden_id, :area_id, :ship_id, :value, :image).merge(user_id: current_user.id)
  end 

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end


