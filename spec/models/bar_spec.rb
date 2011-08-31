require 'spec_helper'

describe Bar do
  it "should know how to reload a record" do
    bar = Bar.create(:name => "a")
    puts "hey, look mommy! ->>>> #{Bar.last.id}"
    bar.reload
  end
end
