class OrdersController < ApplicationController
  def new
    @gift = Gift.find(params[:gift_id])
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @gift = Gift.find_by(sku: @order.gift_sku)
  end
end
