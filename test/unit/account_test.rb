# coding: utf-8

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  fixtures :accounts, :names, :nicks, :sites

  def setup
    @matz = accounts :matz
    @yml = File.join(File.expand_path(File.dirname(__FILE__)), 'ruby-committers.yml')
  end

  def test_name_with_a_name
    assert_equal @matz.names.last.value.titleize, @matz.name
  end

  def test_name_without_name_but_with_nick
    @matz.names.delete_all
    assert_equal @matz.nicks.first.value, @matz.name
  end

  def test_name_without_name_or_nick_but_with_username
    @matz.names.delete_all
    @matz.nicks.delete_all
    assert_equal @matz.username, @matz.name
  end

  def test_has_many_names
    assert_operator 3, :<=, @matz.names.length
  end

  def test_has_many_nicks
    assert_operator 1, :<=, @matz.nicks.length
  end

  def test_has_many_sites
    assert_operator 1, :<=, @matz.sites.length
  end

  def test_has_many_services
    assert_operator 5, :<=, @matz.services.length
  end

  def test_has_many_portraits
    assert_operator 1, :<=, @matz.portraits.length
  end

  def test_has_many_books
    assert_operator 5, :<=, @matz.books.length
  end

  def test_import_accounts
    assert_difference('Account.count', 3) do
      File.open(@yml, 'rb') { |f| Account.import f }
    end
  end

  def test_imports_names
    assert_difference('Name.count', 6) do
      File.open(@yml, 'rb') { |f| Account.import f }
    end

    account = Account.find_by_username('H_Konishi')
    assert_equal ['小西弘将', 'KONISHI Hiromasa'].sort, account.names.map { |n|
      n.value
    }.sort
  end

  def test_imports_nicks
    assert_difference('Nick.count', 3) do
      File.open(@yml, 'rb') { |f| Account.import f }
    end

    account = Account.find_by_username('H_Konishi')
    assert_equal [], account.nicks

    account = Account.find_by_username('aamine')
    assert_equal ['青木さん'], account.nicks.map { |x| x.value }
  end

  def test_imports_sites
    assert_difference('Site.count', 5) do
      File.open(@yml, 'rb') { |f| Account.import f }
    end

    account = Account.find_by_username('aamine')
    assert_equal 2, account.sites.length

    site = account.sites.find_by_title('LoveRubyNet')
    assert_nil site.lang
    assert_nil site.feed
    assert_equal 'http://i.loveruby.net/', site.url

    site = account.sites.find_by_title('青木日記')
    assert_equal 'http://i.loveruby.net/d/', site.url
    assert_equal 'ja', site.lang
    assert_equal 'http://i.loveruby.net/d/index.rdf', site.feed
  end

  def test_imports_portraits
    assert_difference('Portrait.count', 2) do
      File.open(@yml, 'rb') { |f| Account.import f }
    end

    account = Account.find_by_username 'aamine'
    assert_equal 'http://jp.rubyist.net/magazine/?c=plugin;plugin=attach_download;p=0017-Hotlinks;file_name=aoki1.jpg', account.portraits.first.url
  end

  def test_imports_services
    assert_difference('Service.count', 4) do
      File.open(@yml, 'rb') { |f| Account.import f }
    end

    account = Account.find_by_username 'akira'
    assert_equal 4, account.services.count

    assert_equal [
      ['twitter', 'arika'],
      ['friendfeed', 'arika'],
      ['iddy', 'arika'],
      ['mixi', '1549'],
    ].sort, account.services.map { |x| [x.name, x.key] }.sort
  end

  def test_imports_books
    assert_difference('Book.count', 7) do
      File.open(@yml, 'rb') { |f| Account.import f }
    end

    account = Account.find_by_username 'aamine'
    assert_equal %w{
      9784844317210
      9784797340044
      9784756137098
      9784797324297
      9784839923204
    }.sort, account.books.map { |x| x.key }.sort
  end
end
