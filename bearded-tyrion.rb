require 'sinatra'
require 'omniauth-twitter'
require 'awesome_print'
require 'twitter'
require 'haml'
require './logic.rb'

set :haml, {:format => :html5, :attr_wrapper => '"'}

configure do
  set :public_folder, File.dirname(__FILE__) + '/public'

  enable :sessions

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
  haml :index
end
