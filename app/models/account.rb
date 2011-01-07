class Account < ActiveRecord::Base
  SERVICES = %w(facebook friendfeed github iddy mixi twitter).freeze

  has_many :names
  has_many :portraits
  has_many :services

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
