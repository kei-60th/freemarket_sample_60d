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

## users

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique:true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|e-mail|string|null: false, unique:true|
|password|string|null: false|
|phone_number|string|null: false, unique:true|
|icon_image|text|
|introduction|text|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|prefecture_id|reference|foreign_key: true|
<!-- |point_amount|integer|
|profit_amount|integer| -->
### Association

- has_many :items
- has_many :orders
- has_many :buyers, class_name: "user", through: orders
- has_many :sellers, class_name: "user", through: orders
- has_many :likes
<!-- - has_many :comments -->
- has_one :address
- has_one :payment
- has_one :creditcard
- has_one :evaluation
- belongs_to :prefecture

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postcode|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false,unique|

### Association
- has_many :items
- has_many :users

## paymentsテーブル

|Column|Type|Options|
|------|----|-------|
|method|string|
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user

## creditcardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|curd_number|integer|null: false|
|valid_year|integer|null: false|
|valid_month|integer|null: false|
|cvc|integer|null: false|

### Association

- belongs_to :user

## evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|verygood|integer|
|good|integer|
|bad|integer|

### Association

- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|category_id|references|null: false, foreign_key: true|
|prefecture_id|references|foreign_key:true|
|order_status_id|

### Association

- belongs_to :user
- has_many :item_images
- has_many :likes
- has_many :warnings
- has_many :message_users,through::messages,source::user
- has_many :like_users,through::likes,source::user
- has_many :warning_users,through::warnings,source::user
- belongs_to :category
- belongs_to :prefecture
- belongs_to :size
- belongs_to :brand
- has_one :condition
- has_one :delivery_fee
- has_one :delivery_way
- has_one :delivery_date

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|
|item_id|references|null: false, foreign_key: true|

### Association

- belongs_to :item

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null false|
|parent_id|references|null:zfalse, foreign_key: true|

### Association

- belongs_to :parent, class_name: "Category"
- has_many :items
- has_many :child, class_name: "Category", foreign_key: "parent_id"
- has_many :size_category
- has_many :sizes, through: :size_category

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association

- has_many :categories, through: :size_category
- has_many :items
- has_many :size_category

## size_category
|size_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association

- belongs_to :category
- belongs_to :size

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association

- has_many :items

## conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|condition|string|
|item_id|references|null: false, foreign_key: true|

### Association

- belongs_to :item

## delivery_fees

|Column|Type|Options|
|------|----|-------|
|fee|string|
|item_id|references|null: false, foreign_key: true|

### Association

- belongs_to :item

## delivery_dates

|Column|Type|Options|
|------|----|-------|
|date|string|
|item_id|references|null: false, foreign_key: true|

### Association

- belongs_to :item

## delivery_ways

|Column|Type|Options|
|------|----|-------|
|way|string|
|item_id|references|null: false, foreign_key: true|

### Association

- belongs_to :item

## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|buyer_id|references|null false, foreign_key: true|
|seller_id|references|null false, foreign_key: true|
|item_id|references|null false, foreign_key: true|
|status|string|null false|

### Association

- belongs_to :buyer, class_name:"user"
- belongs_to :seller, class_name:"user"
- belongs_to :item

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null false, foreign_key: true|
|item_id|references|null false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## warningsテーブル

|user_id|references|null false, foreign_key: true|
|item_id|references|null false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

