module AccountsHelper
  def link_to_service name, service
    case service.name
    when 'twitter'
      link_to name, 'http://twitter.com/' + service.key, :title => 'Twitter', :class => 'tool_tip'
    when 'friendfeed'
      link_to name, 'http://friendfeed.com/' + service.key, :title => 'FriendFeed'
    when 'mixi'
      link_to name, 'http://mixi.jp/show_friend.pl?id=' + service.key, :title => 'Mixi'
    when 'github'
      link_to name, 'http://github.com/' + service.key, :title => 'Github'
    when 'facebook'
      if service.key =~ /^\sd+$/
        link_to name, 'http://www.facebook.com/profile.php?id=' + service.key, :title => 'Facebook'
      else
        link_to name, 'http://www.facebook.com/' + service.key, :title => 'Facebook'
      end
    when 'iddy'
      link_to name, 'http://iddy.jp/profile/' + service.key, :title => 'Iddy'
    end
  end
end
