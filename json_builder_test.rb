# encoding: UTF-8

# Reproduce by running `ruby -I. json_builder_test.rb`

require 'rubygems'
require 'minitest/autorun'
require 'json_builder'

class JsonBuilderTest < MiniTest::Unit::TestCase
  def test_json_generation
    json = JSONBuilder::Compiler.generate do
      é "json"
    end
    assert_equal '{"é": "json"}', json
  end
end
