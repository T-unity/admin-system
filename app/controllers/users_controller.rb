class UsersController < ApplicationController
  require "json"
  require 'faraday'
  
  def index
    res = Faraday.get "ホスト/api/v1/users"
    users = JSON.parse(res.body)
    @users = []

    users['data'].count.times do |i|
      @users << users["data"][i]
    end
  end

  def show
    res = Faraday.get "ホスト/api/v1/users/#{params[:id]}"
    res_body = JSON.parse(res.body)

    @id = res_body["data"]["id"]
    @name = res_body["data"]["name"]
    @email = res_body["data"]["email"]
  end

  def new
    Faraday.get "ホスト/api/v1/users/new"
  end

  def create
    # 値を決め打ちで指定するとPOSTできる→フォームからの値を取得できていない
    Faraday.post "ホスト/api/v1/users",{
      name: params[:name], 
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image: params[:image],
      remove_image: params[:remove_image],
    }
    redirect_to users_path

    # 値を固定→フォームに値を入力しなくてもPOSTできる
    # Faraday.post "ホスト/api/v1/users",{
    #   name: "テスト", 
    #   email: "#{SecureRandom.base64(6)}@example.com",
    #   password: "hogehoge",
    #   password_confirmation: "hogehoge",
    #   image: params[:image],
    #   remove_image: params[:remove_image],
    # }
    # redirect_to users_path
  end

  def edit
    res = Faraday.get "ホスト/api/v1/users/#{params[:id]}"
    res_body = JSON.parse(res.body)

    @name = res_body["data"]["name"]
    @email = res_body["data"]["email"]
  end

  def update
    req = Faraday.put "ホスト/api/v1/users/#{params[:id]}"
    data = {
      "user": {
        "name" => "#{params[:name]}",
        "email" => "#{params[:email]}",
      }
    }.to_json

    req.body = data
  end

  def destroy
    Faraday.delete "ホスト/api/v1/users/#{params[:id]}"
    redirect_to users_path
  end

  private
      def user_params
        params.require(:user).permit(
          :name,
          :email, 
          :email_confirmation,
          :password, 
          :password_confirmation,
          :image,
          :remove_image
          )
      end

end
