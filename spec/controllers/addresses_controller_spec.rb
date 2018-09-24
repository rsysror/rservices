require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  

  before (:each) do
    @user = FactoryGirl.create(:user)
    @city = FactoryGirl.create(:city)
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


  def valid_attributes
    {user: @user, pin_code: '123456',street_name: "test", landmark: "city road", city: @city}
  end

end
