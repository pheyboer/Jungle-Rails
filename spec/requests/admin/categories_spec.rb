require 'rails_helper'

RSpec.describe "Admin::Categories", type: :request do

  # Adding before block for admin categories testing
  before do
    auth_headers = {
      'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(
        ENV['ADMIN_USERNAME'], ENV['ADMIN_PASSWORD']
      )
    }
    @auth = auth_headers
  end



  describe "GET /index" do
    it "returns http success" do
      get "/admin/categories/index", headers: @auth
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/categories/new", headers: @auth
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/admin/categories/create", headers: @auth
      expect(response).to have_http_status(:success)
    end
  end

end
