require "capybara_log_me_in/version"
# require "capybara_log_me_in/facebook"
# require "capybara_log_me_in/twitter"
require 'koala'
require 'capybara'

module Capybara
  class LogMeIn
    @providers = {}
    
    def self.config(provider, options)
      @providers[provider] = options
    end
    
    def self.to(provider)
      options = @providers[provider]
      klass = const_get(provider.to_s.capitalize.to_sym)
      user = klass.new(options)
      user.login
      yield user
      user.delete
    end
  end  
end