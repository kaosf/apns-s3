require 'coveralls'
require 'simplecov'
require 'test/unit'
require 'test/unit/rr'

Coveralls.wear!
SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start

# require order ref. http://qiita.com/bsdmad/items/ab8b7d92d965df8bb2d8

# ref.
#   https://coveralls.zendesk.com/hc/en-us/articles/201769485-Ruby-Rails
#   http://stackoverflow.com/questions/12983137/how-do-detect-if-travis-ci-or-not
#   http://docs.travis-ci.com/user/environment-variables/#Default-Environment-Variables
