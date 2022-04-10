require 'rails_helper'

RSpec.describe "CartProducts", type: :request do
  describe "GET /add" do
    it "returns http success" do
      get "/cart_products/add"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /remove" do
    it "returns http success" do
      get "/cart_products/remove"
      expect(response).to have_http_status(:success)
    end
  end

end
