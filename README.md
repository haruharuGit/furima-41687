## usersテーブル

| Column                 | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| nickname               | string | null: false               |
| email                  | string | null: false, unique: true |
| password               | string | null: false               |
| password_confirmation  | string | null: false               |
| last_name              | string | null: false               |
| first_name             | string | null: false               |
| last_name_kana         | string | null: false               |
| first_name_kana        | string | null: false               |
| birthday               | date   | null: false               |

### Association
- has_many :orders
- has_many :items
- has_one :address

## ordersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| token         | string     | null: false, unique: true      |
| address       | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| postage_id    | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| shipping_date | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_one :image
- belongs_to :category
- belongs_to :condition
- belongs_to :postage
- belongs_to :prefecture
- belongs_to :shipping_date

## imagesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| image    | string     | null: false                    |
| item     | references | null: false, foreign_key: true |

- belongs_to :item

## categoriesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |

- has_many :items

## conditionsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| status   | string     | null: false                    |

- has_many :items

## postagesテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postage_responsibility | string     | null: false                    |

- has_many :items

## shipping_datesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| day      | string     | null: false                    |

- has_many :items

## prefecturesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |

- has_many :items
- has_many :addresses

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

- belongs_to :prefecture
- has_many :orders
- belongs_to :user