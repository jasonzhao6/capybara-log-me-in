require 'bundler/setup'
require 'sexy_jane'

describe SexyJane::Facebook do
  describe ".connect!" do
    before { SexyJane::Facebook.connect!('123', 'abc') }
    subject { SexyJane::Facebook.connection }
    its(:api_key) { should == '123' }
    its(:secret) { should == 'abc' }
  end
end

describe SexyJane::TestUser do
  describe ".logged_in" do    
    # Usage:
    #
    # SexyJane::Facebook.connect!('123', 'abc')
    # SexyJane::TestUser.logged_in('email') do |user|
    #   fill_in "Name", :with => user.name
    #   fill_in "Email", :with => user.email
    # end
    it "yields a user"
  end
end