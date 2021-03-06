FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    family_name_kanji     { '山田' }
    first_name_kanji      { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    barth_day             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
