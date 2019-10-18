require 'rails_helper'

describe OrdersController, type: :controller do
  describe 'GET #show' do
    it "renders the :show template" do
      item = create(:item)
      get :show, params: { item_id: 1 }
      expect(response).to render_template :show
    end

    # it "renders the :create template" do
    #   @item = create(:item)
    #   get :create, params: { item_id: 1, 'payjp-token': "tok_58cfc982c1f16344552c266a0cae" }
    #   expect(response).to render_template :create
    # end
  end
end