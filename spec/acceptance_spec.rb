require 'spec_helper'
require 'capybara/rspec'
require 'yaml'

feature "Facebook Test Users", %q{
  In order to test my Facebook canvas appliaction
  As a developer
  I want to automate test user creation and deletion
} do
  
  background do
    Capybara.default_driver = :selenium
    config = YAML.load_file('spec/test.yml')
    SexyJane::Facebook.connect!(config['api_key'], config['secret'])
  end
  
  scenario "Wrap my testing code with SexyJane" do
    SexyJane::TestUser.logged_in do |user|
      visit 'http://www.facebook.com/'
      page.should have_content(user.name)
      fill_in 'Email Password:', :with => 'hello word'
    end
    visit 'http://www.facebook.com/'
    page.should have_content('Sign Up')
  end

end
