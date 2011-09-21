JRuby 1.6.4(1.9 mode) doesn't work the same way then MRI 1.9.2p290 in these tests. Tried to isolate as much as possible each one.

***
### Ruby MRI 1.9.2p290

````
~/Projects/opensource/jruby_report (master) $ rspec spec
No DRb server is running. Running in local process instead ...
F...

Failures:

  1) charpoint should generate the same charpoint in both runtimes 
     Failure/Error: MultiJson.encode({:message => "á"}).should == "{\"message\":\"á\"}"
       expected: "{\"message\":\"á\"}"
            got: "{\"message\":\"\\u00e1\"}" (using ==)
     # ./spec/models/charpoints_spec.rb:9:in `block (2 levels) in <top (required)>'

Finished in 0.02677 seconds
4 examples, 1 failure

Failed examples:

rspec ./spec/models/charpoints_spec.rb:8 # charpoint should generate the same charpoint in both runtimes 
````

***
### JRuby 1.6.4(1.9 mode)

````
~/Projects/opensource/jruby_report (master) $ jruby --1.9 -S rspec spec/models/foo_spec.rb 
^C~/Projects/opensource/jruby_report (master) $ jruby --1.9 -S rspec spec
No DRb server is running. Running in local process instead ...
JRuby limited openssl loaded. http://jruby.org/openssl
gem install jruby-openssl for full support.
FF.F

Failures:

  1) charpoint should generate the same charpoint in both runtimes 
     Failure/Error: MultiJson.encode({:message => "á"}).should == "{\"message\":\"á\"}"
       expected: "{\"message\":\"á\"}"
            got: "{\"message\":\"\\ufffd\"}" (using ==)
     # ./spec/models/charpoints_spec.rb:9:in `(root)'
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

  3) jruby json should decode json even with special chars using to_json
     Failure/Error: MultiJson.decode({:message => "á"}.to_json)['message'].should eq "á"
       
       expected "á"
            got "\xC3\xA1"
       
       (compared using ==)
     # ./spec/models/json_spec.rb:14:in `(root)'
     # org/jruby/RubyBasicObject.java:1717:in `instance_eval'
     # org/jruby/RubyArray.java:2344:in `collect'
     # org/jruby/RubyArray.java:2344:in `collect'

Finished in 0.475 seconds
4 examples, 3 failures

Failed examples:

rspec ./spec/models/charpoints_spec.rb:8 # charpoint should generate the same charpoint in both runtimes 
rspec ./spec/models/foo_spec.rb:6 # Foo should do the right interpolation for error messages
rspec ./spec/models/json_spec.rb:13 # jruby json should decode json even with special chars using to_json
````