class Service < ActiveRecord::Base
  belongs_to :account

  def base_url
    "http://#{name}.".tap do |base_url|
      if %(iddy mixi).include?(name)
        base_url << 'jp'
      else
        base_url << 'com'
      end

      base_url << '/'
    end
  end

  def icon
    base_url.tap do |url|
      if name == 'iddy'
        url << "image/favicon.png"
      else
        url << "favicon.ico"
      end
    end
  end

  def url
    base_url.tap do |url|
      case name
      when 'facebook'
        if key =~ /^\d+$/
          url << "profile.php?id=#{key}"
        else
          url << key
        end
      when 'friendfeed', 'github', 'twitter'
        url << key
      when 'iddy'
        url << "profile/#{key}"
      when 'mixi'
        url << "show_friend.pl?id=#{key}"
      end
    end
  end
end
