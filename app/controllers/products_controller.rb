class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  def index
    @products = Product.all
  end

  def list
    @products = Product.all
  end

  def show; end

  def edit; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
      flash[:info] = 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
      flash[:info] = 'Product was successfully updated.'
    else
      render :edit
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :image, :price)
  end
end
