class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_change
  belongs_to :delivery_source
  belongs_to :preparation_period

  belongs_to :user
  has_one_attached :image

  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :delivery_change_id
    validates :delivery_source_id
    validates :preparation_period_id
  end

  validates :image,         presence: true
  validates :products_name, presence: true
  validates :description,   presence: true

  validates :price,         presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid" }
end
