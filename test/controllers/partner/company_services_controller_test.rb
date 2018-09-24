require 'test_helper'

class Partner::CompanyServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_company_services_index_url
    assert_response :success
  end

end
