# README

#  アプリ名  
self-management

#  概要
ペルソナ・ターゲット層：20~30代 性別問わず
ニーズ&課題：何かをしたい、なりたいのに、何者にもなれない人へ
解決&アプローチ：自己管理のツール

#  本番環境
https://self-management-35682.herokuapp.com/

Basic認証
ID: murata
Pass: 3152


#  利用方法
目標を設定またそれらに期間を設定できるようにでき、その過程のタスクだったりメモを残していけるアプリ。

#  目指した課題解決
自己実現欲求に応えるためのアプリです。その上で自己管理が必要不可欠だと私は考えます。しかし、自己管理という言葉は理解できるが、行動として実現できている人は少ないと感じます。そんな人に、アプリひとつで貢献できることを目指しています。

#  制作背景
私自身が高校を卒業して、今の30歳になるまで何かしたい、なりたいと思った事が多々あった。しかし、そのための行動をせず、したとしてもすぐ諦めていた。結果何もないまま今に至る。そんな悩みを抱えている人は少ないかもしれないが、だからこそ自分のようになってほしくないし、変われる力になりたいと考えた事がきっかけです。このツールを使ってユーザーが少しでも自分の進む道を明確にできるようになって欲しいです。

#  開発環境
バックエンド
Ruby, Ruby on Rails
フロントエンド
JavaScript, JQuery
データベース
MySQL
本番環境
Heroku

#  今後実装予定の機能
シェア機能の実装：メモした事や、タスクが完了した時にシェアしたい気持ちが出てくる時があると思います。その時の為にLINEやTwitter、Facebookにシェアできるようにする。
検索機能の実装：メモや、タスクが多くなってくるのは必然だと考えているので、カリキュラム検索の様なヒットする内容を提示する機能の実装を考えています。
googleカレンダーの同期：メモや、タスクがgoogleカレンダーに反映するような実装を考えています。

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
