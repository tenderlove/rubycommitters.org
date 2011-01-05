class Hero < ActiveRecord::Base
  has_many :names
  has_many :nicks
  has_many :sites
  has_many :services
  has_many :portraits
  has_many :books

  def self.import(io)
    require 'yaml'

    entries = YAML.load(io)
    entries.each do |entry|
      hero = Hero.create!(:username => entry['account'])

      (entry['name'] || []).each do |name|
        hero.names.create!(:value => name)
      end

      (entry['nick'] || []).each do |name|
        hero.nicks.create!(:value => name)
      end

      (entry['sites'] || []).each do |site|
        hero.sites.create!(
          :title => site['title'],
          :url   => site['url'],
          :lang  => site['lang'],
          :feed  => site['feed']
        )
      end

      (entry['portraits'] || []).each do |portrait|
        hero.portraits.create!(:url => portrait)
      end

      (entry['services'] || []).each do |name, key|
        hero.services.create!(:name => name, :key => key)
      end

      (entry['ruby-books'] || []).each do |isbn|
        hero.books.create!(:isbn => isbn)
      end
    end
  end
end
