require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CartProductsHelper. For example:
#
# describe CartProductsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CartProductsHelper, type: :helper do
  RSpec.describe "BasketItems", type: :request do
    describe "GET /add" do
      it "returns http success" do
        get "/basket_items/add"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /remove" do
      it "returns http success" do
        get "/basket_items/remove"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
