module ServicesHelper

	def city_select 
		City.all.collect {|u| [u.name, u.id]}
	end
	
	def select_services services, city
		label_tag 'services'
		select_tag :service_selection, options_from_collection_for_select(services, :id, :name), :prompt => "Select Services", class: 'form-control', data: {remote: true,URL: get_services_path+ "?city_id=#{city.id}", method: 'get' }
	end

	def select_sub_services sub_services
		select_tag :sub_service_selection, options_from_collection_for_select(sub_services, :id, :name), class: 'form-control', :prompt => "Select Services"
	end
end
