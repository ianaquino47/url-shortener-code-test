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

get '/:original_url' do
    redirect to(Url.links[params[:original_url]])
end