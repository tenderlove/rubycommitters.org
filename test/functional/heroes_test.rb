# coding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class HeroTest < Test::Unit::TestCase
  def test_get_index
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('Matz')
  end
end