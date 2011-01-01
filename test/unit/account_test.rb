# coding: utf-8

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  fixtures :accounts, :names, :nicks, :sites

  def setup
    @matz = accounts :matz
    @yml = File.join(File.expand_path(File.dirname(__FILE__)), 'ruby-committers.yml')
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
end
