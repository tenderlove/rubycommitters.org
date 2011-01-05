class Portrait < ActiveRecord::Base
  belongs_to :account
end

# == Schema Information
#
# Table name: portraits
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  account_id :integer
#  created_at :datetime
#  updated_at :datetime
#

