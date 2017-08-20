require 'test_helper'

class LoginPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @login_page = login_pages(:one)
  end

  test "should get index" do
    get login_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_login_page_url
    assert_response :success
  end

  test "should create login_page" do
    assert_difference('LoginPage.count') do
      post login_pages_url, params: { login_page: {  } }
    end

    assert_redirected_to login_page_url(LoginPage.last)
  end

  test "should show login_page" do
    get login_page_url(@login_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_login_page_url(@login_page)
    assert_response :success
  end

  test "should update login_page" do
    patch login_page_url(@login_page), params: { login_page: {  } }
    assert_redirected_to login_page_url(@login_page)
  end

  test "should destroy login_page" do
    assert_difference('LoginPage.count', -1) do
      delete login_page_url(@login_page)
    end

    assert_redirected_to login_pages_url
  end
end
