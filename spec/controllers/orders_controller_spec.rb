require 'rails_helper'

describe OrdersController, type: :controller do
  describe 'GET #show' do

    it "renders the :show template" do
      item = create(:item)
      get :show, params: { item_id: 1 }
      expect(response).to render_template :show
    end
  end
end