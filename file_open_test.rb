require 'rubygems'
require 'minitest/autorun'

class FileOpenTest < MiniTest::Unit::TestCase

  #works on both
  def test_file_open_line_encoding_when_default_encoding_is_nil
    Encoding.default_internal = nil
    File.open('zh_cn-utf8.txt', 'rb') do |file|
      assert_equal file.gets.encoding, Encoding::ASCII_8BIT
    end
  end

  def test_file_open_line_encoding_when_default_encoding_is_utf8
    Encoding.default_internal = 'utf-8'
    File.open('zh_cn-utf8.txt', 'rb') do |file|
      assert_equal file.gets.encoding, Encoding::ASCII_8BIT
    end
  end
end
