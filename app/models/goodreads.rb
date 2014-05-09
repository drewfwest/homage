module Services
  class Goodreads
    attr_reader :response
    NO_COVER = "http://www.goodreads.com/assets/nocover/60x80.png"

    def initialize(query)
      client = ::Goodreads::Client.new(:api_key => ENV['GOODREADS_KEY'], :api_secret => ENV['GOODREADS_SECRET'])
      @response = client.search_books(query)
    end

    def covers
      response.results.work.map{|book| book.best_book.small_image_url}.reject do |image|
        image == NO_COVER
      end
    end

    def titles
    end
  end
end


