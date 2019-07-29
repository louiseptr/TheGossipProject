require 'gossip'

class ApplicationController < Sinatra::Base

get '/' do
  erb :index, locals: {gossips: Gossip.all}
end
  
get '/gossips/new/' do
  erb :new_gossip
end

get '/gossips/:id/' do
  "Voici le numéro du potin que tu veux : #{params['id']}!"
end

post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/'
end

get 'gossips/:id' do
  Gossip.find(params['id'])

end

get '/gossips/:id/' do |id|
  erb :gossip_page, locals: {id: id, gossip: Gossip.find(id.to_i - 1)}
end

end