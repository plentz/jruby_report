# encoding: UTF-8

require 'rubygems'
require 'minitest/autorun'
require 'json/ext' #this fails
# require 'json/pure' #this works

class FloriJsonTest < MiniTest::Unit::TestCase
  def test_json_encoder
    json = JSON.generate({'message' => "á"})
    assert_equal("{\"message\":\"á\"}", json)
  end
end
