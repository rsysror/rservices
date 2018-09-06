class AddressesController < ApplicationController

	def new
		if params[:search].present?
      @address = Location.near(params[:search], 50, :order => :distance)
    else
      @address = Address.new
    end
	end

	def create
    if params[:address]
      address = current_user.addresses.create(address_params)
    else
  		address = current_user.addresses.create(address_params)
    end
    if address
      redirect_to '/dashboard'
    end
	end

	def get_states_and_cities
		if params[:country_selection].present?
			@states = State.details(params[:country_selection])
		elsif params[:state_selection].present?
			@cities = City.details(params[:state_selection])		
		end
	end


	private

  #look better possibilities to merge extra params which is not included in form
	def address_params
    params.require(:address).permit(:flat_number,:street_name,:landmark, :user_id, :type,:pin_code, :address).merge(city_id: params[:city_id])
  end

end
