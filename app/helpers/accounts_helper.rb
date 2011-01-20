module AccountsHelper
  def link_to_service name, service
    case service.name
    when 'twitter'
      link_to image_tag("Twitter.png", :alt => 'Twitter'), 'http://twitter.com/' + service.key
    when 'friendfeed'
      link_to image_tag("Friendfeed.png", :alt => 'FriendFeed'), 'http://friendfeed.com/' + service.key
    when 'mixi'
      link_to image_tag("Mixi.png", :alt => 'Mixi'), 'http://mixi.jp/show_friend.pl?id=' + service.key
    when 'github'
      link_to image_tag("Github.png", :alt => 'Github'), 'http://github.com/' + service.key
    when 'facebook'
      if service.key =~ /^\s*\d+$/
        link_to image_tag("Facebook.png", :alt => 'Facebook'), 'http://www.facebook.com/profile.php?id=' + service.key
      else
        link_to image_tag("Facebook.png", :alt => 'Facebook'), 'http://www.facebook.com/' + service.key
      end
    when 'iddy'
      link_to image_tag("Iddy.png", :alt => 'Iddy'), 'http://iddy.jp/profile/' + service.key
    end
  end
  
  def formatted_nickname(name)
    '"' + name + '"'
  end
end
