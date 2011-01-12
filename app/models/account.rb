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
        isbn10 = key[3..11]
        check_digit = 0
        isbn10.split(//).each_with_index do |c, i|
          check_digit += c.to_i * (10 - i)
        end
        check_digit = 11 - (check_digit % 11)
        check_digit = case check_digit
                      when 10; "X"
                      when 11; 0
                      else;    check_digit
                      end
        isbn10 = "#{isbn10}#{check_digit}"
        account.books.create!(:key => key, :isbn => isbn10)
      end
    end
  end
end
