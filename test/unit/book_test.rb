require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test 'generate ISBN from key' do
    book = Book.create!(:key => 9780596516178)
    assert_equal '0596516177', book.isbn
  end

  test 'get title from google with ISBN' do
    book = Book.create!(:key => 9780596516178)
    book.get_title_and_url_from_google
    assert_equal 'The Ruby programming language', book.title
    assert_equal 'http://books.google.com/books?id=jcUbTcr5XWwC&printsec=frontcover&dq=0596516177&num=4&client=internal-uds&cd=1&source=uds', book.url
  end

end
