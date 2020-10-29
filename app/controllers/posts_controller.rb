class PostsController < ApplicationController
  before_action :start_faraday
  require "json"
  require 'faraday'

  def index
  res = @conn.get "/api/v1/posts"
  posts = JSON.parse(res.body)
  @posts = []

    posts["data"].count.times do |i|
      @posts << posts["data"][i]
    end
  end

  def show
    res = @conn.get "/api/v1/posts/#{params[:id]}"
    res_body = JSON.parse(res.body)

    @id = res_body["data"]["id"]
    @title = res_body["data"]["title"]
    @about = res_body["data"]["about"]
    @job, = res_body["data"]["job,"]
    @skill = res_body["data"]["skill"]
    @frequency = res_body["data"]["frequency"]
    @treat = res_body["data"]["treat"]
    @other = res_body["data"]["other"]
    @image = res_body["data"]["image"]
  end

  def new
    @conn.get "/api/v1/posts/new"
  end

  def create
    @conn.post "/api/v1/posts",{
      title: params[:title],
      about: params[:about],
      job: params[:job],
      skill: params[:skill],
      frequency: params[:frequency],
      treat: params[:treat],
      other: params[:other],
      image: params[:image],
    }
    redirect_to posts_path
  end

  def edit
    res = @conn.get "/api/v1/posts/#{params[:id]}"
    res_body = JSON.parse(res.body)

    @id = res_body["data"]["id"]
    @title = res_body["data"]["title"]
    @about = res_body["data"]["about"]
    @job, = res_body["data"]["job"]
    @skill = res_body["data"]["skill"]
    @frequency = res_body["data"]["frequency"]
    @treat = res_body["data"]["treat"]
    @other = res_body["data"]["other"]
    @image = res_body["data"]["image"]
  end

  def update
    @conn.put "/api/v1/posts/#{params[:id]}",{
      title: params[:title],
      about: params[:about],
      job: params[:job],
      skill: params[:skill],
      frequency: params[:frequency],
      treat: params[:treat],
      other: params[:other],
      image: params[:image],
    }
    redirect_to posts_path
  end

  def destroy
    @conn.delete "/api/v1/posts/#{params[:id]}"
    redirect_to posts_path
  end

  private
      def start_faraday
        @conn = Faraday.new 'ホスト名'
      end

end
