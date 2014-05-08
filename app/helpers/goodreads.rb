helpers do
  def make_goodreads
    client = Goodreads::Client.new(:api_key => ENV['GOODREADS_KEY'], :api_secret => ENV['GOODREADS_SECRET'])
    # client = Goodreads.new(:api_key => 'KEY') # short version
    client
  end

  def search_book
    client = make_goodreads
    search = client.search_books('The Lord Of The Rings')
  end
end