RubyCommitters.helpers do
  def link_to_service(name, service)
    _link_to = Proc.new { |url| link_to service.name, url + service.key, :alt => service.name, :title => service.name }

    case service.name
      when 'twitter'    then _link_to.call('http://twitter.com/')
      when 'friendfeed' then _link_to.call('http://friendfeed.com/')
      when 'mixi'       then _link_to.call('http://show_friend.pl?id=')
      when 'github'     then _link_to.call('http://github.com/')
      when 'iddy'       then _link_to.call('http://iddy.jp/profile/')
      when 'facebook'   then _link_to.call("http://www.facebook.com/#{'profile.php?id=' if service.key =~ /^\d+$/}")
    end
  end

  def link_to_book(isbn)
    link_to isbn, 'http://books.google.com/books?as_isbn=' + isbn
  end

  def markdownsize(text)
    RDiscount.new(text, :autolink).to_html
  end
end