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
      @address = FactoryGirl.create(:address, user: @user)
    end
  end

  
  describe "PUT update" do 
    let(:address) { FactoryGirl.create(:address, user: @user) }
    it "should update an address with valid attributes" do
      expect(address.update_column('street_name', "testing")).to  eq(true)
    end

    it "should give 200 status code" do
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE destroy" do 
    let(:address) { FactoryGirl.create(:address,user: @user) }
    it "should delete an address with no service request" do
      address.destroy
    end

    # let(:service_request) { FactoryGirl.create(:service_request, address: address) }

  end
end
