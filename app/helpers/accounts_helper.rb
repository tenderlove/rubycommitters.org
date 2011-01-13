module AccountsHelper

  def link_to_service service
    image = image_tag "#{service.name}.png", class: 'service'
    case service.name
    when 'twitter'
      link_to image, 'http://twitter.com/' + service.key
    when 'friendfeed'
      link_to image, 'http://friendfeed.com/' + service.key
    when 'mixi'
      link_to image, 'http://mixi.jp/show_friend.pl?id=' + service.key
    when 'github'
      link_to image, 'http://github.com/' + service.key
    when 'facebook'
      if service.key =~ /^\s*\d+$/
        link_to image, 'http://www.facebook.com/profile.php?id=' + service.key
      else
        link_to image, 'http://www.facebook.com/' + service.key
      end
    when 'iddy'
      link_to image, 'http://iddy.jp/profile/' + service.key
    end
  end

  def link_to_site(site)
    link_to site.title, site.url
  end

  def link_to_book(book)
    link_to book.isbn, book.key
  end

  def service_image(service_name)
    "#{service_name}.png"
  end

end
