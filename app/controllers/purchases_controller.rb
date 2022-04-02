class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find(params[:product_id])
    @order_product = OrderProduct.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order_product = OrderProduct.new(order_product_params)
    if @order_product.valid?
      @order_product.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_product_params
    params.require(:order_product).permit(:post_code, :delivery_source_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, product_id: @product.id)
  end

end
