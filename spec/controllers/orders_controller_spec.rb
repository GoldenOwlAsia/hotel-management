require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "POST orders#create" do
    let(:user) { create(:user) }
    it "returns http success" do
      sign_in user
      post :create
      response.should redirect_to booking_orders_path
    end
  end
end
