module AccountsHelper
  def link_to_service name, service
    case service.name
    when 'twitter'
      link_to name, 'http://twitter.com/' + service.key, :class => 'twitter'
    when 'friendfeed'
      link_to name, 'http://friendfeed.com/' + service.key, :class => 'friendfeed'
    when 'mixi'
      link_to name, 'http://mixi.jp/show_friend.pl?id=' + service.key, :class => 'mixi'
    when 'github'
      link_to name, 'http://github.com/' + service.key, :class => 'github'
    when 'facebook'
      if service.key =~ /^\s*\d+$/
        link_to name, 'http://www.facebook.com/profile.php?id=' + service.key, :class => 'facebook'
      else
        link_to name, 'http://www.facebook.com/' + service.key, :class => 'facebook'
      end
    when 'iddy'
      link_to name, 'http://iddy.jp/profile/' + service.key, :class => 'iddy'
    end
  end
end
