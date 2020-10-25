require 'json'

class AssistantUser < ApplicationRecord
  
  def self.get

    url = 'http://localhost:3000/'
    connection = Faraday.new(url: url)
    response = connection.get do |req|
      req.url '/api/v1/users'
    end

    json = JSON.parse(response.body) 
    
  end

end