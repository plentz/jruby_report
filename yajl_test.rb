# encoding: UTF-8

require 'rubygems'
require 'minitest/autorun'
require 'yajl'

class YajlTest < MiniTest::Unit::TestCase
  def test_json_encoder
    json = Yajl::Encoder.encode({'message' => "á"})
    assert_equal("{\"message\":\"á\"}", json)
  end
end
