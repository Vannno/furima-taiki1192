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
| user_name     | references | foreign_key: true |
| items_name    | references | foreign_key: true |
### Association
 - belongs_to :user 
 - belongs_to :item
 - has_one :address



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


## addresses テーブル

| Column         | Type       | Options          |
| --------       | ------     | -----------      |
| prefecture_id  | integer    | null: false      |
| city           | string     | null: false      |
| place          | string     | null: false      |
| building_name  | string    
| phone_number   | string     | null: false      |
| record         | references | foreign_key:true |
### Association
- belongs_to :record
 


