class BooksController < ApplicationController
  respond_to :json
  
  def index
   render json: [{name: 'My first book'}]
  end
end
