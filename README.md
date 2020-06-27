# README

# アプリケーション概要
個人でも複数人でも使用可能のToDoListです。
ビジネスシーンでの使用を想定して作りました。

# 機能一覧
●ユーザー登録、ログイン機能(ウィザード形式)

●ToDo投稿、編集、削除機能

# 使用技術
## ◼︎言語
### バックエンド
<!-- Ruby 2.5.1 -->
### フロントエンド
<!-- jquery 1.12.4 -->
## ◼︎フレームワーク
Ruby on Rails 5.0.7.2
## ◼︎データベース
MySQL 5.6.47
## ◼︎インフラ
AWS EC2

AWS S3

## デプロイ
<!-- Capistranoによる自動デプロイ -->

## ER Diagram
https://app.diagrams.net/#G1Jjd58qbm8L0fXl1Fq6KgVfXyu7F5wpgd


# Usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|nickname|string|null: false, unique: true, index|
|first_name|string|null: false|
|first_name_furigana|string|null: false|
|last_name|string|null: false|
|last_name_furigana|string|null: false|
|profile_photo|string|null: false|
|tel_number|string|null: false|
|email|string|null: false|
|password|string|null: false|
|introduction|text|
### Association
- has_one :address, dependent: :destroy
- has_many :todos
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy


## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|postal_code|integer|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|other|string|null: false|
|building_name|string|null: false|
|user_id|integer|foreign_key: true, null: false|
### Association
- belongs_to :user



## ToDosテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|title|string|null: false|
|explanation|text|null: false|
|user_id|integer|foreign_key: true, null: false|
|importance_id|integer|foreign_key: true, null: false|
### Association
- belongs_to :user
- belongs_to :importance
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy


## Importanceテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false|
### Association
- has_many :todos


## Likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null: false|
|todo_id|integer|foreign_key: true, null: false|
### Association
- belongs_to :user
- belongs_to :todo


## Commentテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|text|text|null: false|
|user_id|integer|foreign_key: true, null: false|
|todo_id|integer|foreign_key: true, null: false|
### Association
- belongs_to :user
- belongs_to :todo
