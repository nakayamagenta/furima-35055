
## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name _kana  | string | null: false|
| last_name_kana    | string | null: false |
| email             | string | unique:true, null: false |
| encrypted_password| string | null: false |
| nickname          | string | null: false |
| birthday          | date   | null: false |

has_many :items
has_many :purchases

## items テーブル

| Column              | Type      | Options     |
| ------              | ------    | ----------- |
| product             | string    | null: false |
| category_id         | integer   | null: false |
| price               | integer   | null: false |
| condition_id        | integer   | null: false |
| shipping_charger_id | integer   | null: false |
| shipping_area_id    | integer   | null: false |
| shipping_day_id     | integer   | null: false |
| explanation         | text      | null: false |
| user                | references| null: false, foreign_key: true |

belongs_to :user
has_one :purchase


## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one : addresses

## addresses テーブル

| Column          | Type       | Options                        |
| -------         | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| phone_number    | string     | null: false                    |
| shipping_area_id| integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |
| purchase        | references | null: false, foreign_key: true |

belongs_to :purchase