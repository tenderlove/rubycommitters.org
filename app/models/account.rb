class Account < ActiveRecord::Base
  has_many :names
  has_many :nicks
  has_many :sites
  has_many :services
  has_many :portraits
  has_many :books
  
  has_friendly_id :username, :use_slug => true
  ###
  # Import +io+ object that contains a YAML representation of the
  # ruby-committers
  def self.import io
    begin
      require 'psych'
      yamler = Psych
    rescue LoadError
      require 'yaml'
      yamler = YAML
    end

    doc = yamler.load io
    doc.each do |record|
      account = Account.create!(:username => record['account'])
      (record['name'] || []).each do |name|
        account.names.create!(:value => name)
      end

      (record['nick'] || []).each do |name|
        account.nicks.create!(:value => name)
      end

      (record['sites'] || []).each do |site|
        account.sites.create!(
          :title => site['title'],
          :url   => site['url'],
          :lang  => site['lang'],
          :feed  => site['feed']
        )
      end

      (record['portraits'] || []).each do |portrait|
        account.portraits.create!(:url => portrait)
      end

      (record['services'] || []).each do |name, key|
        account.services.create!(:name => name, :key => key)
      end

      (record['ruby-books'] || []).each do |key|
        account.books.create!(:key => key)
      end
    end
  end
end
