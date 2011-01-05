class Book < ActiveRecord::Base
  belongs_to :account
  
  default_scope where(['value != ?', "No title found"])
  
  def self.add_title xml, book
    res = Crack::XML.parse(xml)
    possible_book = res["ISBNdb"]["BookList"]
    if possible_book["BookData"]
      title = possible_book["BookData"]["Title"]
    else
      title = "No title found"
    end
    book.update_attribute('value', title)
  end
end

# == Schema Information
#
# Table name: books
#
#  id         :integer         not null, primary key
#  key        :string(255)
#  account_id :integer
#  created_at :datetime
#  updated_at :datetime
#

