class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_change
  belongs_to :delivery_source
  belongs_to :preparation_period

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  has_many :comments

  with_options presence: true do
    validates :image
    validates :products_name
    validates :description
  end

  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_change_id
    validates :delivery_source_id
    validates :preparation_period_id
  end

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }

  def self.search(search)
    if search != ''
      Product.where('products_name LIKE(?)', "%#{search}%")
      Product.where('description LIKE(?)', "%#{search}%")
    else
      Product.all
    end
  end
end
