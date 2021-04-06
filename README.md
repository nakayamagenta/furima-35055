
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname   | string | null: false |
| birthday   | string | null: false |
| crefit   | string | null: false |



## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| puroduct name   | string | null: false |
| category  | string | null: false |
| price  | string | null: false |


## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

## shipping address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| items    | references | null: false, foreign_key: true |
| postal code   | string | null: false |
| street address  | string | null: false |
| phone number  | string | null: false |


