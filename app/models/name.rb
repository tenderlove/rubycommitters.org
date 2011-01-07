class Name < ActiveRecord::Base
  belongs_to :account

  scope :in_english,  :conditions => 'octet_length(value) = char_length(value)'
  scope :in_japanese, :conditions => 'octet_length(value) <> char_length(value)'

  def value
    read_attribute(:value).downcase.titleize
  end
end
