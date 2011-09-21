# encoding: UTF-8

require 'spec_helper'
require 'multi_json'

describe "charpoint" do
  #this test fail in MRI and JRuby, but the codepoint is different(\ufffd for jruby, \u00e1 for MRI)
  it "should generate the same charpoint in both runtimes " do
    MultiJson.encode({:message => "á"}).should == "{\"message\":\"á\"}"
  end

  #this test fail in MRI and JRuby, but the codepoint is equal
  it "should generate equals jsons using to_json" do
    ({:message => "á"}).to_json.should == "{\"message\":\"á\"}"
  end
end
