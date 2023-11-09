class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index
    @items = Item.all
    # @items = Item.all.order("created_at DESC") #一覧が新規順に並ぶように
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params) #？Item.createとどっち？
    if @item.save
      redirect_to'/' #もしくは'/'がroot_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :etd_id, :price).merge(user_id: current_user.id)
  end

end
