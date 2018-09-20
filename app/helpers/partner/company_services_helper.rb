module Partner::CompanyServicesHelper
  
  def select_available_services sub_services, form
    form.select(:service_id, options_from_collection_for_select(sub_services, :id, :name), { :prompt => "Select Sub Service"}, required: 'true', class: 'form-control form_input', data: {remote: true, url: get_cities_path, method: 'get'})
  end

  def select_service_city cities
    (label_tag 'cities', 'Cities', class: "control-label col-sm-2") +
    content_tag(:div,class: "col-sm-10") do
      select_tag 'portfolio_service[city_ids]', options_from_collection_for_select(cities, :id, :name), multiple: true, class: 'form-control form_input'
    end
  end

  # need to refactor
  # def get_city_name(service_id)
  #   current_user.portfolio.portfolio_services.where(service_id: service_id).map{|m| m.city.name}.join(", ")
  # end

  def company_service_price service
    service.price.present? ? service.price : "0.00"
  end

end
