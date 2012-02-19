# encoding: UTF-8

# Reproduce by running `ruby -I. ok_json_test.rb`

require 'rubygems'
require 'minitest/autorun'
require 'okjson'

class OkJsonTest < MiniTest::Unit::TestCase
  def test_json_decoder
    json = OkJson.encode({'message' => "á"})
    assert_equal("á", OkJson.decode(json)['message'])
  end
end
