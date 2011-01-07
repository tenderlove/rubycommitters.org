class Account < ActiveRecord::Base
  SERVICES = %w(facebook friendfeed github iddy mixi twitter).freeze

  has_many :names do
    def in_english
      select { |record| record.value =~ /^[\09\0A\0D\x20-\x7E]+$/ui }
    end

    def in_japanese
      select { |record| record.value !~ /^[\09\0A\0D\x20-\x7E]+$/ui }
    end
  end
  has_many :portraits
  has_many :services do
    def by_name(name)
      select { |record| record.name == name }.first
    end
  end

  def avatar
    portraits.first
  end

  def name
    name   = names.in_japanese.first unless I18n.locale == :en
    name ||= names.in_english.first

    if name
      name.value
    else
      username
    end
  end
end
