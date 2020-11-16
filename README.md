## アプリ概要

本体アプリ （https://github.com/T-unity/seamless） の管理画面アプリです。

本体とAPIで連携、リクエストを送り本体からjson形式でデータを取得します。

- 本体アプリのレスポンス部分 : https://github.com/T-unity/seamless/tree/master/app/controllers/api/v1
- 管理画面アプリのリクエスト部分 : https://github.com/T-unity/admin-system/tree/master/app/controllers
(users_dontroller.rb と posts_controller.rb です。)


## このアプリでできること

- 本体アプリで登録されているユーザーのCRUD
- 本体アプリ側の投稿のCRUD

![スクリーンショット 2020-11-16 20 51 06](https://user-images.githubusercontent.com/68691468/99282983-bce0cb00-2877-11eb-8f2b-b8d0d65bcfb4.png)

## 使用技術

### バックエンド

- Ruby 2.7.1
- Rails 6.0.3
- MySQL 5.7
- Puma ~> 3.11
- Nginx 1.15.8

### フロントエンド

- AdminLTE（Bootstrap）

### 開発環境

- Docker,docker-compose
- git,Github
- Postman
- ngrok

### 今後の課題

- 認証機能を実装し、ログインした管理者のみ管理画面機能を使える状態にする
- より実用的な管理画面にする（登録ユーザーに対してアップデート情報を一斉送信するなど）
