module AccountsHelper
  def link_to_service name, service
    service_url = ""
    case service.name
    when 'twitter'
      service_url = 'http://twitter.com/'
    when 'friendfeed'
      service_url = 'http://friendfeed.com/'
    when 'mixi'
      service_url = 'http://mixi.jp/show_friend.pl?id='
    when 'github'
      service_url = 'http://github.com/'
    when 'facebook'
      if service.key =~ /^\s*\d+$/
        service_url = 'http://www.facebook.com/profile.php?id='
      else
        service_url = 'http://www.facebook.com/'
      end
    when 'iddy'
      service_url = 'http://iddy.jp/profile/'
    end
    link_to " ", service_url + service.key, :class => service.name, :title => service.name unless service_url.empty?
  end
end
