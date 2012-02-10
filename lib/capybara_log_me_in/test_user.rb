require 'koala'
require 'capybara'

module Capybara
  module LogMeIn
    class TestUser    
      def self.logged_in(permissions = nil)
        user = new(permissions)
        user.login
        yield user
        test_user_model.delete(user.id)
      end
    
      def self.test_user_model
        @test_user_model ||= Koala::Facebook::TestUsers.new(:app_id => Facebook.connection.api_key, :secret => Facebook.connection.secret)
      end
    
      def initialize(permissions = nil)
        @test_user = self.class.test_user_model.create(true, permissions)
        api = Koala::Facebook::API.new(@test_user['access_token'])
        @me = api.get_object('me')
      end
    
      def login
        Capybara.visit 'http://www.facebook.com'
        Capybara.fill_in 'Email', :with => self.email
        Capybara.fill_in 'Password', :with => self.password
        Capybara.click_button 'Log In'
      end
        
      def method_missing(name)
        key = name.to_s
        @test_user[key] || @me[key] || super
      end
    
      private_class_method :new
    end
  end
end
