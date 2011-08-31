# encoding: UTF-8

require 'spec_helper'

describe Foo do
  it "should do the right interpolation for error messages" do
    foo = Foo.new
    foo.valid?
    lambda{I18n.t("errors.messages.record_invalid", :errors => foo.errors.full_messages)}.should_not raise_error
  end

  it "should decode json even with special chars" do
    ActiveSupport::JSON.decode({:message => "á"}.to_json)['message'].should eq "á"
  end
  
  # works on jruby 1.9 rails 3.0.10, fails in mri 1.9.2 rails 3.1
  it "should decode json even with special chars - this one works" do
    ActiveSupport::JSON.decode("á".to_json).should eq "á"
  end
end
