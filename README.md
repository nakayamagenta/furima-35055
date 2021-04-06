
## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| first name        | string | null: false |
| last name         | string | null: false |
| first name kana   | string | null: false |
| last name kana    | string | null: false |
| email             | string | unique:true null: false
| encrypted_password| string | null: false |
| nickname          | string | null: false |
| birthday          | date   | null: false |

has_many :items
has_many :purchases

## items テーブル

| Column              | Type    | Options     |
| ------              | ------  | ----------- |
| product             | string  | null: false |
| category_id         | integer | null: false |
| price               | integer | null: false |
| condition_id        | integer | null: false |
| shipping charger_id | integer | null: false |
| shipping area_id    | integer | null: false |
| shipping days_id    | integer | null: false |
| prefectures         | integer | null: false |

belongs_to :user
has_one :purchases


## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

belong_to :user
belong_to :items
has_one : shipping_address

## shipping address テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| phone_number  | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |

belong_to :purchases