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
- has_one :prefecture

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|addresses_id|references|null: false, foreign_key: true|

### Association

- belongs_to :address

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
|fee|interger||null: false|
|description|text|null: false|
|first_category_id|references|null: false, foreign_key: true|
|second_category_id|references|null: false, foreign_key: true|
|third_category_id|references|null: false, foreign_key: true|
|order_status_id|

### Association

- belongs_to :user
- has_many :item_images
- has_many :likes
<!-- - has_many :comments -->
- has_many :warning
- has_many :message_users,through::messages,source::user
- has_many :like_users,through::likes,source::user
- has_many :warning_users,through::warnings,source::user
- belongs_to :first_category
- belongs_to :second_category
- belongs_to :third_category
- has_one :size
- belongs_to :brand
- has_one :condition
- has_one :delivery_fee
- has_one :delivery_ways
- has_one :delivery_day
- belongs_to :order_status

<!-- ## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|
|user_id|references|null false, foreign_key: true|
|item_id|references|null false, foreign_key: true| -->

<!-- ### Association -->



## firrt_categories

|first_category|string|null:false|

### Association

- has_many :items
- has_many :second_categories

## second_categories

|first_category_id|references|foreign_key:ture|
|second_category|string|null:false|

### Association

- belongs_to :first_category
- has_many :third_categories
- has_many :itemes

## third_categories

|second_category_id|references|foreign_key:ture|
|third_category|strings|null:fall|

### Association

- belongs_to :second_category
- has_many :items

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|
|item_id|references|null: false, foreign_key: true|

### Association

- belongs_to :item

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size|string|

### Association

- belongs_to :item

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association

- belongs_to :item

## conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|condition|string|

### Association

- belongs_to :item

## delivery_fees

|Column|Type|Options|
|------|----|-------|
|charge|string|

### Association

- has_many :items

## delivery_dates

|Column|Type|Options|
|------|----|-------|
|date|string|

### Association

- has_many :items

## delivery_ways

|Column|Type|Options|
|------|----|-------|
|way|string|

### Association

- has_many :items

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
- belongs_to :evaluations

## order_statuses

|Column|Type|Options|
|------|----|-------|
|order_status|string|

### Association

- has_many :items
- has_many :commnets

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null false, foreign_key: true|
|item_id|references|null false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## warningテーブル

|user_id|references|null false, foreign_key: true|
|item_id|references|null false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

