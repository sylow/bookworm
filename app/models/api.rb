module Api
  class Book
    include HTTParty
    base_uri 'https://www.googleapis.com/books/v1'

    def initialize(opts={})
      @api_key = opts[:api_key]
    end
  
    def search(query, opts={})
      self.class.get("/volumes", query: {q: query, key: @api_key, maxResults: 16 })
    end
  end
end