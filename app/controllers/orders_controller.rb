class OrdersController < ApplicationController
  def new
    @gift = Gift.find(params[:gift_id])
    @order = Order.new
  end

  def create
    @gift = Gift.find(params[:gift_id])
    @order = Order.create!(order_params.merge(gift_sku: @gift.sku, amount: @gift.price, state: 'Pending', user: current_user))
    redirect_to new_order_payment_path(@order)
  end

  def show
    @order = Order.find(params[:id])
    @gift = Gift.find_by(sku: @order.gift_sku)
  end

  private

  def order_params
    params.require(:order).permit(:gift_sku, :amount, :state, :user, :address, :unit, :postal_code, :city, :country, :province, :phone_number)
  end
end
