require 'open-uri'

desc "find & store the book titles"
task :book_titles => :environment do
  Book.all.each do |book|
    api_url = "http://isbndb.com/api/books.xml?access_key=AIDOFPMK&index1=isbn&value1="
    if book.value.blank?
      api_url += book.key
      Book.add_title open(api_url), book
    end
  end
end
