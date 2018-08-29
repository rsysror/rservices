module ServicesHelper

	def city_select 
		City.all.collect {|u| [u.name, u.id]}
	end
	
	def select_services services
		select_tag :service_selection, options_from_collection_for_select(services, :id, :name), :prompt => "--- Select Services---" , data: {remote: true,url: get_services_path,method: 'get', dataType: 'script'}
	end

	def select_sub_services sub_services
		select_tag :sub_service_selection, options_from_collection_for_select(sub_services, :id, :name), :prompt => "--- Select Services---"
	end
end
