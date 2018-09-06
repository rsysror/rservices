module ServiceRequestsHelper

	def city_selection_from_address service_request
     service_request.address.city.id
	end

	def get_sub_services_list service_id
		 Service.where(parent_id: get_parent_id(service_id))
	end

	def get_services_list service_request
		city = service_request.address.city
    city.services.where(id: get_parent_id(service_request.service_id) )
	end

	def get_available_time_slots service_request
		service_request.portfolio.available_time_slots_for_update(service_request)
	end

	def get_parent_id service_id
		Service.find(service_id).parent_id
	end
	
end
