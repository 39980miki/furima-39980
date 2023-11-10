class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  # if user_signed_in? && current_user.id == item.user_id
  before_action :authorize_user!, only: [:edit, :update]

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

  def authorize_user!
    @item = Item.find_by(id: params[:id])

    unless @item && current_user == @item.user
      redirect_to root_path, alert: "権限がありません"
    end
  end

end
