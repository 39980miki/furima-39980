class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    binding.pry
    @item =Item.find(order_params[:item_id])
    @order.item_name = @item.item_name
    @order.price = @item.price
    # @order.charge_name = @item.charge_name
    if @order.valid?
      @order.save
      return redirect_to item_path(@order.item)
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:price, :item_id, :postcode, :prefecture, :city, :block, :phone_number)
  end
end
