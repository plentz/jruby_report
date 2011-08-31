# encoding: UTF-8

require 'spec_helper'

describe Foo do
  it "should do the right interpolation for error messages" do
    foo = Foo.new
    lambda{foo.save!}.should raise_error ActiveRecord::RecordInvalid
  end
  
  it "should decode json even with special chars" do
    ActiveSupport::JSON.decode({:message => "á"}.to_json)['message'].should eq "á"
  end

  it "should decode json even with special chars - this one works" do
    ActiveSupport::JSON.decode("á".to_json).should eq "á"
  end
end
