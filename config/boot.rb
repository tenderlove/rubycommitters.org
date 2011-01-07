require 'rubygems'

ENV['BUNDLE_GEMFILE'] = File.expand_path('../../Gemfile', __FILE__)

begin
  require 'bundler'
  Bundler.setup
rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts 'Try running `bundle install`.'
  exit!
end if File.exist?(ENV['BUNDLE_GEMFILE'])
