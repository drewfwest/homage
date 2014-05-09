post '/books' do
  @books = Services::Goodreads.new(params[:title])
  content_type :JSON
  {result: (erb :_book_reference ,layout: false)}.to_json
end

# results = API::Goodreads.new(query)
# results.book_images



# Services::Goodreads

# module Services



# class Services::Goodreads
#   def initialize(query)
#     client = Goodreads::Client.new(:api_key => ENV['GOODREADS_KEY'], :api_secret => ENV['GOODREADS_SECRET'])
#     @results = client.search_books('The Lord Of The Rings')
#   end

#   def cover_images
#     @results.results.work.map do |book|
#       book.best_book.small_image_url
#     end
#     bookcovers.reject{ |image| image == NO_COVER}
#   end

#   def book_titles

#   end



# end

# controller
# post '' do
#   @books = Services::Goodreads.new(query)
#   render
# end

# view
#   <% @books.each do |book| %>
#     = partial '/shared/book', locals: {book: book}


# partial
#  <h1>= book.title
#  <p>=book.content


