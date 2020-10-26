class UsersController < ApplicationController

  require "json"
  
  def index
    res = Faraday.get "ホスト名/api/v1/users"
    users = JSON.parse(res.body)
    @users = []

    users['data'].count.times do |i|
      @users << users["data"][i]
    end
  end

  def show
    res = Faraday.get "ホスト名/api/v1/users/#{params[:id]}"
    res_body = JSON.parse(res.body)

    @id = res_body["data"]["id"]
    @name = res_body["data"]["name"]
    @email = res_body["data"]["email"]
  end

  def edit
    res = Faraday.get "ホスト名/api/v1/users/#{params[:id]}"
    @user = JSON.parse(res.body)
  end

  def update
    # req = Faraday.put "ホスト名/api/v1/users/#{params[:id]}"
    # body = {
    #   "user": {
    #     "name": "hoge"
    #     "email" : 
    #   }
    # }.to_json

    # req.body = body
  end

end
