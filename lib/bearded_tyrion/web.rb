require 'sinatra/base'

require File.expand_path('../../bearded_tyrion', __FILE__)

class BeardedTyrion::Web < Sinatra::Base
  enable :raise_errors
  enable :dump_errors
  set :haml, {:format => :html5, :attr_wrapper => '"'}

  set :public_folder, File.expand_path('../../../public', __FILE__)

  use OmniAuth::Builder do
    provider :twitter, BeardedTyrion.consumer_key, BeardedTyrion.consumer_secret
  end

  enable :reload_templates
  enable :sessions

  helpers do
    def root_path
      "#{env['SCRIPT_NAME']}/"
    end
  end

  # Support both GET and POST for callbacks
  %w(get post).each do |method|
    send(method, "/auth/:provider/callback") do
      user = BeardedTyrion::User.populate_from_oauth env['omniauth.auth']

      session[:auth] = user.to_session

      redirect '/'
    end
  end

  get '/auth/signout' do
    session[:auth] = nil
    redirect '/'
  end

  get '/auth/failure' do
    #flash[:notice] = params[:message]
    redirect '/'
  end

  get '/' do
    current_user = BeardedTyrion::User.populate_from_session(session)
    twitter = BeardedTyrion::Twitter.new(current_user)
    content = BeardedTyrion::Content.new
    source = BeardedTyrion::Source.new
    format = BeardedTyrion::Format.new

    binding.pry
    haml :index, locals: {
      form: BeardedTyrion::Form.new,
      current_user: current_user,
      content: content,
      source: source,
      format: format
    }
  end

  post '/download' do
    content = BeardedTyrion::Content.new
    source = BeardedTyrion::Source.new
    format = BeardedTyrion::Format.new

    content.fill_params params
    source.fill_params params
    format.fill_params params

    downloader = BeardedTyrion::Downloader.new source, content, format

    headers downloader.headers
    body downloader.body
  end
end
