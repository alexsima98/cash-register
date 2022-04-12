require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
    it 'assigns all products to @products' do
      get '/'
      expect(assigns(:products)).to eq(Product.all)
    end
  end
end
