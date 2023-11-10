class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]



  def index
    @items = Item.all.order("created_at DESC") #一覧が新規順に並ぶように
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params) 
    if @item.save
      redirect_to'/' #もしくは'/'がroot_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    # @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :etd_id, :price).merge(user_id: current_user.id)
  end

end
