require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  describe 'get #index' do
    let(:user) { create(:user) }
    let!(:hotel) { create(:hotel) }
    let!(:role) { create(:role, name: 'owner', hotel: hotel, user: user) }
    it 'populates an array of hotel' do
      sign_in user
      get :index
      expect(assigns(:hotels)).to eq([hotel])
    end
  end
end
