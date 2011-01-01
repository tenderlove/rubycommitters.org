module AccountsHelper
  def link_to_service name, service
    case service.name
    when 'twitter'
      link_to name, 'http://twitter.com/' + service.key
    when 'friendfeed'
      link_to name, 'http://friendfeed.com/' + service.key
    when 'mixi'
      link_to name, 'http://mixi.jp/show_friend.pl?id=' + service.key
    when 'github'
      link_to name, 'http://github.com/' + service.key
    when 'facebook'
      if service.key =~ /^\sd+$/
        link_to name, 'http://www.facebook.com/profile.php?id=' + service.key
      else
        link_to name, 'http://www.facebook.com/' + service.key
      end
    when 'iddy'
      link_to name, 'http://iddy.jp/profile/' + service.key
    end
  end
end
