require 'bundler/setup'
Bundler.require

require 'pry'
require File.expand_path('../../lib/bearded_tyrion', __FILE__)

require "minitest/pride"
require "minitest/autorun"
Dir[File.expand_path('../support/*.rb', __FILE__)].each {|f| require f}

