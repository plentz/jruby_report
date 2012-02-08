# encoding: UTF-8

require 'spec_helper'
require 'yajl'

describe "charpoint" do
  it "should encode the yml with yajl" do
    Yajl::Encoder.encode({:message => "á"}).should == "{\"message\":\"á\"}"
  end
end
