class UsersController < ApplicationController

  require "json"
  
  def index

    # シンプルな形
    # res = Faraday.get "ホスト名/api/v1/users"
    # @users = JSON.parse(res.body)

    # 基本形
    # res = Faraday.get "ホスト名/api/v1/users"
    # res_body = JSON.parse(res.body)
    # @users = res_body

    # ユーザー毎に取得 → ユーザー毎の情報を取得できているが、途中までしか取得できていない
    res = Faraday.get "ホスト名/api/v1/users"
    users = JSON.parse(res.body)
    @users = []

    users['data'].count.times do |i|
      @users << users["data"][i]
    end

    # 各要素を取得
    # res = Faraday.get "ホスト名/api/v1/users"
    # res_body = JSON.parse(res.body)
    # @name = res_body["data"][0]["name"]
    # @id = res_body["data"][0]["id"]
    # @email = res_body["data"][0]["email"]

    # 各要素を取得して空の配列に代入
    # res = Faraday.get "ホスト名/api/v1/users"
    # users = JSON.parse(res.body)

    # @user_names = []
    # @user_ids = []
    # @user_emails = []

    # users.count.times do |i|
    #   @user_names << users["data"][i]["name"]
    #   @user_ids << users["data"][i]["id"]
    #   @user_emails << users["data"][i]["email"]
    # end

    # @user_data = @user_names, @user_ids, @user_emails

  end

  def show
    # users > index.html.erbで指定したuser_path(user['id']を#{params[:id]}で受け取る
    res = Faraday.get "ホスト名/api/v1/users/#{params[:id]}"
    @user = JSON.parse(res.body)
    
  end

  def edit
    res = Faraday.get "ホスト名/api/v1/users/#{params[:id]}"
    @user = JSON.parse(res.body)
  end

  def update
    req = Faraday.put "ホスト名/api/v1/users/#{params[:id]}"
    body = {
      "user": {
        "name": "hoge"
        "email" : 
      }
    }.to_json

    req.body = body
  end

end
