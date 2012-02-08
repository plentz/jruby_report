# encoding: UTF-8

require 'spec_helper'

describe "OkJson.engine" do
  MultiJson.engine=:ok_json
  
  it "should generate the same char codepoint in both implementations(actually it generates \\u00C3\\u00A1 for jruby and \\xC3\\xA1 for mri)" do
    MultiJson.decode({:message => "á"}.to_json)['message'].should eq "á"
  end
end
