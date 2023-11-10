class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :authorize_user!, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
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

  def set_item
    @item = Item.find_by(id: params[:id])
    unless @item
      redirect_to root_path, alert: "アイテムが見つかりません"
    end
  end

  def authorize_user!
    @item = Item.find_by(id: params[:id])

    unless @item && current_user == @item.user
      redirect_to root_path, alert: "権限がありません"
    end
  end

end
