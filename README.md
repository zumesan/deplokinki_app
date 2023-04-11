# アプリケーション名

deplokinki

# アプリケーション概要

地域住民しか知らないような飲食店やイベントを紹介することができる。

# URL

https://deplokinkiapp-37586.onrender.com/

#　テスト用アカウント

- Basic認証ID：admin
- Basic認証パスワード：2222
- 投稿者用メールアドレス：kuru@icloud.com
- 投稿者用パスワード：kurukuru1
- 閲覧者用メールアドレス：rai@icloud.com
- 閲覧者用パスワード：rairai2
- 管理者用メールアドレス：admin@example.jp
- 管理者用パスワード：admin9876

# 利用方法

## 紹介したいことの投稿

1.ヘッダーからユーザー新規登録を行う。

2.新規投稿ボタンを押し、投稿したい内容を入力し、投稿ボタンを押す。

## 他者の投稿にコメントする

1.ログインボタンを押し、ログインする。

2.コメントしたい投稿があれば、入力フォームへ入力し、コメントボタンを押す。

# アプリケーションを作成した背景

google検索で飲食店などを探す際、意外と検索に引っかからないようなお店があることに気付き、そのようなお店やイベントを気軽に紹介したりできるアプリがあれば、あまり知られていないが美味しい店や楽しいイベントを知ることができるのではないか、また地域産業の発展に役立つのではないかと思い開発することにした。

# 洗い出した要件定義



# 実装予定の機能

- いいね機能の実装

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

# 開発環境

- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法

以下のコマンドを順に実行。  
% git clone 