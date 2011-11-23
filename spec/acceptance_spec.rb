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
    SexyJane::Facebook.connect!(config['api_key'], config['secret'])
  end
  
  scenario "Wrap my testing code with SexyJane" do
    SexyJane::TestUser.logged_in do |user|
      visit 'http://www.facebook.com/'
      page.should have_content(user.name)
    end
    wait_until { page.has_css?('#pop_content') }
    page.should have_content('Not Logged In')
  end

end
