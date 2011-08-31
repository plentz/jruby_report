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
end
