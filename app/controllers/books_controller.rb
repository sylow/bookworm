class BooksController < ApplicationController
  respond_to :json
  
  def index    
    render json: self.search["items"]
  end
  
  def search
    keywords = params[:keywords].presence || "Ruby on Rails"
    Rails.cache.fetch("search-#{keywords}", :expires_in => 8.hours) do
      Api::Book.new('AIzaSyAeFaVAXMz1RJv8om1VLIhdw83iQeWl4vI').search(keywords)
    end
  end
end
