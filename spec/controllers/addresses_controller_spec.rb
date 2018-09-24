require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "should load all addresses of user" do
      get :index
        expect(@user.addresses)
    end
  end

  describe "POST create" do
    it "should create an address with valid attributes" do
      @address = FactoryGirl.create(:address)
    end
  end

  
  describe "PUT update" do 
    let(:address) { FactoryGirl.create(:address) }
    it "should update an address with valid attributes" do
      expect(address.update_column('street_name', "testing")).to  eq(true)
    end
  end

  describe "DELETE destroy" do 
    let(:address) { FactoryGirl.create(:address) }
    it "should delete an address with no service request" do
      address.destroy
    end

    let(:service_request) { FactoryGirl.create(:service_request, address: address) }

    # it "should not delete an address if it has some service request associated" do
    #    address.has_service_requests?
    #     expect(flash[:error]).to eq("Address which availed services can't be deleted")
    # end

    

  end
end
