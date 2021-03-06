class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :catch_product, only: [:edit, :update, :destroy, :back_to_top]
  before_action :back_to_top, only: [:edit, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
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
    @comments = @product.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    redirect_to root_path if @product.purchase.present?
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def search
    @products = Product.search(params[:keyword]).order('created_at DESC')
  end

  private

  def product_params
    params.require(:product).permit(:image, :products_name, :description, :category_id, :condition_id, :delivery_change_id,
                                    :delivery_source_id, :preparation_period_id, :price).merge(user_id: current_user.id)
  end

  def catch_product
    @product = Product.find(params[:id])
  end

  def back_to_top
    redirect_to root_path unless current_user == @product.user
  end
end
