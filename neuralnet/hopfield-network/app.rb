require 'sinatra/base'
require 'sinatra/reloader'
require 'haml'

configure do
  app_root = File.dirname(__FILE__)
  set :public_folder, app_root + '/public'
  set :views, app_root + '/views'
end

get '/' do
  haml :index
end


