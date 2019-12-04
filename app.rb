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

post '/' do
    request = JSON.parse request.body.read
    shortened_url = Url.shorten(request["original_url"])
    { :short_url => shortened_url[0], :url => shortened_url[1] }.to_json
end