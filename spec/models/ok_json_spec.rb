# encoding: UTF-8

require "okjson"
require 'spec_helper'

describe "OkJson.engine" do
  
  it "should generate the same char codepoint in both implementations(actually it generates \\u00C3\\u00A1 for jruby and \\xC3\\xA1 for mri)" do
    OkJson.decode({:message => "á"}.to_json)['message'].should eq "á"
  end
end
