module Capybara
  module LogMeIn
    class Facebook
      def self.connect!(api_key, secret)
        @connection = new(api_key, secret)
      end
    
      def self.connection
        @connection
      end

      attr_reader :api_key, :secret

      def initialize(api_key, secret)
        @api_key, @secret = api_key, secret
      end
    
      private_class_method :new
    end
  end
end
