require "test_helper"

class SantasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @santa = santas(:one)
  end

  test "should get index" do
    get santas_url, as: :json
    assert_response :success
  end

  test "should create santa" do
    assert_difference("Santa.count") do
      post santas_url, params: { santa: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show santa" do
    get santa_url(@santa), as: :json
    assert_response :success
  end

  test "should update santa" do
    patch santa_url(@santa), params: { santa: {  } }, as: :json
    assert_response :success
  end

  test "should destroy santa" do
    assert_difference("Santa.count", -1) do
      delete santa_url(@santa), as: :json
    end

    assert_response :no_content
  end
end
