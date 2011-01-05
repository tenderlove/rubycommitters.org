class Service < ActiveRecord::Base
  belongs_to :account
end

# == Schema Information
#
# Table name: services
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  key        :string(255)
#  account_id :integer
#  created_at :datetime
#  updated_at :datetime
#

