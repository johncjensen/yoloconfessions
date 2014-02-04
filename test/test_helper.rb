ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

def sign_in
  visit new_user_session_path
  fill_in "Email", with: "admin@admin.com"
  fill_in "Password", with: "password"
  page.find("[type='submit']").click
end
