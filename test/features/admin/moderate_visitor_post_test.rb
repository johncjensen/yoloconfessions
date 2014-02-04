require "test_helper"

feature "Moderate user posts" do
  scenario "so that qualify posts can be approved or denied" do
    sign_in
    visit admin_path
  end
end

