require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    address = FactoryGirl.create(:address, user: @user)
    @service_request =  FactoryGirl.create(:service_request, address: address)
    @portfolio = FactoryGirl.create(:portfolio, user: @user)
  end

  describe "Feedback #create" do
    context "with valid attributes" do
      it "create new feedback" do
        post :create, :params => {:feedback => {description: "Average", rating: "3", user_id:  @user.id, portfolio_id: @portfolio.id , service_request_id: @service_request.id}}
      end
    end
  end
end
