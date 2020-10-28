class PostsController < ApplicationController

  def index
  res = Faraday.get "ホスト/api/v1/posts"
  posts = JSON.parse(res.body)
  @posts = []

    posts["data"].count.times do |i|
      @posts << posts["data"][i]
    end
  end

  def show
    res = Faraday.get "ホスト/api/v1/posts/#{params[:id]}"
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
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    Faraday.delete "ホスト/api/v1/posts/#{params[:id]}"
    redirect_to posts_path
  end

end
