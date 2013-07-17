class Account
  attr_accessor :username
  attr_reader :names, :nicks, :sites, :portraits, :services, :books

  Name     = Struct.new :value
  Nick     = Struct.new :value
  Site     = Struct.new :title, :url, :lang, :feed
  Portrait = Struct.new :url
  Service  = Struct.new :name, :key
  Book     = Struct.new :key, :isbn

  def initialize username
    @username  = username
    @names     = []
    @nicks     = []
    @sites     = []
    @portraits = []
    @services  = []
    @books  = []
  end

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

    list = yamler.load io
    list.map do |record|
      account = Account.new record['account']

      (record['name'] || []).each do |name|
        account.names << Name.new(name)
      end

      (record['nick'] || []).each do |name|
        account.nicks << Nick.new(name)
      end

      (record['sites'] || []).each do |site|
        account.sites << Site.new(
          site['title'],
          site['url'],
          site['lang'],
          site['feed'])
      end

      (record['portraits'] || []).each do |portrait|
        account.portraits << Portrait.new(portrait)
      end

      (record['services'] || []).each do |name, key|
        account.services << Service.new(name, key)
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
        account.books << Book.new(key, isbn10)
      end

      account
    end
  end
end
