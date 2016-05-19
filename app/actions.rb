# HOME
get '/' do
  erb :index
end

# TRUCKS
get '/trucks' do
  @trucks = Truck.all
  erb :'/trucks/index'
end


get '/trucks/:name' do
  erb :'/trucks/show'
end


post '/trucks/:id/favourite' do
end


# USERS
get '/users/:id' do
end


# FAVOURITES 

get '/users/:id/favourites' do
end

get '/users/:id/favourites/:id/delete' do
end


# SEARCH RESULTS

get '/search' do
end



