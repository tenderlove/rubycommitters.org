class Account < ActiveRecord::Base
  has_many :names
  has_many :nicks
  has_many :sites
  has_many :services
  has_many :portraits
  has_many :books
end
