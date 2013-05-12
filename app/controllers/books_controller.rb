class BooksController < ApplicationController
  respond_to :json
  
  def index    
    render json: self.search["items"]
  end
  
  def search
    Rails.cache.fetch("search", :expires_in => 8.hours) do
      Api::Book.new(api_key: 'AIzaSyAeFaVAXMz1RJv8om1VLIhdw83iQeWl4vI').search("Ruby on Rails")
    end
  end
end
