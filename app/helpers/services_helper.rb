module ServicesHelper

	def city_select 
		City.all.collect {|u| [u.name, u.id]}
	end

	def services_select
	end
end
