JRuby 1.6.6(1.9 mode) doesn't work the same way then MRI 1.9.3p125 in these tests. Tried to isolate as much as possible each one.

***
### Ruby MRI 1.9.3p125

````
~/Projects/opensource/jruby_report (master) $ ruby -I. ok_json_test.rb 
Run options: --seed 51490

 Running tests:

."\xEF\xBF\xBD"
.F

Finished tests in 0.035402s, 84.7410 tests/s, 84.7410 assertions/s.

  1) Failure:
test_json_encode(OkJsonTest) [ok_json_test.rb:14]:
Expected: "{\"message\":\"á\"}"
  Actual: "{\"message\":\"\\ufffd\"}"

3 tests, 3 assertions, 1 failures, 0 errors, 0 skips
~/Projects/opensource/jruby_report (master) $ ruby -I. yajl_test.rb 
Run options: --seed 34463

 Running tests:

.

Finished tests in 0.000859s, 1164.1444 tests/s, 1164.1444 assertions/s.

1 tests, 1 assertions, 0 failures, 0 errors, 0 skips
````

***
### JRuby 1.6.6(1.9 mode)

````
~/Projects/opensource/jruby_report (master) $ ruby -I. ok_json_test.rb 
Loaded suite ok_json_test
Started
."\u00EF\u00BF\u00BD"
.F
Finished in 0.064000 seconds.

  1) Failure:
test_json_encode(OkJsonTest) [ok_json_test.rb:14]:
Expected "{\"message\":\"á\"}", not "{\"message\":\"\\ufffd\"}".

3 tests, 3 assertions, 1 failures, 0 errors, 0 skips

Test run options: --seed 11658
~/Projects/opensource/jruby_report (master) $ ruby -I. yajl_test.rb 
Loaded suite yajl_test
Started
F
Finished in 0.022000 seconds.

  1) Failure:
test_json_encoder(YajlTest) [yajl_test.rb:12]:
Expected "{\"message\":\"á\"}", not "{\"message\":\"\u00C3\u00A1\"}".

1 tests, 1 assertions, 1 failures, 0 errors, 0 skips

Test run options: --seed 2044
````