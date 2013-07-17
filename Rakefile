require 'erb'
require 'account'
require 'pathname'

module Rails
  def self.root
    Pathname.new File.dirname __FILE__
  end
end

class WEBSITE
  attr_accessor :fox_count

  def initialize
    @fox_count = 0
    @locals = {}
  end

  def accounts
    Account.import File.open 'ruby-committers.yml'
  end

  def stylesheet_link_tag ogm
    "<style>\n" +
    File.read('public/stylesheets/site.css') +
    "</style>\n"
  end

  def get_binding
    binding
  end

  def link_to text, url
    "<a href=\"#{url}\">#{h text}</a>".untaint
  end

  def h string
    if string.tainted?
      string = ERB::Util.h string
    end

    string.untaint
  end

  def image_tag src, attributes = {}
    attrs = attributes.map { |k,v|
      v = "\"#{h v}\""
      [k, v].join "="
    }

    if attrs.any?
      "<img src=\"images/#{src}\" #{attrs.join " "} />".untaint
    else
      "<img src=\"images/#{src}\" />".untaint
    end
  end

  def render options
    partial    = options[:partial]
    collection = options[:collection]

    collection.map { |object|
      @locals[partial.to_s] = object
      filename = "app/views/accounts/_#{partial}.html.erb"
      erb = ERB.new File.read(filename), 0, '<>-'
      erb.filename = filename
      erb.result binding
    }.join
  end

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

  def method_missing name, *args
    super unless @locals.key? name.to_s
    @locals[name.to_s]
  end
end

task :website do
  erb = ERB.new File.read('app/views/layouts/application.html.erb')
  ws = WEBSITE.new
  binding = ws.get_binding do
    fn = 'app/views/accounts/index.html.erb'
    inner = ERB.new File.read(fn)
    inner.filename = fn
    inner.result(ws.get_binding)
  end
  puts erb.result(binding)
end
