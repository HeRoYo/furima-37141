FactoryBot.define do
  factory :product do
    products_name         {Faker::Book.title}
    description           {Faker::Lorem.sentence}
    price                 {Faker::Number.between(from: 300, to: 9999999)}

    category_id            {1}
    condition_id           {1}
    delivery_change_id     {1}
    delivery_source_id     {1}
    preparation_period_id  {1}

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
