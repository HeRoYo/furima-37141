class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
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

  private

  def product_params
    params.require(:product).permit(:image, :products_name, :description, :category_id, :condition_id, :delivery_change_id, :delivery_source_id, :preparation_period_id, :price).merge(user_id: current_user.id)
  end

end
