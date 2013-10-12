require_relative 'spec_helper'
require 'capybara/rspec'

feature "Guests may register" do

  def register_as
    visit "/"
    within "#register_new_account_form" do
      fill_in('user_name', :with => 'bbeaird12')
      fill_in('email', :with => 'bbeaird12@gmail.com')
      fill_in('first_name', :with => 'Brantley')
      fill_in('last_name', :with => 'Beaird')
      fill_in('password', :with => 'password')

      # click_link('id-of-link')
      # click_link('Link Text')
      click_button('Sign up!')
      # click('Link Text') # Click either a link or a button
      # click('Button Value')
    end
  end

  context "with valid login credentials" do
    scenario "User may log in" do
      register_as
      expect(page).to have_content("Welcome bbeaird12")
    end
  end  

end

# register_as