require 'spec_helper'

feature 'User searches for a member' do
  scenario 'it returns a user listing when a user_name is provided' do
    visit '/find_members'
    fill_in 'user_name', with:'bootcamp'
    click_on 'Search'
    expect(page).to have_content('bootcamp')
  end
end

