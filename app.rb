require 'sinatra'
require './lib/url'
require 'json'

get '/' do
    erb :index
end