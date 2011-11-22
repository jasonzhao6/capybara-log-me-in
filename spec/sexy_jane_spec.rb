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
    
  end
end
