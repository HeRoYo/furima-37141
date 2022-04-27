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
- has_many: comments

## products テーブル

| Column                | Type      | Options                        |
|-----------------------|-----------|--------------------------------|
| products_name         | string    | null: false                    |
| description           | text      | null: false                    |
| category_id           | integer   | null: false                    |
| condition_id          | integer   | null: false                    |
| delivery_change_id    | integer   | null: false                    |
| delivery_source_id    | integer   | null: false                    |
| preparation_period_id | integer   | null: false                    |
| price                 | integer   | null: false                    |
| user                  | reference | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one: purchase
- has_many: comments

## purchases

| Column           | Type      | Options                        |
|------------------|-----------|--------------------------------|
| user             | reference | null: false, foreign_key: true |
| product          | reference | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: product
- has_one: shipping_address

## shipping_addresses

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | reference  | null: false, foreign_key: true |

### Association

- belongs_to: purchase

## comments

| Column           | Type      | Options                        |
|------------------|-----------|--------------------------------|
| text             | text      | null: false                    |
| user             | reference | null: false, foreign_key: true |
| product          | reference | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: product