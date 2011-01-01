class Account < ActiveRecord::Base
  has_many :names
  has_many :nicks
  has_many :sites
  has_many :services
  has_many :portraits
  has_many :books

  ###
  # Import +io+ object that contains a YAML representation of the
  # ruby-committers
  def self.import io
    require 'psych'
    doc = Psych.load io
    doc.each do |record|
      account = Account.create!(:username => record['account'])
      record['name'].each do |name|
        account.names.create!(:value => name)
      end
    end
  end
end
