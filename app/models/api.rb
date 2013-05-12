module Api
  class Book
    include HTTParty
    base_uri 'https://www.googleapis.com/books/v1'

    def initialize(api_key)
      @api_key = api_key
    end
  
    def search(query, options={})
      per_page = options[:per_page] || 18
      self.class.get("/volumes", query: {q: query, key: @api_key, maxResults: per_page })
    end
  end
end