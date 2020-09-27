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
|email|string|null: false, unique: true, index: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_date|date|null: false|
|introduction|text||
### Association
- has_many :items
- has_one:credit card
- has_many :addresses

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture​_id|integer|null: false|
|city|string|null: false|
|address_line|string|null: false|
|building_name|string||
|phone_number|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to_active_hash :​prefecture


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|size_id|integer|null: false|
|condition_id|integer|null: false|
|preparation_day_id|integer|null: false|
|postage_payer_id|integer|null: false|
|prefecture_id|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :category
- belongs_to :brand
- has_many :item_images, dependent: :destroy
- belongs_to :user
- belongs_to_active_hash :size
- belongs_to_active_hash :condition
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefecture


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :items


## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false,foreign_key: true|
### Association
- belongs_to :item


## sizes (active_hash)
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
- has_many :items


## conditions (active_hash)
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|
### Association
- has_many :items


## preparation_days (active_hash)
|Column|Type|Options|
|------|----|-------|
|preparation_day|string|null: false|
### Association
- has_many :items


## postage_payers (active_hash)
|Column|Type|Options|
|------|----|-------|
|postage_payer|string|null: false|
### Association
- has_many :items


## prefectur​es (active_hash)
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|
### Association
- has_many :items
- has_many:adresses
