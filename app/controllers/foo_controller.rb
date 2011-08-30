class FooController < ApplicationController
  def index 
    @foo = t :hello
  end
end
