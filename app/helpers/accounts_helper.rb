module AccountsHelper
  def link_to_service name, service
    url = case service.name
    when 'twitter'
      'http://twitter.com/'
    when 'friendfeed'
      'http://friendfeed.com/'
    when 'mixi'
      'http://mixi.jp/show_friend.pl?id='
    when 'github'
      'http://github.com/'
    when 'facebook'
      if service.key =~ /^\s*\d+$/
        'http://www.facebook.com/profile.php?id='
      else
       'http://www.facebook.com/'
      end
    when 'iddy'
      'http://iddy.jp/profile/'
    end
    link_to name, url + service.key, :class => name
  end
end
