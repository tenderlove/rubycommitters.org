module AccountsHelper
  def link_to_service(name, service)
    url = service_url_for(service)

    case service.name
    when 'facebook'
      if service.key =~ /^\s*\d+$/
        url << "profile.php?id=#{service.key}"
      else
        url << service.key
      end
    when 'friendfeed', 'github', 'twitter'
      url << service.key
    when 'iddy'
      url << "profile/#{service.key}"
    when 'mixi'
      url << "show_friend.pl?id=#{service.key}"
    end

    link_to favicon_for(service), url
  end

  private

  def service_url_for(service)
    "http://#{service.name}.".tap do |url|
      if %(iddy mixi).include?(service.name)
        url << 'jp'
      else
        url << 'com'
      end

      url << '/'
    end
  end

  def favicon_for(service)
    url = service_url_for(service)

    if service.name == 'iddy'
      url << "image/favicon.png"
    else
      url << "favicon.ico"
    end

    image_tag(url)
  end
end
