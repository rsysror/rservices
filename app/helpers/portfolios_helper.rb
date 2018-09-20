module PortfoliosHelper
  # def select_city_services cities, form, portfolio
  #   form.select(:city_id, options_from_collection_for_select(cities, :id, :name, portfolio.city_id), { :prompt => "Select City"}, required: 'true', class: 'form-control form_input', data: {remote: true,URL: get_city_service_list_partner_portfolio_path, method: 'get'}, disabled: portfolio.service_requests.present?)
  # end

  def show_average_rating portfolio
  	score = portfolio.feedbacks.present? ? actual_rating_count(portfolio) : 0
  	render partial: "shared/show_rating" , locals: {request: portfolio, score: score } 
  end

  def actual_rating_count portfolio
  	(portfolio.feedbacks.pluck(:rating).sum/portfolio.feedbacks.count)
  end

  # def select_services_for_partner services, portfolio
  #   select_tag "portfolio[service_id]", options_from_collection_for_select(services, "id", "name", portfolio.service_id ), :prompt => "Select Servicesss", class: 'form-control form_input', disabled: portfolio.service_requests.present? 
  # end
end
