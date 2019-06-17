class CartsController < ApplicationController
  def index
    @line_items = @current_cart.line_items.includes(:product)
  end
end
