# encoding: UTF-8

require 'rubygems'
require 'minitest/autorun'
require 'json_builder'

class JsonBuilderTest < MiniTest::Unit::TestCase
  def test_json_generation_with_unicode_in_key
    json = JSONBuilder::Compiler.generate do
      é "json"
    end
    assert_equal '{"é": "json"}', json
  end

  def test_json_generation_with_unicode_in_value
    json = JSONBuilder::Compiler.generate do
      json "é"
    end
    assert_equal '{"json": "é"}', json
  end
end
