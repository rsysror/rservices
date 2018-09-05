module PortfoliosHelper
  def select_city_services cities, form, portfolio
    # <%= form.select(:city_id, options_from_collection_for_select(cities, :id, :name), { :prompt => "Select City"}, required: 'true', class: 'form-control form_input') %>
    form.select(:city_id, options_from_collection_for_select(cities, :id, :name, portfolio.city_id), { :prompt => "Select City"}, required: 'true', class: 'form-control form_input', data: {remote: true,URL: get_city_service_list_partner_portfolio_path, method: 'get'})
  end
end
