require 'sinatra'
require 'omniauth-twitter'
require 'awesome_print'
require 'twitter'
require 'haml'

module BeardedTyrion
  autoload 'Web', File.expand_path('../bearded_tyrion/web', __FILE__)
  autoload 'Twitter', File.expand_path('../bearded_tyrion/twitter', __FILE__)
  autoload 'User', File.expand_path('../bearded_tyrion/user', __FILE__)
end
