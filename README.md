JRuby 1.6.6(1.9 mode) doesn't work the same way then MRI 1.9.3p0 in these tests. Tried to isolate as much as possible each one.

***
### Ruby MRI 1.9.3p0

````
~/Projects/opensource/jruby_report (master) $ rspec spec
No DRb server is running. Running in local process instead ...
F.

Failures:

  1) OkJson.engine should generate the same char codepoint in both implementations(actually it generates \u00C3\u00A1 for jruby and \xC3\xA1 for mri)
     Failure/Error: MultiJson.decode({:message => "á"}.to_json)['message'].should eq "á"
       
       expected: "á"
            got: "\xC3\xA1"
       
       (compared using ==)
     # ./spec/models/ok_json_spec.rb:9:in `block (2 levels) in <top (required)>'

Finished in 0.00474 seconds
2 examples, 1 failure

Failed examples:

rspec ./spec/models/ok_json_spec.rb:8 # OkJson.engine should generate the same char codepoint in both implementations(actually it generates \u00C3\u00A1 for jruby and \xC3\xA1 for mri)
````

***
### JRuby 1.6.6(1.9 mode)

````
~/Projects/opensource/jruby_report (master) $ jruby --1.9 -S rspec spec
No DRb server is running. Running in local process instead ...
JRuby limited openssl loaded. http://jruby.org/openssl
gem install jruby-openssl for full support.
MultiJson::Engines::OkJson
FF

Failures:

  1) OkJson.engine should generate the same char codepoint in both implementations(actually it generates \u00C3\u00A1 for jruby and \xC3\xA1 for mri)
     Failure/Error: MultiJson.decode({:message => "á"}.to_json)['message'].should eq "á"
       
       expected: "á"
            got: "\u00C3\u00A1"
       
       (compared using ==)
     # ./spec/models/ok_json_spec.rb:10:in `(root)'

  2) Yajl::Encoder should encode the yml even with special chars in both implementations
     Failure/Error: Yajl::Encoder.encode({:message => "á"}).should == "{\"message\":\"á\"}"
       expected: "{\"message\":\"á\"}"
            got: "{\"message\":\"\u00C3\u00A1\"}" (using ==)
     # ./spec/models/yajl_encoding_spec.rb:8:in `(root)'

Finished in 0.034 seconds
2 examples, 2 failures

Failed examples:

rspec ./spec/models/ok_json_spec.rb:9 # OkJson.engine should generate the same char codepoint in both implementations(actually it generates \u00C3\u00A1 for jruby and \xC3\xA1 for mri)
rspec ./spec/models/yajl_encoding_spec.rb:7 # Yajl::Encoder should encode the yml even with special chars in both implementations
````