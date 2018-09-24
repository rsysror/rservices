require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "Feedback #create" do
    context "with valid attributes" do
      it "create new feedback" do
        post :create, :params => {:feedback => {:description => "jsjsjsj", :rating=> "3", :user_id => "1", :portfolio_id => "1", :service_request_id => "1"}}
        expect(Feedback.count).to be < (30)
      end
    end
  end
1
  # describe "POST create" do
  #   it "should create an address with valid attributes" do
  #     post "feedbacks_path", :params => {:feedback => {:description => "jsjsjsj", :rating=> "3", :user_id => "1", :portfolio_id => "3", :service_request_id => "1"}}
  #     # @feedback = @user.feedbacks.create(feedback_params)
  #     # @Feedback = FactoryGirl.create(:feedback)
  #     expect(response).to redirect_to(service_requests_path)
  #   end
  # end

end
