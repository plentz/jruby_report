JRuby 1.6.6(1.9 mode) doesn't work the same way then MRI 1.9.3p0 in these tests. Tried to isolate as much as possible each one.

***
### Ruby MRI 1.9.3p0

````
~/Projects/opensource/jruby_report (master) $ ruby -I. yajl_test.rb 
Run options: --seed 49802

 Running tests:

.

Finished tests in 0.000746s, 1340.4826 tests/s, 1340.4826 assertions/s.

1 tests, 1 assertions, 0 failures, 0 errors, 0 skips
~/Projects/opensource/jruby_report (master) $ ruby -I. ok_json_test.rb 
Run options: --seed 64345

 Running tests:

F

Finished tests in 0.031096s, 32.1585 tests/s, 32.1585 assertions/s.

  1) Failure:
test_json_decoder(OkJsonTest) [ok_json_test.rb:12]:
Expected: "á"
  Actual: "\xEF\xBF\xBD"

1 tests, 1 assertions, 1 failures, 0 errors, 0 skips
````

***
### JRuby 1.6.6(1.9 mode)

````
~/Projects/opensource/jruby_report (master) $ ruby -I. yajl_test.rb
Loaded suite yajl_test
Started
F
Finished in 0.022000 seconds.

  1) Failure:
test_json_encoder(YajlTest) [yajl_test.rb:12]:
Expected "{\"message\":\"á\"}", not "{\"message\":\"\u00C3\u00A1\"}".

1 tests, 1 assertions, 1 failures, 0 errors, 0 skips

Test run options: --seed 11984
~/Projects/opensource/jruby_report (master) $ ruby -I. ok_json_test.rb 
Loaded suite ok_json_test
Started
F
Finished in 0.037000 seconds.

  1) Failure:
test_json_decoder(OkJsonTest) [ok_json_test.rb:12]:
Expected "á", not "\u00EF\u00BF\u00BD".

1 tests, 1 assertions, 1 failures, 0 errors, 0 skips

Test run options: --seed 5352
````