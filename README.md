# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name_kanji  | string | null: false               |
| first_name_kanji   | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| barth_day          | date   | null: false               |


### Association

- has_many: products
- has_many: purchases

## products テーブル

| Column             | Type      | Options                        |
|--------------------|-----------|--------------------------------|
| image              | text      | null: false                    |
| products_name      | string    | null: false                    |
| description        | text      | null: false                    |
| category           | integer   | null: false                    |
| condition          | integer   | null: false                    |
| delivery_change    | integer   | null: false                    |
| delivery_source    | integer   | null: false                    |
| preparation_period | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one: purchase

## purchases

| Column           | Type      | Options                        |
|------------------|-----------|--------------------------------|
| user             | reference | null: false, foreign_key: true |
| product          | reference | null: false, foreign_key: true |
| shipping_address | reference | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: product
- has_one: shipping_address

## shipping_address

| Column       | Type      | Options                        |
|--------------|-----------|--------------------------------|
| post_code    | integer   | null: false                    |
| prefecture   | string    | null: false                    |
| city         | string    | null: false                    |
| house_number | string    | null: false                    |
| building     | string    |                                |
| phone_number | integer   | null: false                    |

### Association

- belongs_to: purchase