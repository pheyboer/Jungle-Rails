class Admin::BaseController < ApplicationController
  before_action :authenticate_admin

  private

  # HTTP Basic Authentication
  def authenticate_admin
    authenticate_or_request_with_http_basic("Admin") do |username, password|
      username == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
    end
  end
end