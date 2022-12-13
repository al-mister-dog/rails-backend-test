require "test_helper"

class GiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gift = gifts(:one)
  end

  test "should get index" do
    get gifts_url, as: :json
    assert_response :success
  end

  test "should create gift" do
    assert_difference("Gift.count") do
      post gifts_url, params: { gift: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show gift" do
    get gift_url(@gift), as: :json
    assert_response :success
  end

  test "should update gift" do
    patch gift_url(@gift), params: { gift: {  } }, as: :json
    assert_response :success
  end

  test "should destroy gift" do
    assert_difference("Gift.count", -1) do
      delete gift_url(@gift), as: :json
    end

    assert_response :no_content
  end
end
