require 'spec_helper'

describe Services::Goodreads, ".initialize" do
  it "sets a response of an array of books" do
    goodreads_api = Services::Goodreads.new('Lord of the Rings')

    expect(goodreads_api.response).to be
  end
end

describe Services::Goodreads, '#covers' do
  it 'is a list of the bookcover image urls' do
    goodreads_api = Services::Goodreads.new('Lord of the Rings')

    expect(goodreads_api.covers).to eq ["http://d.gr-assets.com/books/1298415523s/15241.jpg",
                                        "http://d.gr-assets.com/books/1298411339s/34.jpg",
                                        "http://d.gr-assets.com/books/1346072396s/30.jpg",
                                        "http://d.gr-assets.com/books/1389977161s/18512.jpg",
                                        "http://d.gr-assets.com/books/1309287397s/15348.jpg",
                                        "http://d.gr-assets.com/books/1308664236s/15404.jpg"]
  end
end