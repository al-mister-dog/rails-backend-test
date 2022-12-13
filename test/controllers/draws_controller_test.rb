require "test_helper"

class DrawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw = draws(:one)
  end

  test "should get index" do
    get draws_url, as: :json
    assert_response :success
  end

  test "should create draw" do
    assert_difference("Draw.count") do
      post draws_url, params: { draw: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show draw" do
    get draw_url(@draw), as: :json
    assert_response :success
  end

  test "should update draw" do
    patch draw_url(@draw), params: { draw: {  } }, as: :json
    assert_response :success
  end

  test "should destroy draw" do
    assert_difference("Draw.count", -1) do
      delete draw_url(@draw), as: :json
    end

    assert_response :no_content
  end
end
