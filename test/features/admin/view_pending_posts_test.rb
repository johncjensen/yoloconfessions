require "test_helper"

feature "Sign in and view user posts" do
  scenario "so that only admins can access and view site content" do
    visit admin_path
    sign_in
    page.text.must_include "Admin Area"
    page.text.must_include "Pending Approval"
  end
end

