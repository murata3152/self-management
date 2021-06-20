# README

## users テーブル
| Column                          | Type   | Options                  |
| ------------------------------- | ------ | ------------------------ |
| nickname                        | string | null: false              |
| last_name                       | string | null: false              |
| first_name                      | string | null: false              |
| last_name_details               | string | null: false              |
| first_name_details              | string | null: false              |
| hobby                           | string |                          |
| birthday                        | date   | null: false              |
| email                           | string | null: false, unique:true |
| encrypted_password              | text   | null: false              |
### Association
has_many :post


## post テーブル
| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| title           | string     | null: false                     |
| text            | text       | null: false                     |
| user            | references | null: false, foreign_key: true  |
<!-- imageはactive_storageを使用 -->
### Association
belongs_to :user
