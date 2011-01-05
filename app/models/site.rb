class Site < ActiveRecord::Base
  belongs_to :account
end

# == Schema Information
#
# Table name: sites
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  url        :string(255)
#  feed       :string(255)
#  lang       :string(255)
#  account_id :integer
#  created_at :datetime
#  updated_at :datetime
#

