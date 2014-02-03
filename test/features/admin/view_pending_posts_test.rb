require "test_helper"

feature "Sign in and view user posts" do
  scenario "so that only admins can access and view site content" do
    visit admin_path
    fill_in "Email", with: "admin@admin.com"
    fill_in "Password", with: "password"
    click_on "Sign in"
    page.text.must_include "Admin Area"
    page.text.must_include "Signed in successfully."
  end
end

