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
end
