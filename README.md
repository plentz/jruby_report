JRuby 1.6.6(1.9 mode) doesn't work the same way then MRI 1.9.3p0 in these tests. Tried to isolate as much as possible each one.

***
### Ruby MRI 1.9.3p0

````
~/Projects/opensource/jruby_report (master) $ rspec spec
No DRb server is running. Running in local process instead ...
MultiJson::Engines::Yajl
.....

Finished in 0.01431 seconds
5 examples, 0 failures
````

***
### JRuby 1.6.6(1.9 mode)

````
~/Projects/opensource/jruby_report (master) $ jruby --1.9 -S rspec spec
No DRb server is running. Running in local process instead ...
JRuby limited openssl loaded. http://jruby.org/openssl
gem install jruby-openssl for full support.
MultiJson::Engines::JsonGem
F.FFF

Failures:

  1) charpoint should generate the same charpoint in both runtimes 
     Failure/Error: MultiJson.encode({:message => "á"}).should == "{\"message\":\"á\"}"
       expected: "{\"message\":\"á\"}"
            got: "{\"message\":\"\\u00e1\"}" (using ==)
     # ./spec/models/charpoints_spec.rb:9:in `(root)'

  2) MultiJson.engine should decode json even with special chars using a json string directly
     Failure/Error: MultiJson.decode("{\"message\":\"á\"}")['message'].should eq "á"
       
       expected: "á"
            got: "\u00C3\u00A1"
       
       (compared using ==)
     # ./spec/models/json_spec.rb:33:in `(root)'

  3) MultiJson.engine should decode json even with special chars using to_json
     Failure/Error: MultiJson.decode({:message => "á"}.to_json)['message'].should eq "á"
       
       expected: "á"
            got: "\u00C3\u00A1"
       
       (compared using ==)
     # ./spec/models/json_spec.rb:37:in `(root)'

  4) MultiJson.engine should decode json even with special chars using to_json
     Failure/Error: MultiJson.encode({a:"á"}).should match /á/
       expected "{\"a\":\"\\u00e1\"}" to match /á/
     # ./spec/models/json_spec.rb:41:in `(root)'

Finished in 0.203 seconds
5 examples, 4 failures

Failed examples:

rspec ./spec/models/charpoints_spec.rb:8 # charpoint should generate the same charpoint in both runtimes 
rspec ./spec/models/json_spec.rb:32 # MultiJson.engine should decode json even with special chars using a json string directly
rspec ./spec/models/json_spec.rb:36 # MultiJson.engine should decode json even with special chars using to_json
rspec ./spec/models/json_spec.rb:40 # MultiJson.engine should decode json even with special chars using to_json
````