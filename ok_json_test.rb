# encoding: UTF-8

# Reproduce by running `ruby -I. ok_json_test.rb`

require 'rubygems'
require 'minitest/autorun'
require 'okjson'

class OkJsonTest < MiniTest::Unit::TestCase
  def test_json_encode
    data = {'message' => "á"}
    json = OkJson.encode data
    assert_equal '{"message":"\u00e1"}', json
  end

  def test_json_decode
    json = '{"message":"á"}'
    assert_equal("á", OkJson.decode(json)['message'])
  end

  def test_decode_bad
    json = "{\"message\":\"\\ufffd\"}"
    assert_equal([0xef, 0xbf, 0xbd].pack('C*'), OkJson.decode(json)['message'])

    # The output of the following line on JRuby is:
    #
    #  "\u00EF\u00BF\u00BD"
    #
    # On MRI, it is
    #
    #  "\xEF\xBF\xBD"
    #
    # It seems the bytes are exactly the same, only the inspect is different.
    p OkJson.decode(json)['message']
  end
end
