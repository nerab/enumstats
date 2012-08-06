#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << 'lib' << 'test' << 'test/unit' << 'test/acceptance'
  test.pattern = 'test/*/test_*.rb'
end

task :default => :test
