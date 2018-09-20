module ServicesHelper

  def city_select 
    City.all.collect {|u| [u.name, u.id]}
  end
  
  def select_services services, city
    label_tag 'services'
    select_tag :service_selection, options_from_collection_for_select(services, :id, :name), :prompt => "Select Services", class: 'form-control', data: {remote: true,URL: get_services_path+ "?city_id=#{city.id}", method: 'get' }
  end

  def select_sub_services sub_services, city
    select_tag :service_id, options_from_collection_for_select(sub_services, :id, :name), class: 'form-control', :prompt => "Select Sub Services", data: {remote: true,URL: get_services_path+ "?city_id=#{city.id}", method: 'get' }
  end

   def select_portfolio portfolios, city
    select_tag 'service_request[portfolio_id]', options_from_collection_for_select(portfolios, :id, :company_name), :prompt => "Select Company", class: 'form-control', data: {remote: true,URL: get_services_path+ "?city_id=#{city.id}", method: 'get' }
  end

  def select_time_slot time_slots
    select_tag 'service_request[time_slot_id]', options_from_collection_for_select(time_slots, :id, :start_time_with_end_time), :prompt => "Select Timeslot", class: 'form-control'
  end

  # def sub_service_price sub_services
  #   sub_services.price.present? ? sub_services.price : "0.00"
  # end
end
