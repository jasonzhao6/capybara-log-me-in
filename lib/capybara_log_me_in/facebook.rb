require 'koala'
require 'capybara'

module Capybara
  class LogMeIn
    class Facebook
      def initialize(options)
        @factory = Koala::Facebook::TestUsers.new(app_id: options[:api_key], secret: options[:secret])
        @test_user = @factory.create(true, nil)
        @me = Koala::Facebook::API.new(@test_user['access_token']).get_object('me')
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
      
      def delete
        @factory.delete(self.id)
      end
    end
  end
end
