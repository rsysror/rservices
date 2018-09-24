module HomeHelper

  def select_city cities
    select_tag :city_selection, options_from_collection_for_select(cities, :id, :name), :prompt => "Select City",class: 'form-control', data: {remote: true,url: get_services_path,method: 'get'}
  end

  def user_request_count user, type
    (type == 'service_requests') ? user.service_requests.count : user.addresses.count
  end

end
