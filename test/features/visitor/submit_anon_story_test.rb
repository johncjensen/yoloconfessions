require "test_helper"

feature "Submit anonymous story" do
  scenario "so that people can revel in the craziness that happened one night/day" do
    visit new_post_path
  #   within("input#post_title") do
  #   fill_in "Title", with: "omg"
  # end

    fill_in "Title", with: "Omg so one night"
    fill_in "Body", with: "Yolo ipsum dolor sit amet, consectetur adipiscing elit. Ut ac suscipit leo. Carpe diem vulputate est nec commodo rutrum. Pellentesque mattis convallis nisi eu and I ain’t stoppin until the swear jar’s full. Ut rhoncus velit at mauris interdum, fringilla dictum neque rutrum. Curabitur mattis odio at erat viverra lobortis. Poppin’ bottles on the ice, tristique suscipit mauris elementum tempus. Quisque ut felis vitae elit tempor interdum viverra a est. Drop it like it’s hot, at pretium quam. In nec scelerisque purus. Nam dignissim lacus ipsum, a ullamcorper nulla pretium non. Aliquam sed enim faucibus, pulvinar felis at, vulputate augue. Ten, ten, twenties on them fifties, trick, at tempus libero fermentum id. Vivamus ut nisi dignissim, condimentum urna vel, dictum massa. Donec justo yolo, rutrum vitae dui in, dapibus tempor tellus. I do it big. Fusce ut sagittis mi."

    select('nightclub', :from => 'post_category')
    click_on "Submit"

    page.text.must_include "Thanks for your submission!"
  end
end
