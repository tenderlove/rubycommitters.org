module AccountsHelper
  def link_to_service name, service
    stringy = service.key.to_s

    case service.name
    when 'twitter'
      link_to name, 'http://twitter.com/' + stringy
    when 'friendfeed'
      link_to name, 'http://friendfeed.com/' + stringy
    when 'mixi'
      link_to name, 'http://mixi.jp/show_friend.pl?id=' + stringy
    when 'github'
      link_to name, 'http://github.com/' + stringy
    when 'facebook'
      if service.key =~ /^\s*\d+$/
        link_to name, 'http://www.facebook.com/profile.php?id=' + stringy
      else
        link_to name, 'http://www.facebook.com/' + stringy
      end
    when 'iddy'
      link_to name, 'http://iddy.jp/profile/' + stringy
    end
  end
end
