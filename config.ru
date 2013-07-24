require 'rubygems'

require 'bundler/setup'
Bundler.require

require File.expand_path('../lib/bearded_tyrion', __FILE__)

run BeardedTyrion::Web
