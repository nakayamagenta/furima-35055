
## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| first name        | string | null: false |
| last name         | string | null: false |
| first name kana   | string | null: false |
| last name kana    | string | null: false |
| email             | string | unique:true |
| encrypted_password| string | null: false |
| nickname          | string | null: false |
| birthday          | string | null: false |
| credit            | string | null: false |

has_many :items
has_many :purchase
has_one :shipping address

## items テーブル

| Column           | Type    | Options     |
| ------           | ------  | ----------- |
| product name     | string  | null: false |
| category         | integer | null: false |
| price            | integer | null: false |
| image            | string  | null: false |
| explanation      | string  | null: false |
| condition        | string  | null: false |
| shipping charger | string  | null: false |
| shipping area    | string  | null: false |
| shipping days    | string  | null: false |

belongs_to :user
has_one :shipping address
has_one :purchase

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

belong_to :user
belong_to :items
has_one :shipping address

## shipping address テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| purchase user | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| postal code   | string     | null: false                    |
| phone number  | string     | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building name | string     | null: false                    |

belong_to :user
belong_to :items
belong_to :purchase