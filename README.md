# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| phone_number       | string | null: false               |

### Association

- has_many :deplos
- has_many :comments

## deplos テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| deplo_title        | string     | null: false                    |
| deplo_info         | text       | null: false                    |
| municipality       | string     | null: false                    |
| category_id        | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments


## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| deplo              | references | null: false, foreign_key: true |
| comment_content    | text       |                                |

### Association

- belongs_to :user
- belongs_to :deplo