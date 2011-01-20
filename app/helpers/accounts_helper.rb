module AccountsHelper
  def link_to_service name, service, options = {}
    case service.name
    when 'twitter'
      link_to name, 'http://twitter.com/' + service.key, options
    when 'friendfeed'
      link_to name, 'http://friendfeed.com/' + service.key, options
    when 'mixi'
      link_to name, 'http://mixi.jp/show_friend.pl?id=' + service.key, options
    when 'github'
      link_to name, 'http://github.com/' + service.key, options
    when 'facebook'
      if service.key =~ /^\s*\d+$/
        link_to name, 'http://www.facebook.com/profile.php?id=' + service.key, options
      else
        link_to name, 'http://www.facebook.com/' + service.key, options
      end
    when 'iddy'
      link_to name, 'http://iddy.jp/profile/' + service.key, options
    end
  end
end
