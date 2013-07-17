require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  def test_get_index
    get :index
    assert_response :success
    assert assigns(:accounts)
    assert_operator assigns(:accounts).length, :>, 0
  end
end
