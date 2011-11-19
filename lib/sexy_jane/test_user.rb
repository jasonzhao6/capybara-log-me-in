require 'koala'

module SexyJane
  class TestUser
    
    def self.test_users
      @test_users ||= Koala::Facebook::TestUsers.new(:app_id => Facebook.connection.api_key, :secret => Facebook.connection.secret)
    end
    
    def self.logged_in(permissions)
      user = new(permissions)
      yield user
      test_users.delete(user.id)
    end
    
    def initialize(permissions)
      @test_user = self.class.test_users.create(true, permissions)
      #p @test_user
      api = Koala::Facebook::API.new(@test_user['access_token'])
      @me = api.get_object('me')
      #p @me
    end
    
    def method_missing(name)
      key = name.to_s
      return @test_user[key] if @test_user[key]
      return @me[key] if @me[key]
      super
    end
  end
end