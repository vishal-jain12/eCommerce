class Api::V1::CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items
    render json: @cart_items
  end

  def add_to_cart
    @cart.add_item(params[:product_id])
    render json: { message: 'Item added successfully' }, status: :ok
  end

end
