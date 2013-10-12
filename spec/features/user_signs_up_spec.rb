# require 'spec_helper'

# feature 'Visitor signs up' do
#   scenario "it creates a user name when they provide it" do
#     visit '/'
#     fill_in "user_name", with: "Penny"

#     click_on "Sign up!"

#     expect(page).to have_content("Penny")
#   end

#   # This is a STRETCH scenario. MOVE ON unless you've already pushed to heroku
#   # and submitted a pull request
#   xscenario "it does not create the todo if they don't provide a name" do
#     visit '/'

#     click_on "Create Todo"

#     expect(page).to have_content("You must provide a name for your todo!")
#   end
# end
