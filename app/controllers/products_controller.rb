class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :catch_product, only: [:edit, :update, :back_to_top]
  before_action :back_to_top, only: :edit
  
  def index
    @products = Product.all.order("created_at DESC")
  end
  

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :products_name, :description, :category_id, :condition_id, :delivery_change_id, :delivery_source_id, :preparation_period_id, :price).merge(user_id: current_user.id)
  end

  def catch_product
    @product = Product.find(params[:id])
  end

  def back_to_top
    unless current_user == @product.user
      redirect_to root_path
    end
  end
end
