FactoryBot.define do
  factory :product do
    products_name         {Faker::Book.title}
    description           {Faker::Lorem.sentence}
    price                 {Faker::Number.between(from: 300, to: 9999999)}

    category              {Category.all.sample}
    condition             {Condition.all.sample}
    delivery_change       {DeliveryChange.all.sample}
    delivery_source       {DeliverySource.all.sample}
    preparation_period    {PreparationPeriod.all.sample}

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
