require 'test_helper'

class SubServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_service = sub_services(:one)
  end

  test "should get index" do
    get sub_services_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_service_url
    assert_response :success
  end

  test "should create sub_service" do
    assert_difference('SubService.count') do
      post sub_services_url, params: { sub_service: { name: @sub_service.name, service_id: @sub_service.service_id } }
    end

    assert_redirected_to sub_service_url(SubService.last)
  end

  test "should show sub_service" do
    get sub_service_url(@sub_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_service_url(@sub_service)
    assert_response :success
  end

  test "should update sub_service" do
    patch sub_service_url(@sub_service), params: { sub_service: { name: @sub_service.name, service_id: @sub_service.service_id } }
    assert_redirected_to sub_service_url(@sub_service)
  end

  test "should destroy sub_service" do
    assert_difference('SubService.count', -1) do
      delete sub_service_url(@sub_service)
    end

    assert_redirected_to sub_services_url
  end
end
