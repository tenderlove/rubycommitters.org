class Book < ActiveRecord::Base
  belongs_to :account
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

