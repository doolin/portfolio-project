require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "GET 'contact'" do
    get 'contact'
    assert_response :success
  end

  test "GET 'disclaimer'" do
    get 'disclaimer'
    assert_response :success
  end

  test "GET 'disclosure'" do
    get 'disclosure'
    assert_response :success
  end

  test "GET 'terms'" do
    get 'terms'
    assert_response :success
  end

  test "GET 'confirmation'" do
    get 'confirmation'
    assert_response :success
  end

  test "GET 'about'" do
    get 'about'
    assert_response :success
  end

  test "GET 'privacy'" do
    get 'privacy'
    assert_response :success
  end
end
