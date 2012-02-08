# encoding: UTF-8

require 'spec_helper'
require 'yajl'

describe Yajl::Encoder do
  it "should encode the yml with special chars in both implementations" do
    Yajl::Encoder.encode({:message => "á"}).should == "{\"message\":\"á\"}"
  end
end
