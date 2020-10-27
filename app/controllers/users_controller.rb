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

  def new
  end

  def create
  end

  def edit
    res = Faraday.get "ホスト名/api/v1/users/#{params[:id]}"
    res_body = JSON.parse(res.body)

    @name = res_body["data"]["name"]
    @email = res_body["data"]["email"]
  end

  def update
    req = Faraday.put "ホスト名/api/v1/users/#{params[:id]}"
    data = {
      "user": {
        "name" => "#{params[:name]}",
        "email" => "#{params[:email]}",
      }
    }.to_json

    req.body = data
  end

  def destroy
    Faraday.delete "ホスト名/api/v1/users/#{params[:id]}"
    redirect_to users_path
  end

  private
      def user_params
        params.require(:user).permit(
            :name,
            :email, 
          )
      end


  # def update_customer(user_id, customer_id, body)
  #   res = @connection.put do |req|
  #     req.url("/admin/api/2020-07/customers/#{customer_id}.json")
  #     req.headers["Content-Type"] = "application/json"
  #     req.body = body
  #   end
  #   check_response_status(__method__, user_id, customer_id, res)
  # end

end
