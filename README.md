# テーブル設計

## usersテーブル
|Column            |Type  |Options                |
|------------------|------|-----------------------|
|nickname          |string|null: false            |
|email             |string|null: false,unique:true|
|encrypted_password|string|null: false            |
|family_name       |string|null: false            |
|first_name        |strung|null: false            |
|family_name_kana  |string|null: false            |
|first_name_kana   |string|null: false            |
|birthday          |string|null: false            |

### Association
-has_many :item
-has_many :purchases


## itemsテーブル
|Column       |Type      |Options                      |
|-------------|----------|-----------------------------|
|item_name    |string    |null: false                  |
|description  |text      |null: false                  |
|category_id  |string    |null: false                  |
|condition_id |string    |null: false                  |
|charge_id    |string    |null: false                  |
|prefecture_id|string    |null: false                  |
|etd_id       |string    |null: false                  |
|price        |string    |null: false                  |
|user         |references|null: false,foreign_key: true|
### Association
-belongs_to :user
-belongs_to :purchase


## purchasesテーブル
|Column|Type      |Options                      |
|------|----------|-----------------------------|
|user  |references|null: false,foreign_key: true|
|item  |references|null: false,foreign_key: true|

### Association
-belongs_to :user
-belongs_to :item


## addressesテーブル
|Column       |Type      |Options                      |
|-------------|----------|-----------------------------|
|postcode     |string    |null: false                  |
|prefecture_id|string    |null: false,foreign_key: true|
|city         |string    |null: false                  |
|block        |string    |null: false                  |
|building     |string    |null: false                  |
|phone_number |string    |null: false                  |
|purchase     |references|null: false,foreign_key: true|

### Association
-belongs_to :purchase