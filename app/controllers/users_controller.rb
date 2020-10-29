class UsersController < ApplicationController
  before_action :start_faraday
  require "json"
  require 'faraday'
  
  def index
    res = @conn.get "/api/v1/users"
    users = JSON.parse(res.body)
    @users = []

    users['data'].count.times do |i|
      @users << users["data"][i]
    end
  end

  def show
    res = @conn.get "/api/v1/users/#{params[:id]}"
    res_body = JSON.parse(res.body)

    @id = res_body["data"]["id"]
    @name = res_body["data"]["name"]
    @email = res_body["data"]["email"]
  end

  def new
    @conn.get "/api/v1/users/new"
  end

  def create
    @conn.post "/api/v1/users",{
      name: params[:name], 
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image: params[:image],
      remove_image: params[:remove_image],
    }
    redirect_to users_path
  end

  def edit
    res = @conn.get "/api/v1/users/#{params[:id]}"
    res_body = JSON.parse(res.body)

    @name = res_body["data"]["name"]
    @email = res_body["data"]["email"]
  end

  def update
    @conn.put "/api/v1/users/#{params[:id]}",{
      name: params[:name], 
      email: params[:email],
    }
    redirect_to users_path
  end

  def destroy
    @conn.delete "/api/v1/users/#{params[:id]}"
    redirect_to users_path
  end

  private
      def start_faraday
        @conn = Faraday.new 'ホスト名'
      end

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