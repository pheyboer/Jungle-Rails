class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    begin
      charge = perform_stripe_charge
      order  = create_order(charge)

      if order.valid?
        empty_cart!
        redirect_to order, notice: 'Your Order has been placed.'
      else
        redirect_to cart_path, flash: { error: order.errors.full_messages.first }
      end

    rescue Stripe::CardError => e
      Rails.logger.error "Stripe card error: #{e.message}"
      redirect_to cart_path, flash: { error: e.message }
    rescue => e
      Rails.logger.error "Order error: #{e.class} - #{e.message}"
      redirect_to cart_path, flash: { error: 'An error occurred while processing your order.' }
    end
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Rails.logger.info "Attempting Stripe charge with amount: #{cart_subtotal_cents}"


    # Payment Testing - tok_visa special test token
    token = params[:stripeToken] || 'tok_visa'

    Stripe::Charge.create({
      source:      token,
      # source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Jungle Order",
      currency:    'cad'
    })
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end
