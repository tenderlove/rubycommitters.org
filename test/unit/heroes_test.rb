# coding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class HeroTest < Test::Unit::TestCase
  def setup
    @matz ||= Hero.first
    @yml  ||= File.join(File.expand_path(File.dirname(__FILE__)), 'ruby-committers.yml')
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

  def test_import_heroes
    assert_difference('Hero.count', 3) do
      File.open(@yml, 'rb') { |f| Hero.import f }
    end
  end

  def test_imports_names
    assert_difference('Name.count', 6) do
      File.open(@yml, 'rb') { |f| Hero.import f }
    end

    hero = Hero.find_by_username('H_Konishi')
    assert_equal ['小西弘将', 'KONISHI Hiromasa'].sort, hero.names.map { |n|
      n.value
    }.sort
  end

  def test_imports_nicks
    assert_difference('Nick.count', 3) do
      File.open(@yml, 'rb') { |f| Hero.import f }
    end

    hero = Hero.find_by_username('H_Konishi')
    assert_equal [], hero.nicks

    hero = Hero.find_by_username('aamine')
    assert_equal ['青木さん'], hero.nicks.map { |x| x.value }
  end

  def test_imports_sites
    assert_difference('Site.count', 5) do
      File.open(@yml, 'rb') { |f| Hero.import f }
    end

    hero = Hero.find_by_username('aamine')
    assert_equal 2, hero.sites.length

    site = hero.sites.find_by_title('LoveRubyNet')
    assert_nil site.lang
    assert_nil site.feed
    assert_equal 'http://i.loveruby.net/', site.url

    site = hero.sites.find_by_title('青木日記')
    assert_equal 'http://i.loveruby.net/d/', site.url
    assert_equal 'ja', site.lang
    assert_equal 'http://i.loveruby.net/d/index.rdf', site.feed
  end

  def test_imports_portraits
    assert_difference('Portrait.count', 2) do
      File.open(@yml, 'rb') { |f| Hero.import f }
    end

    hero = Hero.find_by_username 'aamine'
    assert_equal 'http://jp.rubyist.net/magazine/?c=plugin;plugin=attach_download;p=0017-Hotlinks;file_name=aoki1.jpg', hero.portraits.first.url
  end

  def test_imports_services
    assert_difference('Service.count', 4) do
      File.open(@yml, 'rb') { |f| Hero.import f }
    end

    hero = Hero.find_by_username 'akira'
    assert_equal 4, hero.services.count

    assert_equal [
      ['twitter', 'arika'],
      ['friendfeed', 'arika'],
      ['iddy', 'arika'],
      ['mixi', '1549'],
    ].sort, hero.services.map { |x| [x.name, x.key] }.sort
  end

  def test_imports_books
    assert_difference('Book.count', 7) do
      File.open(@yml, 'rb') { |f| Hero.import f }
    end

    hero = Hero.find_by_username 'aamine'
    assert_equal %w{
      9784844317210
      9784797340044
      9784756137098
      9784797324297
      9784839923204
    }.sort, hero.books.map { |x| x.isbn }.sort
  end
end