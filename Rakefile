require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  # ref.
  #   https://coveralls.zendesk.com/hc/en-us/articles/201769485-Ruby-Rails
  #   http://stackoverflow.com/questions/12983137/how-do-detect-if-travis-ci-or-not
  #   http://docs.travis-ci.com/user/environment-variables/#Default-Environment-Variables
  if ENV['CI'] == 'true'
    require 'coveralls'
    Coveralls.wear!
  end

  t.libs << "test"
  t.test_files = Dir["test/**/test_*.rb"]
  t.verbose = true
end

task default: :test
