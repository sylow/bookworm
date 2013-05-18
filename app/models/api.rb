module Api
  class Book
    include HTTParty
    base_uri 'https://www.googleapis.com/books/v1'

    def search(query, options={})
      per_page    = (options[:per_page] || 15).to_i
      page_number = (options[:page_number] || 1).to_i

      self.class.get("/volumes", query: {q: query, key: Api.configuration[:api_key], maxResults: per_page, startIndex: (page_number - 1)* per_page })
    end
  end

  class Configuration
    attr_accessor :api_key
    def [](option)
      send(option)
    end
  end

  class << self
    def configure(silent = false)
       yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
