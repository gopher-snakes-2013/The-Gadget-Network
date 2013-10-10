require 'spec_helper'

#Unit Tests
describe Post do
  it { should belong_to(:user) }
end

describe User do
  it { should have_many(:posts) }
end

describe "feedpage" do
  xit { should route(:get, '/feedpage').to() } 
end

feature "User visits feedpage" do
  scenario "They should see the post box" do
    visit "/feedpage"
    expect(page).to have_content "What's your latest gadget news?"
  end
end
