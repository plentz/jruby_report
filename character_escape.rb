# encoding: UTF-8

require 'rubygems'
require 'minitest/autorun'

class ModuleRedefinitionTest < MiniTest::Unit::TestCase
  def test_module_redefinition
    assert_equal /\é/, /\é/
  end
end
