# encoding: UTF-8

require 'rubygems'
require 'minitest/autorun'

require 'json'
Encoding.default_internal = Encoding::UTF_8

class FloriJsonBug126Test < MiniTest::Unit::TestCase
  def test_json_encoder
    json_text = '["に到着を待っている"]'
    puts "#{json_text} is in encoding: #{json_text.encoding}"
    json_parsed = JSON.parse(json_text)
    puts "#{json_parsed.first} is in encoding #{json_parsed.first.encoding}"
    assert_equal(json_text.encoding, json_parsed.first.encoding)
  end
end


