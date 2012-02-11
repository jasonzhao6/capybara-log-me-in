require 'spec_helper'

feature 'Test Users', %q{
  In order to test my API application
  As a developer
  I want to automate test user creation and deletion
} do
  
  background do
    Capybara.default_driver = :selenium
    config = YAML.load_file('spec/test.yml')
    Capybara::LogMeIn.config :facebook, { api_key:  config['facebook']['api_key'],   secret: config['facebook']['secret'] }
    Capybara::LogMeIn.config :twitter,  { username: config['twitter']['username'], password: config['twitter']['password'] }
  end
  
  scenario 'logging in with Facebook' do
    Capybara::LogMeIn.to :facebook do |user|
      visit 'http://www.facebook.com/'
      page.should have_content(user.name)
    end
    
    visit 'http://www.facebook.com/'
    page.should have_content('Log In')
  end

  scenario 'logging in with Twitter' do
    Capybara::LogMeIn.to :twitter do |user|
      visit 'http://twitter.com/'
      page.should have_content(user.name)
    end
    
    visit 'http://twitter.com/'
    page.should have_content('Log In')
  end

end
