class FeedbacksController < ApplicationController
	before_action :authenticate_user!
	def new
	  @feedback = Feedback.new
	end

	def create
   feedback = current_user.feedbacks.create(feedback_params)
   if feedback
   	redirect_to service_requests_path
   end
	end


  private

  def feedback_params
  	params.require(:feedback).permit(:description, :rating, :user_id, :portfolio_id, :service_request_id)
  end

end
