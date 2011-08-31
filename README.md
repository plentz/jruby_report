JRuby 1.6.4(1.9 mode) don't work the same way then MRI 1.9.2p290 with Strings encoding

***
### MRI

````
~/Projects/opensource/utf8_report (master) $ ruby -v
ruby 1.9.2p290 (2011-07-09 revision 32553) [x86_64-darwin10.8.0]
~/Projects/opensource/utf8_report (master) $ rspec spec
No DRb server is running. Running in local process instead ...
F

Failures:

  1) Foo fail
     Failure/Error: foo.save!
     ActiveRecord::RecordInvalid:
       A validação falhou: Name não pode ficar em branco
     # ./spec/models/foo_spec.rb:6:in `block (2 levels) in <top (required)>'

Finished in 0.5308 seconds
1 example, 1 failure

Failed examples:

rspec ./spec/models/foo_spec.rb:4 # Foo fail
````

***
### JRUBY

````
~/Projects/opensource/utf8_report (master) $ ruby -v
jruby 1.6.4 (ruby-1.8.7-p330) (2011-08-23 17ea768) (Java HotSpot(TM) 64-Bit Server VM 1.6.0_26) [darwin-x86_64-java]
~/Projects/opensource/utf8_report (master) $ jruby --1.9 -S rspec spec
No DRb server is running. Running in local process instead ...
F

Failures:

  1) Foo fail
     Failure/Error: foo.save!
     Encoding::CompatibilityError:
       incompatible character encodings: UTF-8 and ASCII-8BIT
     # org/jruby/RubyString.java:2853:in `gsub'
     # ./spec/models/foo_spec.rb:6:in `(root)'
     # org/jruby/RubyBasicObject.java:1717:in `instance_eval'
     # org/jruby/RubyArray.java:2344:in `collect'
     # org/jruby/RubyArray.java:2344:in `collect'

Finished in 0.85 seconds
1 example, 1 failure

Failed examples:

rspec ./spec/models/foo_spec.rb:4 # Foo fail
````