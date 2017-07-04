require 'test_helper'

class InstectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instection = instections(:one)
  end

  test "should get index" do
    get instections_url, as: :json
    assert_response :success
  end

  test "should create instection" do
    assert_difference('Instection.count') do
      post instections_url, params: { instection: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show instection" do
    get instection_url(@instection), as: :json
    assert_response :success
  end

  test "should update instection" do
    patch instection_url(@instection), params: { instection: {  } }, as: :json
    assert_response 200
  end

  test "should destroy instection" do
    assert_difference('Instection.count', -1) do
      delete instection_url(@instection), as: :json
    end

    assert_response 204
  end
end
