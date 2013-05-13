module  Api
  module V1
    class BooksController < ApplicationController
      respond_to :json
      caches_action :index, :cache_path =>Proc.new { |c| c.params.delete_if { |k,v| [:keywords, :page].include?(k) } }
  
      def index    
        render json: self.search["items"]
      end
    
      def search
        keywords  = params[:keywords].presence || "Ruby on Rails" #defaults to Ruby on Rails
        Api::Book.new.search(keywords)
      end
    end
  end
end