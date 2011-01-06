class Hero < ActiveRecord::Base
  has_many :names
  has_many :nicks
  has_many :sites
  has_many :services
  has_many :portraits
  has_many :books

  def self.import(io)
    require 'yaml'
    require 'open-uri'

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

      if entry['portraits']
        entry['portraits'].each do |url|
          portrait = hero.portraits.create!(:url => url)
          begin
            portrait.remote_file_url = URI.unescape(url) # caters for utf-8 strings
            portrait.save!
          rescue OpenURI::HTTPError => e
            puts e.message
            puts "Error retrieving #{url}"
          end
        end
      else
        # creates a dummy portrait entry so that Carrierwave could fallback
        hero.portraits.create!(:url => "")
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
