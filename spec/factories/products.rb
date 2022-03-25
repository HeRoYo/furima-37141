FactoryBot.define do
  factory :product do
    products_name
    description
    category_id
    condition_id
    delivery_change_id
    delivery_source_id
    preparation_period_id
    price

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
