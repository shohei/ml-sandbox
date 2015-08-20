require 'sinatra/base'
require 'sinatra/reloader'
require 'haml'

configure do
  app_root = File.dirname(__FILE__)
  set :public_folder, app_root + '/public'
  set :views, app_root + '/views'
end

get '/' do
  @NUM = 5
  haml :index
end

get '/:num' do
  @NUM = (params['num']).to_i
  haml :index
end

post '/initialize' do
  puts "initialized"
end

post '/memorize' do
  puts "memorized"

end

post '/random' do
  puts "randomized"

end

post '/imagine' do
  puts "imagined"

end

