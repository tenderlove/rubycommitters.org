require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  fixtures :accounts, :names, :nicks, :sites

  def setup
    @matz = accounts :matz
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
end
