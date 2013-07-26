require 'sinatra'
require 'omniauth-twitter'
require 'awesome_print'
require 'twitter'
require 'haml'

module BeardedTyrion
  autoload :Source, File.expand_path('../bearded_tyrion/source', __FILE__)
  autoload :Content, File.expand_path('../bearded_tyrion/content', __FILE__)
  autoload :Web, File.expand_path('../bearded_tyrion/web', __FILE__)
  autoload :Twitter, File.expand_path('../bearded_tyrion/twitter', __FILE__)
  autoload :User, File.expand_path('../bearded_tyrion/user', __FILE__)

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
