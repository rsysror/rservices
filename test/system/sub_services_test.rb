require "application_system_test_case"

class SubServicesTest < ApplicationSystemTestCase
  setup do
    @sub_service = sub_services(:one)
  end

  test "visiting the index" do
    visit sub_services_url
    assert_selector "h1", text: "Sub Services"
  end

  test "creating a Sub service" do
    visit sub_services_url
    click_on "New Sub Service"

    fill_in "Name", with: @sub_service.name
    fill_in "Service", with: @sub_service.service_id
    click_on "Create Sub service"

    assert_text "Sub service was successfully created"
    click_on "Back"
  end

  test "updating a Sub service" do
    visit sub_services_url
    click_on "Edit", match: :first

    fill_in "Name", with: @sub_service.name
    fill_in "Service", with: @sub_service.service_id
    click_on "Update Sub service"

    assert_text "Sub service was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub service" do
    visit sub_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub service was successfully destroyed"
  end
end
