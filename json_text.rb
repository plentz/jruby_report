# encoding: UTF-8

require 'rubygems'
require 'minitest/autorun'

#works using 'json/pure' instead of 'json/ext'
require 'json/ext'

class JsonTest < MiniTest::Unit::TestCase
  def test_json_generate
    data = {'message' => "á"}
    json = JSON.generate(data)
    assert_equal '{"message":"á"}', json
  end

  def test_json_parse
    json = '{"message":"á"}'
    assert_equal("á", JSON.parse(json)['message'])
  end
end