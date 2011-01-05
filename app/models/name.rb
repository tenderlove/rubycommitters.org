class Name < ActiveRecord::Base
  belongs_to :account
end

# == Schema Information
#
# Table name: names
#
#  id         :integer         not null, primary key
#  value      :string(255)
#  account_id :integer
#  created_at :datetime
#  updated_at :datetime
#

