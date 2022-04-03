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
      pay_product
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_product_params
    params.require(:order_product).permit(:post_code, :delivery_source_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: order_product_params[:token],
      currency: 'jpy'
    )
  end
end
