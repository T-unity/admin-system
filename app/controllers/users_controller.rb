class UsersController < ApplicationController

  require "json"
  
  def index
    res = Faraday.get "https://762ba92e07c0.ngrok.io/api/v1/users"
    users = JSON.parse(res.body)
    @users = []

    users['data'].count.times do |i|
      @users << users["data"][i]
    end
  end

  def show
    res = Faraday.get "https://762ba92e07c0.ngrok.io/api/v1/users/#{params[:id]}"
    @user = JSON.parse(res.body)
  end

  def edit
    res = Faraday.get "https://762ba92e07c0.ngrok.io/api/v1/users/#{params[:id]}"
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
