module AdminHelper

	def get_rating_data user
  	score = user.portfolio.feedbacks.present? ? actual_rating_count(user.portfolio) : 0
  	render_rating_partial(user, score)
  end

  def actual_rating_count portfolio
  	(portfolio.feedbacks.pluck(:rating).sum/portfolio.feedbacks.count)
  end

 	def get_stats object
 		if object == "Service"
 	 		object.constantize.get_services.count
 	 	else
 	 		object.constantize.count
 	 	end
 	end

 	def render_rating_partial user, score
 		render partial: "shared/show_rating" , locals: {request: user, score: score}
 	end


  def get_service_request_rating request
 	  (request.status.name == "Completed" and request.feedback.present?) ?  render_rating_partial(request, request.feedback.rating): "Not Yet Rated"
 	end

end	
