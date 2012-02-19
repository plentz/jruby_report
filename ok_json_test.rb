# encoding: UTF-8

# Reproduce by running `ruby -I. ok_json_test.rb`

require 'rubygems'
require 'minitest/autorun'
require 'okjson'

class OkJsonTest < MiniTest::Unit::TestCase
  # This is a bug in OKJSON
  def test_json_encode
    data = {'message' => "á"}
    json = OkJson.encode data
    assert_equal '{"message":"á"}', json
  end

  def test_json_decode
    json = '{"message":"á"}'
    assert_equal("á", OkJson.decode(json)['message'])
  end
end
