module PortfoliosHelper
  
  def show_average_rating portfolio
  	score = portfolio.feedbacks.present? ? actual_rating_count(portfolio) : 0
  	render partial: "shared/show_rating" , locals: {request: portfolio, score: score } 
  end

  def actual_rating_count portfolio
  	(portfolio.feedbacks.pluck(:rating).sum/portfolio.feedbacks.count)
  end

end
