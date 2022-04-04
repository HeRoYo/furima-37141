FactoryBot.define do
  factory :order_product do
    post_code { '123-4567' }
    delivery_source_id { 1 }
    city { 'あいうえ市かきくけ町' }
    house_number { '2-2' }
    building { 'さしすせ壮' }
    phone_number { '00012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
