require 'sinatra'
require 'httparty'
require 'pry'
require 'json'
require 'cgi'
require './lib/omdb'
require 'dotenv'

get '/' do #Forgot 'do' keyword
  File.read(File.join('views','index.html')) #path.join returns a normalized path merging 'views' and 'index.html' together
end

get 'favorites' do
  response.header['Content-Type'] = 'application/json'
  File.read('data.json')
end

get '/search.json' do
  content_type :json
  client = Sinatra::Omdb::Client.new(ENV["OMDB_API_KEY"]) #Namespace resolution operator

  if title = params[:title]
    response = client.search_title(title)
  elsif keyword = params[:keyword]
    response = client.search_keyword(keyword)
  end

get '/favorites' do
  file = JSON.parse(File.read('data.json'))
  return 'Invalid Request' unless params[:name] && params[:oid] #keyword 'unless' reads better as a statement modifier
  end
  movie = { name: params[:name], oid: params[:oid] }
  file << movie
  File.write('data.json',JSON.pretty_generate(file))
  movie.to_json
end
