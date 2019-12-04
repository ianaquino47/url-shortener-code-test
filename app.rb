require 'sinatra'
require './lib/url'
require 'json'

get '/' do
    erb :index
end

post '/create_shortened_url' do
    shortened_url = Url.shorten(params[:original_url].to_s)
    { shortened_url[0] => shortened_url[1] }.to_json
	redirect to('/')
end