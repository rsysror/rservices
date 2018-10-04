require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    city = FactoryGirl.create(:city)
    address = FactoryGirl.create(:address, user: @user, city: city)
    time_slot = FactoryGirl.create(:time_slot)
    status = FactoryGirl.create(:status)
    service = FactoryGirl.create(:service)
    @portfolio = FactoryGirl.create(:portfolio, user: @user)
    @service_request = FactoryGirl.create(:service_request, address: address, user: @user, portfolio: @portfolio, status: status, time_slot: time_slot, service: service)
  end

  describe "Feedback #create" do
    context "with valid attributes" do
      it "create new feedback" do
        post :create, :params => {:feedback => {description: "Average", rating: "3", user_id:  @user.id, portfolio_id: @portfolio.id , service_request_id: @service_request.id}}
        expect(response).to redirect_to(service_requests_path)
      end
    end
  end
end