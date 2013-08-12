$:.unshift File.dirname(__FILE__)

require 'sinatra'
require 'omniauth-twitter'
require 'awesome_print'
require 'twitter'
require 'haml'
require 'active_model'
require 'active_support/inflector'
require 'active_support/core_ext/enumerable'

module BeardedTyrion
  autoload :Form, 'bearded_tyrion/form'
  autoload :Downloader, 'bearded_tyrion/downloader'
  autoload :Source, 'bearded_tyrion/source'
  autoload :Format, 'bearded_tyrion/format'
  autoload :OptionsGroup, 'bearded_tyrion/options_group'
  autoload :Content, 'bearded_tyrion/content'
  autoload :Web, 'bearded_tyrion/web'
  autoload :Twitter, 'bearded_tyrion/twitter'
  autoload :User, 'bearded_tyrion/user'

  class << self
    def consumer_key
      raise "Missing CONSUMER_KEY in ENV!" unless ENV["CONSUMER_KEY"]

      ENV["CONSUMER_KEY"]
    end

    def consumer_secret
      raise "Missing CONSUMER_SECRET in ENV!" unless ENV["CONSUMER_SECRET"]

      ENV["CONSUMER_SECRET"]
    end
  end
end
