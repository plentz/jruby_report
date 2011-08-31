class Foo
  include ActiveModel::Validations
  attr_accessor :name
  validates_presence_of :name
end
