module ApplicationHelper

	def city_select 
		City.all.collect {|u| [u.name, u.id]}
	end

	def service_select
		Service.all.collect {|u| [u.name, u.id]}
	end
	
end
