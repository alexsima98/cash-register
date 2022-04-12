require 'rails_helper'

RSpec.describe "CartProducts", type: :request do

  describe "POST /add" do
    it 'creates a cart_product and redirects to index' do
      post '/cart/1/add/1'
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end

end
