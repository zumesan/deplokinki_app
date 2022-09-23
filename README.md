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

- has_many :t_deplos
- has_many :t_deplo_records

## deplos テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| deplo_title    　　　     | string     | null: false                    |
| deplo_info          　　　| text       | null: false                    |
| municipality             | string     | null: false                    |
| category_id              | integer    | null: false                    |
| prefecture_id            | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- has_one    :deplo_record

## deplo_records テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| deplo              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :deplo