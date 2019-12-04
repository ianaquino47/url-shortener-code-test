require 'sinatra'
require './lib/url'
require 'json'

get '/' do
    erb :index
end

post '/create_shortened_url' do
    shortened_url = Url.shorten(params[:original_url].to_s)
	redirect to('/')
end