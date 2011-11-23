require 'spec_helper'

describe SexyJane::Facebook do
  describe ".connect!" do
    before { SexyJane::Facebook.connect!('123', 'abc') }
    context "when connected with (123, abc)" do
      describe ".connection" do
        subject { SexyJane::Facebook.connection }
        its(:api_key) { should == '123' }
        its(:secret) { should == 'abc' }      
      end
    end
  end
end

describe SexyJane::TestUser do
  describe ".logged_in" do
    before do
      SexyJane::Facebook.connect!('123', 'abc')
      SexyJane::TestUser.any_instance.stub(:login)
    end
    it "yields block with populated user object" do
      VCR.use_cassette "dirty_tape" do
        SexyJane::TestUser.logged_in do |user|
          user.id.should == '100003191974568'
        end
      end
    end
  end
end
