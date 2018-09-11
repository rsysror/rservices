module AdminHelper

	def get_rating_data user
  	score = user.portfolio.feedbacks.present? ? actual_rating_count(user.portfolio) : 0
  	render partial: "shared/show_rating" , locals: {request: user, score: score} 
  end

  def actual_rating_count portfolio
  	(portfolio.feedbacks.pluck(:rating).sum/portfolio.feedbacks.count)
  end

 

end	
