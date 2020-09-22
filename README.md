# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# fleamarket_sample_79b DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false, unique: true, index:true|
### Association
- has_many :items
- belongs_to:credit card

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|string|null: false|
|price|integer|null: false|
|brand|references|foreign_key: true|
|item_condition|references|null: false,foreign_key: true|
|size|references|null: false,foreign_key: true|
|preparation_day|references|null: false,foreign_key: true|
|item_img|references|null: false, foreign_key: true|
|category|references|null: false,foreign_key: true|
|seller|references|null: false,foreign_key: true|
|buyer|references|foreign_key: true|
|deal_closed_date|timestamp||
### Association
- belongs_to :category
- belongs_to :brand
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :items

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false, unique: true|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
