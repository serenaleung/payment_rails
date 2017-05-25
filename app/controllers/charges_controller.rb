class ChargesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    # Amount in cents
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (Message.last.amount / 3) * 100,
      :description => 'Rails Stripe customer',
      :currency    => 'cad'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end
end
