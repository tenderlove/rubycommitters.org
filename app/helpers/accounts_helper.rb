module AccountsHelper
  def link_to_service name, service
    link = case service.name
    when 'twitter'
      'http://twitter.com/' + service.key
    when 'friendfeed'
      'http://friendfeed.com/' + service.key
    when 'mixi'
      'http://mixi.jp/show_friend.pl?id=' + service.key
    when 'github'
      'http://github.com/' + service.key
    when 'facebook'
      if service.key =~ /^\sd+$/
        'http://www.facebook.com/profile.php?id=' + service.key
      else
        'http://www.facebook.com/' + service.key
      end
    when 'iddy'
      'http://iddy.jp/profile/' + service.key
    end

    link_to "#{image_tag("#{name}.ico")} <span>#{name.capitalize}</span>".html_safe, link
  end
end
