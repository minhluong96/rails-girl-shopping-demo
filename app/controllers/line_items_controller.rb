class LineItemsController < ApplicationController
  def create
    chosen_product = Product.find(params[:product_id])
    add_items_to_cart(chosen_product, params[:quantity].to_i)
    respond_to do |format|
      if @line_item.save!
        format.html { redirect_back(fallback_location: @current_cart) }
        format.js
      else
        format.html { render :new, notice: 'Error adding product to basket!' }
      end
    end
  end

  private
  def add_items_to_cart(chosen_product, quantity = 1)
    # If cart already has this product then find the relevant line_item
    # and iterate quantity otherwise create a new line_item for this product
    if @current_cart.product_ids.include?(chosen_product.id)
      # Find the line_item with the chosen_product
      @line_item = @current_cart.line_items.find_by(product_id: chosen_product)
      # Iterate the line_item's quantity by one
      @line_item.quantity += quantity
    else
      @line_item = LineItem.new
      @line_item.cart = @current_cart
      @line_item.product = chosen_product
      # @line_item.order = Order.first
      @line_item.quantity = quantity
    end
  end
end
