class Name < ActiveRecord::Base
  belongs_to :account

  def value
    read_attribute(:value).downcase.titleize
  end
end
