# encoding: UTF-8

require 'spec_helper'
require 'multi_json'

describe "jruby json" do
  #fail
  it "should decode json even with special chars using to_json" do
    MultiJson.decode({:message => "á"}.to_json)['message'].should eq "á"
  end

  #works
  it "should decode json even with special chars using a json string directly" do
    MultiJson.decode("{\"message\":\"á\"}")['message'].should eq "á"
  end

  #this test fail in MRI and JRuby, but the codepoint is different(\ufffd for jruby, \u00e1 for MRI)
  it "should generate the same charpoint in both runtimes " do
    MultiJson.encode({:message => "á"}).should == "{\"message\":\"á\"}"
  end

  #this test fail in MRI and JRuby, but the codepoint is equal
  it "should generate equals jsons using to_json" do
    ({:message => "á"}).to_json.should == "{\"message\":\"á\"}"
  end
end
