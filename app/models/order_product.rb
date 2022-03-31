class OrderProduct
  include ActiveModel::Model
  
  attr_accsessor :user, :product, :post_code, :prefecture_id, :city, :house_number, :building, :phone_number

  with_option presence: true do
    validates :user
    validates :product
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}
  end

  validates :building

end