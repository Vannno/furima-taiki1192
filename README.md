# テーブル設計

## users テーブル

| Column             | Type   | Options     |                                 
| --------           | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| birthday           | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| katakana-lastname  | string | null: false |
| katakana-firstname | string | mull: false |
### Association
- belongs_to :record
- has_many :items
- has_one_attached :addresses



## records テーブル

| Column        | Type       | Options           |
| ------        | ---------- | -----------       |
| user-name     | reference  | foreign_key: true |
| purchase-date | references | foreign_key: true |
| items-name    | referenses | foreign_key: true |
### Association
 - has_many :users
 - has_many :items
 - has_many :adresses



## items テーブル

| Column         | Type       | Options       |
| --------       | ------     | -----------   |
| name           | reference  | foreign_key: true |
| item-info      | reference  | foreign_key: true |
| category       | reference  | foreign_key: true |
| item-status    | reference  | foreign_key: true |
| burden-charges | reference  | foreign_key: true |
| days-ship      | reference  | foreign_key: true |
| fee            | reference  | foreign_key: true |
### Association
- belongs_to :user
- has_many :records
- belongs_to :address



## addresses テーブル

| Column         | Type      | Options       |
| --------       | ------    | -----------   |
| address-number | string    | null: false   |
| prefecture     | text      | null: false   |
| city           | string    | null: false   |
| place          | string    | null: false   |
| building-name  | string    
| phone-number   | integer   | null: false   |
### Association
- belongs_to :user
- belongs_to :record
- has_many :items
