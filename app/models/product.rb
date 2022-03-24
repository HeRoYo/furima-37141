class Product < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_change
  belongs_to :delivery_source
  belongs_to :preparation_period

  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :category_id
    validates :condition_id
    validates :delivery_change_id
    validates :delivery_source_id
    validates :preparation_period_id
  end
end
