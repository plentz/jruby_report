require 'rubygems'
require 'minitest/autorun'

class ModuleRedefinitionTest < MiniTest::Unit::TestCase
  class Foo
    private
    def foo
      p :foo
    end
  end
  
  class Bar < Foo
    public :foo
  end
  
  class Foo
    def foo
      p :redefined
    end
  end

  def test_module_redefinition
    b = Bar.new
    assert_equal b.foo, :redefined
  end
end
