class OrdersController < ApplicationController
  def new
    gift = Gift.find(params[:gift_id])
    order = Order.new
  end

  def create
    order = Order.create!(booking_params.merge(gift_sku: gift.sku, amount: gift.price, state: 'Pending', user: current_user))
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.where(state: 'Paid').find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:gift_sku, :amount, :state, :user, :address, :unit, :postal_code, :city, :country, :province, :phone_number)
  end
end
