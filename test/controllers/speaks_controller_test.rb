require 'test_helper'

class SpeaksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @speak = speaks(:one)
  end

  test "should get index" do
    get speaks_url
    assert_response :success
  end

  test "should get new" do
    get new_speak_url
    assert_response :success
  end

  test "should create speak" do
    assert_difference('Speak.count') do
      post speaks_url, params: { speak: { content: @speak.content, user: @speak.user } }
    end

    assert_redirected_to speak_url(Speak.last)
  end

  test "should show speak" do
    get speak_url(@speak)
    assert_response :success
  end

  test "should get edit" do
    get edit_speak_url(@speak)
    assert_response :success
  end

  test "should update speak" do
    patch speak_url(@speak), params: { speak: { content: @speak.content, user: @speak.user } }
    assert_redirected_to speak_url(@speak)
  end

  test "should destroy speak" do
    assert_difference('Speak.count', -1) do
      delete speak_url(@speak)
    end

    assert_redirected_to speaks_url
  end
end
