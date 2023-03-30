# README
#テーブル設計

## users テーブル

| Column                | Type     | Option                     |
| --------------------- | -------- | -------------------------- |
| nickname              | string   | null: false                | 
| email                 | string   | null: false, unique: true  |
| encrypted_password    | string   | null: false                | 
| age_id                | integer  | null: false                |
| family_id             | integer  | null: false                |


### Association
has_many :incomes
has_many :expenses

--------------------------------------------------------------------

## incomes テーブル

| Column              | Type        | Option                          |
| ------------------- | ----------- | ------------------------------- |
| start_time          | datetime    | null: false                     | 
| income_price        | integer     | null: false                     |
| memo                | text        |                                 |
| category            | integer     |                                 |
| user                | references  | null: false, foreign_key: true  |


### Association
belongs_to :user

--------------------------------------------------------------------

## expenses テーブル

| Column              | Type        | Option                          |
| ------------------- | ----------- | ------------------------------- |
| start_time          | datetime    | null: false                     | 
| expense_price       | integer     | null: false                     |
| memo                | text        |                                 |
| genre               | integer     |                                 |
| category            | integer     |                                 |
| user                | references  | null: false, foreign_key: true  |


### Association
belongs_to :user

--------------------------------------------------------------------

## fixedcost テーブル

| Column              | Type        | Option                          |
| ------------------- | ----------- | ------------------------------- |
| start_time          | datetime    | null: false                     | 
| cost_price          | integer     | null: false                     |
| memo                | text        |                                 |
| genre               | integer     |                                 |
| category            | integer     |                                 |
| user                | references  | null: false, foreign_key: true  |


### Association
belongs_to :user

## aim テーブル

| Column              | Type        | Option                          |
| ------------------- | ----------- | ------------------------------- |
| aim_amount          | integer     |                                 | 
| user                | references  | null: false, foreign_key: true  |

### Association
belongs_to :user