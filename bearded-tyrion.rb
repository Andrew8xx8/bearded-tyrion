require 'sinatra'
require 'omniauth-twitter'
require 'awesome_print'
require 'twitter'
require './logic.rb'

configure do
  enable :sessions
end

configure :development do
  use OmniAuth::Builder do
    provider :twitter, consumer_key, consumer_secret
  end
end

# Support both GET and POST for callbacks
%w(get post).each do |method|
  send(method, "/auth/:provider/callback") do
    session[:auth] = parse_omniauth env['omniauth.auth']
    redirect '/'
  end
end

get '/auth/failure' do
  flash[:notice] = params[:message]
  redirect '/'
end

get '/' do
  client = twitter_client

  ap client
  ap session[:auth]

  if client
    client.friends
  end
end
