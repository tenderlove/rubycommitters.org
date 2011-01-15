class Service < ActiveRecord::Base
  belongs_to :account

  def url
    case name
    when 'twitter'
      'http://twitter.com/' + key
    when 'friendfeed'
      'http://friendfeed.com/' + key
    when 'mixi'
      'http://mixi.jp/show_friend.pl?id=' + key
    when 'github'
      'http://github.com/' + key
    when 'facebook'
      if key =~ /^\s*\d+$/
        'http://www.facebook.com/profile.php?id=' + key
      else
        'http://www.facebook.com/' + key
      end
    when 'iddy'
      'http://iddy.jp/profile/' + key
    end
  end
end
