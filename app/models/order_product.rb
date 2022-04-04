class OrderProduct
  include ActiveModel::Model

  attr_accessor :user_id, :product_id, :post_code, :delivery_source_id, :city, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :delivery_source_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Do not include hyphen(-)' }
    validates :token
  end

  def save
    # 購入品の情報
    purchase = Purchase.create(user_id: user_id, product_id: product_id)

    # 配送先の情報
    ShippingAddress.create(post_code: post_code, delivery_source_id: delivery_source_id, city: city, house_number: house_number,
                           building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
