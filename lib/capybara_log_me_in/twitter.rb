require 'twitter'

module Capybara
  class LogMeIn
    class Twitter
      def initialize(options)
        @me = {
          'username' => options[:username],
          'password' => options[:password]
        }
        @twitter = ::Twitter.user(options[:username])
      end
      
      def login
        Capybara.visit 'https://twitter.com'
        Capybara.fill_in 'session[username_or_email]', :with => @me['username']
        Capybara.fill_in 'session[password]', :with => @me['password']
        Capybara.click_button 'Sign in'
        Capybara.visit 'https://twitter.com/settings/applications'
        Capybara.all('.revoke').each &:click
      end

      def method_missing(name)
        key = name.to_s
        @me[key] || @twitter.attrs[key] || super
      end
      
      def delete
        Capybara.visit 'https://twitter.com'
        Capybara.find('#user-dropdown-toggle').click
        Capybara.click_link 'Sign out'
      end
    end
  end
end