require 'spec_helper'

describe Capybara::LogMeIn::Facebook do
  describe ".connect!" do
    before { Capybara::LogMeIn::Facebook.connect!('123', 'abc') }
    context "when connected with (123, abc)" do
      describe ".connection" do
        subject { Capybara::LogMeIn::Facebook.connection }
        its(:api_key) { should == '123' }
        its(:secret) { should == 'abc' }      
      end
    end
  end
end

describe Capybara::LogMeIn::TestUser do
  describe ".logged_in" do
    before do
      Capybara::LogMeIn::Facebook.connect!('123', 'abc')
      Capybara::LogMeIn::TestUser.any_instance.stub(:login)
    end
    it "yields block with populated user object" do
      VCR.use_cassette "dirty_tape" do
        Capybara::LogMeIn::TestUser.logged_in do |user|
          user.id.should == '100003191974568'
        end
      end
    end
  end
end
