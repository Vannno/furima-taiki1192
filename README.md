# テーブル設計

## users テーブル

| Column              | Type   | Options     |                                 
| --------            | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| birthday            | date   | null: false |
| lastname            | string | null: false |
| firstname           | string | null: false |
| katakana_lastname   | string | null: false |
| katakana_firstname  | string | mull: false |
### Association
- has_many :records
- has_many :items
- has_one_attached :addresses



## records テーブル
| Column        | Type       | Options           |
| ------        | ---------- | -----------       |
| user_name     | reference  | foreign_key: true |
| purchase_date | references | foreign_key: true |
| items_name    | referenses | foreign_key: true |
| user_id       | reference  | foreign_key: true |
| item_id       | references | foreign_key: true |
### Association
 - belongs_to :user 
 - belongs_to :item
 - belongs_ to :address



## items テーブル

| Column               | Type       | Options           |
| --------             | ------     | -----------       |
| name                 | string     | null:false        |
| item_info            | text       | null:false        |
| category_id          | integer    | null:false        |
| item_status_id       | integer    | null:false        |
| burden_charges_id    | integer    | mull:false        |
| delivery_source_id   | integer    | null:fa;se        |
| days_ship_id         | integer    | null:false        |
| value                | integer    | null:false        |
### Association
- belongs_to :user
- has_many :records
- belongs_to :address


## record参照　テーブル
 | Column         | Type      | Options       |
 | --------       | ------    | -----------   |



## addresses テーブル

| Column         | Type      | Options       |
| --------       | ------    | -----------   |
| postal_number  | string    | null: false   |
| prefecture_id  | integer   | null: false   |
| city           | string    | null: false   |
| place          | string    | null: false   |
| building_name  | string    
| phone_number   | string    | null: false   |
### Association
- has_one_attached  : record


