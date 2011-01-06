class Account < ActiveRecord::Base
  has_many :names
  has_many :nicks
  has_many :sites
  has_many :services
  has_many :portraits
  has_many :books

  SERVICES = %w(facebook friendfeed github iddy mixi twitter).freeze
  SERVICES.each do |service|
    define_method(service) do
      services.find_by_name(service)
    end
  end

  def name
    if names.any?
      names.last.value.titleize
    elsif nicks.any?
      nicks.first.value
    else
      username
    end
  end

  ###
  # Import +io+ object that contains a YAML representation of the
  # ruby-committers
  def self.import(io)
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
