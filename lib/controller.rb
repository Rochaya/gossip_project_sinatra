require 'gossip'
class ApplicationController < Sinatra::Base
    get '/' do
      erb :index, locals: {gossips: Gossip.all}
    end
    get '/gossips/new/' do
      erb :new_gossip
    end
    
    post '/gossips/new/' do
      Gossip.new(params["gossip_name"], params["gossip_content"]).save
      redirect "/"
    end

    get '/gossips/:id/' do
      "Ceci est la page #{params["id"]}"
      if Gossip.find(params["id"])[0] != "" && Gossip.find(params["id"])[1] != ""
        erb :show, locals: {array_gossip: Gossip.find(params["id"]), gossip_id: params["id"]}
      else
        redirect "/"
      end
    end
end