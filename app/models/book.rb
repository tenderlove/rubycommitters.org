require 'json'
require 'net/http'

class Book < ActiveRecord::Base
  belongs_to :account

  scope :with_titles, where('title is not null')

  before_validation :generate_ISBN

  def self.import_info_from_google
    all.each do |book|
      next if book.title.present? && book.url.present?
      book.get_title_and_url_from_google
      book.save!
    end
  end

  def get_title_and_url_from_google
    google_book = search_google_for_isbn
    if google_book
      self.title = google_book['title']
      self.url = google_book['unescapedUrl']
    else
      puts "***Google Books could not find book with ISBN #{isbn}. Skipping."
    end
  end

  private

  def generate_ISBN
    isbn10 = key.to_s[3..11]
    check_digit = 0
    isbn10.split(//).each_with_index do |c, i|
      check_digit += c.to_i * (10 - i)
    end
    check_digit = 11 - (check_digit % 11)
    check_digit = case check_digit
                  when 10; "X"
                  when 11; 0
                  else;    check_digit
                  end
    isbn10 = "#{isbn10}#{check_digit}"
    self.isbn = isbn10
  end

  def search_google_for_isbn
    host = 'https://ajax.googleapis.com'
    Net::HTTP.start(URI.parse(host).host) do |http|
      response = http.request_get('/ajax/services/search/books?v=1.0&q=' + isbn)
      json = JSON.parse(response.body)
      json['responseData']['results'].detect do |book|
        book['bookId'] == "ISBN#{isbn}"
      end
    end
  end
end
