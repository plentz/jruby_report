# encoding: UTF-8

require 'rubygems'
require 'minitest/autorun'

require 'json/ext' #this fails
# require 'json/pure' #this works

class FloriJsonTest < MiniTest::Unit::TestCase

  #flori/json#101
  def test_to_json_encoding_result
    hash = {"å"=>1}
    assert_equal(Encoding::UTF_8, hash.to_json.encoding)
  end

end
