# coding: utf-8

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  fixtures :accounts, :services

  def setup
    @matz = accounts(:matz)
    @iddy = services(:iddy)
    @mixi = services(:mixi)
    @github = services(:github)
    @twitter = services(:twitter)
    @facebook = services(:facebook)
    @friendfeed = services(:friendfeed)
    @facebook_username = services(:facebook_username)
  end

  def test_belongs_to_account
    assert_equal @matz, @twitter.account
  end

  def test_base_url
    assert_equal "http://iddy.jp/", @iddy.base_url
    assert_equal "http://mixi.jp/", @mixi.base_url
    assert_equal "http://github.com/", @github.base_url
    assert_equal "http://twitter.com/", @twitter.base_url
    assert_equal "http://facebook.com/", @facebook.base_url
    assert_equal "http://friendfeed.com/", @friendfeed.base_url
  end

  def test_icon
    assert_equal "http://iddy.jp/image/favicon.png", @iddy.icon
    assert_equal "http://mixi.jp/favicon.ico", @mixi.icon
    assert_equal "http://github.com/favicon.ico", @github.icon
    assert_equal "http://twitter.com/favicon.ico", @twitter.icon
    assert_equal "http://facebook.com/favicon.ico", @facebook.icon
    assert_equal "http://friendfeed.com/favicon.ico", @friendfeed.icon
  end

  def test_url
    assert_equal "http://iddy.jp/profile/#{@iddy.key}", @iddy.url
    assert_equal "http://mixi.jp/show_friend.pl?id=#{@mixi.key}", @mixi.url
    assert_equal "http://github.com/#{@github.key}", @github.url
    assert_equal "http://twitter.com/#{@twitter.key}", @twitter.url
    assert_equal "http://facebook.com/profile.php?id=#{@facebook.key}", @facebook.url
    assert_equal "http://facebook.com/#{@facebook_username.key}", @facebook_username.url
    assert_equal "http://friendfeed.com/#{@friendfeed.key}", @friendfeed.url
  end
end
