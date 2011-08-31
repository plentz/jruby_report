JRuby 1.6.4(1.9 mode) doesn't work the same way then MRI 1.9.2p290 with String encoding

***
### Ruby MRI 1.9.2p290

````
~/Projects/opensource/utf8_report (master) $ rspec spec
No DRb server is running. Running in local process instead ...
...

Finished in 0.62514 seconds
3 examples, 0 failures
````

***
### JRuby 1.6.4(1.9 mode)

````
~/Projects/opensource/utf8_report (master) $ jruby --1.9 -S rspec spec
No DRb server is running. Running in local process instead ...
FF.

Failures:

  1) Foo should do the right interpolation for error messages
     Failure/Error: lambda{foo.save!}.should raise_error ActiveRecord::RecordInvalid
       expected ActiveRecord::RecordInvalid, got #<Encoding::CompatibilityError: incompatible character encodings: UTF-8 and ASCII-8BIT>
     # ./spec/models/foo_spec.rb:8:in `(root)'
     # org/jruby/RubyBasicObject.java:1717:in `instance_eval'
     # org/jruby/RubyArray.java:2344:in `collect'
     # org/jruby/RubyArray.java:2344:in `collect'

  2) Foo should decode json even with special chars
     Failure/Error: ActiveSupport::JSON.decode({:message => "á"}.to_json)['message'].should eq "á"
       
       expected "á"
            got "Ã¡"
       
       (compared using ==)
     # ./spec/models/foo_spec.rb:12:in `(root)'
     # org/jruby/RubyBasicObject.java:1717:in `instance_eval'
     # org/jruby/RubyArray.java:2344:in `collect'
     # org/jruby/RubyArray.java:2344:in `collect'

Finished in 1.08 seconds
3 examples, 2 failures

Failed examples:

rspec ./spec/models/foo_spec.rb:6 # Foo should do the right interpolation for error messages
rspec ./spec/models/foo_spec.rb:11 # Foo should decode json even with special chars

````