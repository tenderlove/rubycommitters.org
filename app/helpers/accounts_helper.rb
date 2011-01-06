module AccountsHelper
  
  # computes user avatar
  def avatar( account )
    return image_tag( 'missing_person.png' ) if account.portraits.empty?
    
    buff = []    
    account.portraits.each do |p|
      buff << image_tag( p.url )
    end
    raw( buff.join( "\n" ) )
  end
  
  # Clean up user name
  def display_name( name )
    name.downcase
  end
  
  def url_to_service( service )
    case service.name
      when 'twitter'
        'http://twitter.com/' + service.key
      when 'friendfeed'
        'http://friendfeed.com/' + service.key
      when 'mixi'
        'http://mixi.jp/show_friend.pl?id=' + service.key
      when 'github'
        'http://github.com/' + service.key
      when 'facebook'
        if service.key =~ /^\s*\d+$/
          'http://www.facebook.com/profile.php?id=' + service.key
        else
          'http://www.facebook.com/' + service.key
        end
      when 'iddy'
        'http://iddy.jp/profile/' + service.key
    end
  end
end
