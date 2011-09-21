# encoding: UTF-8

require 'spec_helper'
require 'multi_json'

describe "jruby json" do
  #works
  it "should decode json even with special chars using a json string directly" do
    MultiJson.decode("{\"message\":\"á\"}")['message'].should eq "á"
  end

  #fail
  it "should decode json even with special chars using to_json" do
    MultiJson.decode({:message => "á"}.to_json)['message'].should eq "á"
  end
end
