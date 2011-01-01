require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  fixtures :accounts

  def test_get_index
    get :index
    assert_response :success
    assert_equal Account.find(:all), assigns(:accounts)
  end
end
