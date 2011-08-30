require 'spec_helper'

describe Foo do
  it "fail" do
    foo = Foo.new
    foo.save!
  end
end
