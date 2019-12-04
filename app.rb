require 'sinatra'
require './lib/url'
require 'json'

class UrlShortenerApp < Sinatra::Base
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
        data_request = JSON.parse request.body.read
        shortened_url = Url.shorten(data_request["original_url"])
        { :short_url => shortened_url[0], :url => shortened_url[1] }.to_json
    end

    run! if app_file == $0
end