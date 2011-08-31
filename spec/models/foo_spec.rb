# encoding: UTF-8

require 'spec_helper'

describe Foo do
  it "fail" do
    foo = Foo.new
    lambda{foo.save!}.should raise_error ActiveRecord::RecordInvalid
  end
  
  it "fail again" do
    ActiveSupport::JSON.decode({:message => "á"}.to_json)['message'].should eq ActiveSupport::JSON.decode("á".to_json)
  end
end
