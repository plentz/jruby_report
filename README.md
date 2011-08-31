JRuby 1.6.4(1.9 mode) doesn't work the same way then MRI 1.9.2p290 in these tests. Tried to isolate as much as possible each one.

***
### Ruby MRI 1.9.2p290

````
~/Projects/opensource/jruby_report (master) $ rspec spec
No DRb server is running. Running in local process instead ...
...

Finished in 0.50567 seconds
3 examples, 0 failures
````

***
### JRuby 1.6.4(1.9 mode)

````
~/Projects/opensource/jruby_report (master) $ jruby --1.9 -S rspec spec
No DRb server is running. Running in local process instead ...
JRuby limited openssl loaded. http://jruby.org/openssl
gem install jruby-openssl for full support.
DEPRECATION WARNING: Arel::Visitors::VISITORS is deprecated and will be removed. Database adapters should define a visitor_for method which returns the appropriate visitor for the database. For example, MysqlAdapter.visitor_for(pool) returns Arel::Visitors::MySQL.new(pool). (called from mon_synchronize at /Users/plentz/.rvm/rubies/jruby-1.6.4/lib/ruby/1.9/monitor.rb:201)
hey, look mommy! ->>>> 7
FFF

Failures:

  1) Bar should know how to reload a record
     Failure/Error: bar.reload
     ActiveRecord::RecordNotFound:
       Couldn't find Bar with id=7
     # org/jruby/RubyBasicObject.java:1697:in `__send__'
     # org/jruby/RubyBasicObject.java:1697:in `__send__'
     # org/jruby/RubyKernel.java:2121:in `send'
     # ./spec/models/bar_spec.rb:7:in `(root)'
     # org/jruby/RubyBasicObject.java:1717:in `instance_eval'
     # org/jruby/RubyArray.java:2344:in `collect'
     # org/jruby/RubyArray.java:2344:in `collect'

  2) Foo should do the right interpolation for error messages
     Failure/Error: lambda{I18n.t("errors.messages.record_invalid", :errors => foo.errors.full_messages)}.should_not raise_error
       expected no Exception, got #<Encoding::CompatibilityError: incompatible character encodings: UTF-8 and ASCII-8BIT>
     # ./spec/models/foo_spec.rb:9:in `(root)'
     # org/jruby/RubyBasicObject.java:1717:in `instance_eval'
     # org/jruby/RubyArray.java:2344:in `collect'
     # org/jruby/RubyArray.java:2344:in `collect'

  3) Foo should decode json even with special chars
     Failure/Error: ActiveSupport::JSON.decode({:message => "á"}.to_json)['message'].should eq "á"
       
       expected "á"
            got "\xC3\xA1"
       
       (compared using ==)
     # ./spec/models/foo_spec.rb:13:in `(root)'
     # org/jruby/RubyBasicObject.java:1717:in `instance_eval'
     # org/jruby/RubyArray.java:2344:in `collect'
     # org/jruby/RubyArray.java:2344:in `collect'

Finished in 1.12 seconds
3 examples, 3 failures

Failed examples:

rspec ./spec/models/bar_spec.rb:4 # Bar should know how to reload a record
rspec ./spec/models/foo_spec.rb:6 # Foo should do the right interpolation for error messages
rspec ./spec/models/foo_spec.rb:12 # Foo should decode json even with special chars

````