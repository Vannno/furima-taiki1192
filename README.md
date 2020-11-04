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
| user-id       | reference  | foreign_key: true |
| item_id       | references | foreign_key: true |

### Association
 - has_many :users
 - has_many :items
 - has_many :adresses



## items テーブル

| Column               | Type       | Options           |
| --------             | ------     | -----------       |
| name                 | string     | null:false        |
| item-info            | text       | null:false        |
| category_id          | integer    | null:false        |
| item-status_id       | integer    | null:false        |
| burden-charges_id    | integer    | mull:false        |
| delivery_source_id   | integer    | null:fa;se        |
| days-ship_id         | integer    | null:false        |
| fee                  | reference  | foreign_key: true |
| user                 | reference  | foreign_key: true |
### Association
- belongs_to :user
- has_many :records
- belongs_to :address



## addresses テーブル

| Column         | Type      | Options       |
| --------       | ------    | -----------   |
| address-number | string    | null: false   |
| prefecture_id  | integer   | null: false   |
| city           | string    | null: false   |
| place          | string    | null: false   |
| building-name  | string    
| phone-number   | string    | null: false   |
### Association
- belongs_to :user
- belongs_to :record
- has_many :items
