#!/usr/bin/env rake
require 'rake/testtask'

task :default => :test
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/lib/**/*_test.rb']
  t.verbose = true
end

desc "Run tests"
task :default => :test
