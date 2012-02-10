require 'spec_helper'

feature "Facebook Test Users", %q{
  In order to test my Facebook canvas appliaction
  As a developer
  I want to automate test user creation and deletion
} do
  
  background do
    Capybara.default_driver = :selenium
    Capybara.default_wait_time = 60
    config = YAML.load_file('spec/test.yml')
    Capybara::LogMeIn::Facebook.connect!(config['api_key'], config['secret'])
  end
  
  scenario "Wrap my testing code with LogMeIn" do
    Capybara::LogMeIn::TestUser.logged_in do |user|
      visit 'http://www.facebook.com/'
      page.should have_content(user.name)
    end
    visit 'http://www.facebook.com/'
    page.should have_content('Log In')
  end

end
