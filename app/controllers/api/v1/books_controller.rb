module  Api
  module V1
    class BooksController < ApplicationController
      respond_to :json
      caches_action :index, :cache_path =>Proc.new { |c| c.params.delete_if { |k,v| [:keywords, :page].include?(k) } }

      def index
        keywords    = params[:keywords].presence || "Ruby on Rails"
        page_number = (params[:page] || 1).to_i
        result      = Api::Book.new.search(keywords, {page_number: page_number})
        render json: result
      end
    end
  end
end
