class PostsController < ApplicationController

  def index

  res = Faraday.get "ホスト名/api/v1/posts"
  posts = JSON.parse(res.body)
  @posts = []

    posts.count.times do |i|
      @posts << posts["data"][i]
    end
    
  end

end
