class PaymentsController < ApplicationController
  def create
    @gift = Gift.find(params[:gift_id])
    @order = Order.create!(order_params.merge(gift_sku: @gift.sku, amount: @gift.price, state: 'Pending', user: current_user))

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,  # You should store this customer id and re-use it.
      amount: @order.amount_cents,
      description: "Payment for gift #{@order.gift_sku} for order #{@order.id}",
      currency: @order.amount.currency
    )

    @order.update(payment: charge.to_json, state: 'Paid')
    redirect_to order_path(@order)
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

  def order_params
    params.require(:order).permit(:gift_sku, :amount, :state, :user, :address, :unit, :postal_code, :city, :country, :province, :phone_number)
  end
end
