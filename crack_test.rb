# encoding: UTF-8

# Reproduce by running `ruby -I. crack_test.rb`

require 'rubygems'
require 'minitest/autorun'
require 'crack/json'

class CrackTest < MiniTest::Unit::TestCase
  def test_json_parse
    json = Crack::JSON.parse('{"é": "hellyé"}')
    assert_equal ({"é" => "hellyé"}), json
  end
end