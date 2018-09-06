class AddressesController < ApplicationController

  before_action :find_address, only: [:edit, :update]

	def new
		if params[:search].present?
      @address = Location.near(params[:search], 50, :order => :distance)
    else
      @address = Address.new
    end
	end

	def index
		@addresses = current_user.addresses
	end

	def edit
		@address = Address.find(params[:id])
		@cities = City.details
	end

	def update
		@address.update_attributes(address_params)
		if @address
			flash[:success] = "Updated address Successfully!"
			redirect_to addresses_path
		else
			flash[:error] =  "Error"
			redirect_to addresses_path
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

	def destroy
		address = Address.find(params[:id])
		if address.has_service_requests?
			flash[:error] = "Address which availed services can not be deleted"
		else
			address.destroy
			flash[:success] = "Address Deleted Successfully!"
		end
		redirect_to addresses_path
	end


	private

	def find_address
		@address = Address.find(params[:id])
	end

  #look better possibilities to merge extra params which is not included in form
	def address_params
    params.require(:address).permit(:flat_number,:street_name,:landmark, :user_id, :type,:pin_code, :city_id)
  end

end
